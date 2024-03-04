library(tidyverse)
library(ggplot2)
library(scales)

challenge05 <- read_csv("https://raw.githubusercontent.com/ajstarks/dubois-data-portraits/master/challenge/2024/challenge05/data.csv")
challenge05


      #Create the stacked bar plot
plot <- ggplot(challenge05, aes(x = "", y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = "stack", width = 0.4) +
  labs(x = "", y = "Percentage", 
       title = "RACE AMALGAMATION IN GEORGIA.",
       subtitle = "BASED ON A STUDY ON 40,000 OF NEGRO DESECENT.",
       caption = "Du Bois in Rstats by simisani.ndaba") +
  scale_fill_manual(values = c("black", "chocolate4", "yellow")) +
  theme_void() +
  theme(text = element_text('mono'),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size=18, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5, size=10),
        plot.background = element_rect(fill = 'papayawhip'),)
 plot +  
   annotate("text", x = 0.55, y = 90, label = "BLACK.", size = 5, hjust = 0, fontface = "bold") +
   annotate("text", x = 0.60, y = 87, label = "IE.FULL-BLOOD.\nNEGROES.", size = 2, hjust = 0) +
   annotate("text", x = 0.95, y = 80, label = "44%", size = 5, hjust = 0, colour = "white")+
   
   annotate("text", x = 0.55, y = 50, label = "BROWN.", size = 5, hjust = 0, fontface = "bold") +
   annotate("text", x = 0.60, y = 44, label = "IE.PERSONS WITH\nSOME WHITE BLOOD\nOR DESCENDENTS\nOF LIGHT COLORED\nAFRICANS", size = 2,hjust = 0) +
   annotate("text", x = 0.95, y = 35, label = "40%", size = 5, hjust = 0, colour = "red")+
   
   annotate("text", x = 0.55, y = 16, label = "YELLOW.", size = 5, hjust = 0, fontface = "bold") +
   annotate("text", x = 0.60, y = 12, label = "IE. PERSONS WITH\nMORE THAN\nNEGRO BLOOD.", size =2,hjust = 0) +
   annotate("text", x = 0.95, y = 8, label = "16%", size = 5, hjust = 0, colour = "black")

 ggsave("challenge05.png", width = 8, height = 8)
