install.packages("ggplot2")
install.packages("dplyr")
install.packages("maps")
install.packages("ggtext")
install.packages("ggforce")
install.packages("ggfx")
install.packages("patchwork")
install.packages("cowplot")
install.packages("ggforce")
install.packages("ggthemes") # Install 

library(ggthemes) # Load
library(ggplot2)
library(dplyr)
library(maps)
library(ggtext)
library(ggfx)
library(patchwork)
library(cowplot)
library(ggforce)

                              #getting the 1870 data
data1870 = read.csv("https://raw.githubusercontent.com/sndaba/2024DuBoisChallengeInRstats/main/challenge01/data1870.csv")

                              #getting the 1880 data
data1880 = read.csv("https://raw.githubusercontent.com/sndaba/2024DuBoisChallengeInRstats/main/challenge01/data1880.csv")

                               #data wrangling 1870 data
names(data1870) <- tolower(names(data1870))
colnames(data1870) <- c('subregion','population') 
data1870$subregion<-tolower(data1870$subregion)

                              #data wrangling 1880 data
names(data1880) <- tolower(names(data1880))
colnames(data1880) <- c('subregion','population') 
data1880$subregion<-tolower(data1880$subregion)

                             #using map() to get subregion
world <- map_data("world")

usa_states <- map_data("state")
georgia <- subset(usa_states, region %in% c("georgia"))

usa_counties <- map_data("county")
georgia_counties <- subset(usa_counties, region == "georgia")

                                      #merging columns
data1870_georgia_counties <- left_join(georgia_counties, data1870,by="subregion")
data1880_georgia_counties <- left_join(georgia_counties, data1880,by="subregion")

                                     #ordering columns
data1870_georgia_counties <- data1870_georgia_counties[,c(2,3,4,5,6,1,7)]
data1880_georgia_counties <- data1880_georgia_counties[,c(2,3,4,5,6,1,7)]

                              #changing population values in 1870
data1870_georgia_counties$population[data1870_georgia_counties$population == '> 1000'] <- 1000
data1870_georgia_counties$population[data1870_georgia_counties$population == '> 1000 - 2500'] <- 1000 - 2500
data1870_georgia_counties$population[data1870_georgia_counties$population == '> 2500 - 5000'] <- 2500 - 5000
data1870_georgia_counties$population[data1870_georgia_counties$population == '> 5000 - 10000'] <- 5000 - 10000
data1870_georgia_counties$population[data1870_georgia_counties$population == '> 10000 - 15000'] <- 10000 - 15000
data1870_georgia_counties$population[data1870_georgia_counties$population == '> 15000 - 20000'] <- 15000 - 20000
data1870_georgia_counties$population[data1870_georgia_counties$population == '> 20000 - 30000'] <- 20000 - 30000

                             #changing population values in 1880
data1880_georgia_counties$population[data1880_georgia_counties$population == '> 1000'] <- 1000
data1880_georgia_counties$population[data1880_georgia_counties$population == '> 1000 - 2500'] <- 1000 - 2500
data1880_georgia_counties$population[data1880_georgia_counties$population == '> 2500 - 5000'] <- 2500 - 5000
data1880_georgia_counties$population[data1880_georgia_counties$population == '> 5000 - 10000'] <- 5000 - 10000
data1880_georgia_counties$population[data1880_georgia_counties$population == '> 10000 - 15000'] <- 10000 - 15000
data1880_georgia_counties$population[data1880_georgia_counties$population == '> 15000 - 20000'] <- 15000 - 20000
data1880_georgia_counties$population[data1880_georgia_counties$population == '> 20000 - 30000'] <- 20000 - 30000

                                        #plotting 1870
a <- ggplot(data = data1870_georgia_counties, 
       aes(x = long, y = lat, group = group, fill = population)) + 
  geom_polygon(data = data1870_georgia_counties, 
               mapping = aes(long, lat, group = group),  color = "black") +
  scale_fill_manual(values = c("white","darkgreen", "yellow", "#CC9966", "chocolate4", "midnightblue","lightsalmon", "#FF0000", "white")) +
  coord_fixed(1.4) + 
  theme_void() +
  labs(#title="NEGRO POPULATION OF GEORGIA BY COUNTIES",
       fill = "population") +
  theme(legend.position="none") +
  annotate(geom = "text", 
    x = -84.6, y = 35.3, 
    size = 4, color = "black", lineheight = .9,
    label = "1870" , fontface = "bold")
