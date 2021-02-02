library(tidyverse)


dat <- read_csv("CA_homicide.csv")
popdat<-read_csv("CA_popdat.csv")

rdat <- tibble(Place=dat$Place,
               Region=c("all",rep("Atlantic",4),
                        rep("East",2),
                        rep("West",4),
                        rep("North",3)))
head(rdat)

##convert from wide to long format

sdat <- (dat
         %>% pivot_longer(names_to="year",values_to="homicides",-Place,
                          names_transform=list(year=as.numeric))
)

##could also do %>%mutate(year=as.numeri(year)) instead of the names_transform=list lign above, has to do with language constantly being updated, i think 
##add region and pop size into the homicide data 
head(sdat)

sdat2 <- sdat %>%
  full_join(rdat,by="Place") %>%
  full_join(popdat,by="Place")

dmat <- as.matrix(dat[,-1])
rownames(dmat) <- dat$Place
rowMeans(dmat)  ## means by place

## fuzzy joins 

###part 2
sdat3 <- (sdat2
          %>% mutate(Place=forcats::fct_reorder(Place,Pop_2011)))

##rearranging the order of the rows in the data set 
sdat2 %>% arrange(Pop_2011)
##does not affect plots 

saveRDS(sdat3, file = "CA_homicide.rds")

mdat<- readRDS("CA_homicide.rds")

library(ggplot2)

theme_set(theme_bw())


p1 <- ggplot(mdat,aes(year,homicides,colour=Place))

print(p1+geom_line())

print(p1+geom_line() +geom_point())

p1L <- (p1
        + geom_line()
        + scale_y_log10()
        + labs(y="Homicides per 100,000 population")
)
print(p1L)
##boxplots
b1 <- (ggplot(mdat,aes(x=Place,y=homicides,
                       colour=Region))
       + geom_boxplot(outlier.colour=NULL)  ## set outlier points to same colour as boxes
       + scale_y_log10()
       + labs(y="Homicides per 100,000 population")
)
print(b1)

b1_vertlabels <- b1+theme(axis.text.x=element_text(angle=90))
print(b1_vertlabels)


mdat_sort <- mdat %>% mutate(across(Place,~forcats::fct_reorder(.,homicides)))
print(b1
      %+% mdat_sort  ## substitute sorted data
      + coord_flip()      ## rotate entire plot
      + xlab("")          ## x-label redundant
      + scale_colour_brewer(palette="Dark2") ## change palette
)
print(p1L+facet_wrap(~Region))

p2 <- (ggplot(mdat,
              aes(year,homicides,colour=Region,size=Pop_2011,
                  group=Place))
       + geom_line(alpha=0.5)
       + scale_y_log10()
       + scale_size_continuous(trans="log10")
       + labs(y="Homicides per 100,000 population")
)
print(p2)
