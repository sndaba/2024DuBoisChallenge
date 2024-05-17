install.packages("tidyverse")
install.packages("ggplot2")

library(tidyverse)
library(ggplot2)

challenge02 <- read_csv("https://raw.githubusercontent.com/sndaba/2024DuBoisChallengeInRstats/main/challenge02/challenge02data.csv")

                                               #plot
ggplot(data = challenge02, aes(x = Year, y = Free)) +
  geom_line() +
  geom_ribbon(data = NULL, aes(ymin = Free, ymax = Inf), fill = "black", alpha = 0.8) +
  geom_ribbon(data = NULL, aes(ymin = -Inf, ymax = Free), fill = "red", alpha = 0.9) +
  theme_minimal() +
  labs(
    title = "SLAVES AND FREE NEGROES.",
    caption = "Source: Du Bois Plate 12 | Graphic: Simisani Ndaba") +
  theme(
    plot.title = element_text(hjust = 0.5, family = "mono", 
                              size = 23, face = "bold"),
    plot.background = element_rect(fill = 'papayawhip'),
    plot.caption = element_text(hjust = 0.5, family = "mono", 
                                size = 15, face = "bold"),
    axis.title.x=element_blank(),
    axis.title.y = element_blank(),
    axis.text.x=element_blank(),
    axis.ticks.x=element_blank()) +
  scale_x_reverse(
    breaks = seq(0, 1870, 10),
    limits =  c(1870, 1789)) +               # c(1870, 1790)) +
  scale_y_reverse(
    breaks = seq(0, 1.8, 0.5),
    limits = c(1.8, 0.5)) +
  annotate(geom = "text", label="3%",size=4,x=1789,y=1.8)+
  annotate(geom = "text", label="2%",size=4,x=1789,y=1.5)+
  annotate(geom = "text", label="1%",size=4,x=1789,y=1)+
  annotate(geom = "text", label="Percent of\nFree Negroes\n1.3%",size=3,x=1789,y=0.5)+
  annotate(geom = "text", label="1.7%",size=3,x=1800,y=0.5)+
  annotate(geom = "text", label="1.7%",size=3,x=1810,y=0.5)+
  annotate(geom = "text", label="1.2%",size=3,x=1820,y=0.5)+
  annotate(geom = "text", label="0.8%",size=3,x=1830,y=0.5)+
  annotate(geom = "text", label="0.9%",size=3,x=1840,y=0.5)+
  annotate(geom = "text", label="0.7%",size=3,x=1850,y=0.5)+
  annotate(geom = "text", label="0.8%",size=3,x=1860,y=0.5)+
  annotate(geom = "text", label="100%",size=3,x=1870,y=0.5)+
  coord_flip()


                                #saving the plot
ggsave("challenge02.png", width=8, height=15)