a


                                    #Top right Legend:
df <- data.frame(x=c(1, 2, 2, 3, 3, 4, 8, 10),
                 y=c(2, 4, 5, 4, 7, 9, 10, 12)) 
b <- ggplot(data = df, aes(x, y)) +
  theme_void() +
  geom_circle(aes(x0=1, y0=8, r=0.2),
              fill='midnightblue', inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=6, r=0.2),
              fill='chocolate4',inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=4, r=0.2),
              fill='tan', inherit.aes=FALSE) +
  scale_x_continuous(expand = c(0, 0), 
                     #breaks = seq(0, 10, 1000), 
                     limits = c(0, 10)) +
  coord_fixed() +
  annotate(geom = "text", 
         x = 3.5 , y = 4, 
         size = 4 , color = "black", lineheight = .6,
         label = "10,000 TO 15 000") + 
  annotate(geom = "text", 
           x = 3.5, y = 6, 
           size = 4, color = "black", lineheight = .6,
           label = "15,000 TO 20 000") +
  annotate(geom = "text", 
           x = 4, y = 8, 
           size = 4, color = "black", lineheight = .6,
           label = "BETWEEN 20,000 TO 30 000")
b


                                     #Bottom left Legend:
dff <- data.frame(x=c(1, 2, 2, 3, 3, 4, 8, 10),
                y=c(2, 4, 5, 4, 7, 9, 10, 12))
c <- ggplot(data = dff, aes(x, y)) +
  theme_void()+
  geom_circle(aes(x0=1, y0=11, r=0.5),
              fill='#FF0000', inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=8, r=0.5),
              fill='lightsalmon', inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=5, r=0.5),
              fill='yellow',inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=2, r=0.5),
              fill='darkgreen',inherit.aes=FALSE) +
  scale_x_continuous(expand = c(0, 0), 
                     #breaks = seq(0, 10, 1000), 
                     limits = c(0, 10)) +
  coord_fixed() +
  annotate(geom = "text", 
           x = 6, y = 2, 
           size = 4, color = "black", lineheight = .6,
           label = "UNDER 1,000") + 
  annotate(geom = "text", 
           x = 6, y = 5, 
           size = 4, color = "black", lineheight = .6,
           label = "1,000 TO 20 000") +
  annotate(geom = "text", 
           x = 6, y = 8, 
           size = 4, color = "black", lineheight = .6,
           label = "20,000 TO 30 000") +
  annotate(geom = "text", 
           x = 6, y = 11, 
           size = 4, color = "black", lineheight = .6,
           label = "10,000 TO 15 000")
c


                                      #plotting 1880
d <- ggplot(data = data1880_georgia_counties, 
            aes(x = long, y = lat, group = group, fill = population)) + 
  geom_polygon(data = data1880_georgia_counties, 
               mapping = aes(long, lat, group = group),  color = "black") +
  scale_fill_manual(values = c("darkgreen","yellow", "#CC9966", "chocolate4","#330033",  "lightsalmon" , "#FF0000", "white")) +
  coord_fixed(1.4) + 
  theme_void() +
  labs(fill = "population") +
  theme(legend.position="none") +
  annotate(geom = "text", 
           x = -84.6, y = 35.5, 
           size = 4, color = "black", lineheight = .9,
           label = "1880" , fontface = "bold")
d

                              #cowplot to combine plots 
title <- ggdraw() + 
  draw_label(
    "NEGRO POPULATION OF GEORGIA BY COUNTIES",
    fontface = 'bold',
    x = 0,
    hjust = 0  ) 

e <- plot_grid(a,b,c,d, ncol = 2, align = 'tb',
          # rel_heights = c(5,3),
          rel_widths = c(5,4))
e

plot <- plot_grid(title,e,ncol = 1,
                  # rel_heights values control vertical title margins
                  rel_heights = c(0.1, 1))+
  theme(plot.margin = margin(0, 0, 0, 7),
        text = element_text('mono'),
        panel.background = element_blank(),
        plot.title = element_text(hjust = 0.5, size=23, face = "bold"),
        plot.background = element_rect(fill = 'papayawhip'))
plot

p2 <- ggdraw(add_sub(plot, "\n\nsource:Du Bois 1900 Exposition Paris| Graphic by: Simisani Ndaba"))
p2

ggsave("challenge01.png", width = 25, height = 15, units = "cm")
