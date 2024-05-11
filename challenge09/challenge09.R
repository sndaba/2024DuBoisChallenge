#install packages to be used in the code
install.packages("ggplot2")
install.packages("tidyverse")

#load packages
library(ggplot2)
library(tidyverse)

#read and extract the data
challenge09 <- readr::read_csv("https://raw.githubusercontent.com/sndaba/2024DuBoisChallengeInRstats/main/challenge09/challenge09data.csv")

#take a peek at the data
#view(challenge09)


# Convert the dataset from wide to long format_
#easier to work with data in long format for certain types of analyses and visualizations, 
#especially when dealing with categorical variables or when you need to perform certain operations 
#like plotting multiple variables in a single graph.
data_long <- tidyr::pivot_longer(challenge09, -Year, names_to = "Status", values_to = "Count")



# Create the stacked area plot
ggplot(data_long, aes(x = Year, y = Count, fill = Status)) +
  geom_area(color = "black") +
  scale_fill_manual(values = c("green", "black")) +
  annotate(geom = "text", label="SLAVES\nESCLAVES", fontface="bold",size=8,colour="white",x=1825,y=50)+
  annotate(geom = "text", label="FREE - LIBRE",fontface="bold",size=7,colour ="black",x=1825,y=95)+
  annotate(geom = "text", label="1790", fontface="bold",size=6,colour="black",x=1790,y=103)+
  annotate(geom = "text", label="8%", fontface="bold",size=5,colour="black",x=1790,y=93)+
  annotate(geom = "text", label="1800", fontface="bold",size=6,colour="black",x=1800,y=103)+
  annotate(geom = "text", label="11%", fontface="bold",size=5,colour="black",x=1800,y=90)+
  annotate(geom = "text", label="1810", fontface="bold",size=6,colour="black",x=1810,y=103)+
  annotate(geom = "text", label="13.5%", fontface="bold",size=5,colour="black",x=1810,y=88.5)+
  annotate(geom = "text", label="1820", fontface="bold",size=6,colour="black",x=1820,y=103)+
  annotate(geom = "text", label="13%", fontface="bold",size=5,colour="black",x=1820,y=89)+
  annotate(geom = "text", label="1830", fontface="bold",size=6,colour="black",x=1830,y=103)+
  annotate(geom = "text", label="14%", fontface="bold",size=5,colour="black",x=1830,y=88)+
  annotate(geom = "text", label="1840", fontface="bold",size=6,colour="black",x=1840,y=103)+
  annotate(geom = "text", label="13.%", fontface="bold",size=5,colour="black",x=1840,y=89)+
  annotate(geom = "text", label="1850", fontface="bold",size=6,colour="black",x=1850,y=103)+
  annotate(geom = "text", label="12%", fontface="bold",size=5,colour="black",x=1850,y=90)+
  annotate(geom = "text", label="1860", fontface="bold",size=6,colour="black",x=1860,y=103)+
  annotate(geom = "text", label="11%", fontface="bold",size=5,colour="black",x=1860,y=91)+
  annotate(geom = "text", label="1870", fontface="bold",size=6,colour="black",x=1870,y=103)+
  annotate(geom = "text", label="100%", fontface="bold",size=5,colour="black",x=1870,y=90)+
  theme_void()+
  labs(title = "PROPORTION OF FREEMEN AND SLAVES AMONG AMERICAN NEGROES .\n\nPROPORTION DES NÈGRES LIBRES ET DES ESCLAVES EN AMÉRIQUE.",
       subtitle = "DONE BY ATLANTA UNIVERSITY.\n\n",
       caption = "source: 1900 Paris Exposition Plate 51 | graphic: simindaba")+
  theme(plot.title = element_text(hjust=0.5,size = 16,family="mono",colour = "black", face = "bold"),
        plot.caption = element_text(hjust=0.5,family="mono",face="bold",size = 14, colour = "black"),
        plot.subtitle = element_text(hjust=0.5,family="mono",face="bold",size = 12, colour = "black"),
        plot.background = element_rect(fill = 'papayawhip'),
        legend.position = "none")

ggsave("challenge09.png",width = 10,height = 12)
