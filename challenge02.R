rm(list=ls())
ls()

install.packages("tidyverse")
install.packages("ggplot2")
install.packages("ggtheme")
install.packages("ggthemr")
install.packages("showtext")
install.packages("sysfonts")
install.packages("showtextdb")

library(showtext)
library(sysfonts) 
library(tidyverse)
library(ggplot2)
library(ggthemes)


font_add_google(name = "Roboto Condensed",   # Name of the font as it is listed on Google fonts
                family = "roboto") # Name we'll use in theme()

challenge02 <- readr::read_csv("https://raw.githubusercontent.com/ajstarks/dubois-data-portraits/master/challenge/2024/challenge02/data.csv")



plot <- ggplot(data=challenge02,aes(x=Year,y=Free))+
  geom_line()+
  theme_minimal()+
  labs(
    title = "SLAVES AND FREE NEGROES.",
    caption = "Source: Du Bois Data Portaits") +
  theme(#text = element_text('mono'),
    #axis.title.x=element_blank(),
    #axis.text.x=element_blank(),
    #panel.background = element_blank(),
    plot.title = element_text(hjust = 0.5, size=23, face = "bold"),
    plot.background = element_rect(fill = 'cornsilk')) +
  scale_x_reverse(#expand = c(0, 0), 
                    breaks = seq(0, 1870, 10), 
                    limits = c(1870,1790)) +
  scale_y_reverse(#expand = c(0, 0), 
                    breaks = seq(0, 1.8, 0.5), 
                    limits = c(1.8, 0.5)) +
  coord_flip() 


plot

ggsave("c02.png", width = 8, height = 20, units = "cm")
