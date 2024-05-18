#install packages
install.packages("tidyr")
install.packages("readr")
install.packages("ggplot")
install.packages("cowplot")
install.ptachwork("patchwork")

#load and extract the libraries to use
library(tidyr)
library(readr)
library(ggplot2)
library(cowplot)
library(patchwork)

#read data using readr package 
challenge08 <- readr::read_csv("https://raw.githubusercontent.com/sndaba/2024DuBoisChallengeInRstats/main/challenge08/challenge08data.csv")

#first data frame
df <- data.frame(x=c(1, 4),
                  y=c(1,4)) 
c <- ggplot(data = df, aes(x, y)) +
  theme_void() +
 scale_y_continuous(limits = c(0,4 )) +
  scale_x_continuous(limits = c(0,4)) +
  annotate(geom = "text", x = 1.14, y = 3, size = 3, color = "black", lineheight = .6,
           label = "IN 1890 NEARLY ONE FIFTH OF THEM OWNED THEIR OWN HOMES AND FARMS.
           \n   THIS ADVANCE WAS ACCOMPLISHED ENTIRELY WITHOUT STATE AID, AND IN THE")+
  annotate(geom = "text", x = 0.6, y = 2.6,  size = 3, color = "black", lineheight = .6,
           label = "FACE OF PROSCRIPTIVE LAWS.")+
  
  annotate(geom = "text", x = 1.1, y = 2.2, size = 3, color = "black", lineheight = .6,
           label = "EN 1890 ENVIRON UN CINQUIÈME ÉTAIENT PROPRIÉTAIRES DE LEURS HABI-")+
  annotate(geom = "text",  x = 1.05, y = 1.8,  size = 3, color = "black", lineheight = .6,
           label = "ITATIONS ET DE LEURS FERMES. CE PROGRÈS S'EST ACCOMPLI SANS")+
  annotate(geom = "text",  x = 1.1, y = 1.5,  size = 3, color = "black", lineheight = .6,
           label = "SECOURS AUCUN DE L'ETAT ET EN PRÉSENCE DE LOIS OÉFAVOURABLES.")+
  
  annotate(geom = "text",  x = 0.9, y = 0.6,  size = 3, color = "black", lineheight = .6,
           label = "IN 1860 NEARLY 90% OF BLACKS WERE SLAVES.")+
  annotate(geom = "text", x = 1, y = 0.4,size = 3, color = "black", lineheight = .6,
           label = " EN 1860 ENVIRON 90% DES NÈGRES ÉTAIENT ESCLAVES")
c



#first data frame
df1 <- data.frame(
  Year = c(1860, 1890),
  Slave = c(89, NA),
  Free = c(11, NA)
)
#Reshape the data
df_long <- pivot_longer(df1, cols =-Year, names_to = "Category", values_to = "Value")

#Plot the stacked bar plot
c08_1860 <- ggplot(df_long, aes(x = Year, y = Value, fill = Category)) +
 geom_bar(stat = "identity") +
  annotate(geom = "text", x = 1860, y = 105,size = 6, color = "black", lineheight = .9,
           label = "1860" , fontface = "bold") +
  annotate(geom = "text", x = 1860, y = 95, size = 2, color = "black", lineheight = .9,
           label = "11%   FREE LABORERS\nOUVRIERS LIBRES", fontface = "bold") +
  scale_fill_manual(values = c("Slave" = "black", "Free" = "darkgreen")) +
 # scale_y_continuous(limits = c(0, 190)) +
 #scale_x_continuous(limits = c(1830, 1890)) +
  annotate(geom = "text", x = 1860, y = 50, size = 2, color = "red", lineheight = .9,
           label = "89%\nSLAVES\nESCLAVES", fontface = "bold") +
 # scale_fill_manual(values = c("Slave" = "black", "Free" = "darkgreen")) +
  theme_void() +
  theme(legend.position = "none")+
  theme(aspect.ratio = 2.5)  # Adjusting the width of the bar
c08_1860

 

#second data frame
df2 <- data.frame(
  Year = c(1860, 1890),
  Owners = c(19, NA),  
  Tenants = c(81, NA)  
)

# Reshape the data
df_long1 <- pivot_longer(df2, cols = -Year, names_to = "Category", values_to = "Value")

# Plot the stacked bar plot
c08_1890 <- ggplot(df_long1, aes(x = Year, y = Value, fill = Category)) +
  geom_bar(stat = "identity") +
  annotate(geom = "text", x = 1860, y = 105,size = 6, color = "black", lineheight = .9,
           label = "1890" , fontface = "bold") +
  annotate(geom = "text", x = 1860, y = 90,size = 2, color = "black", lineheight = .9,
           label = "19%\nPEASANT PROPRIETORS\nPAYSANS PROPRIETAIRES" , fontface = "bold") +
  annotate(geom = "text", x = 1860, y = 50, size = 2, color = "black", lineheight = .9,
           label = "81%\nTENANTS\nMÉTAYERS" , fontface = "bold") +
  scale_fill_manual(values = c("Owners" = "red", "Tenants" = "darkgreen")) +
  theme_void() +
  theme(legend.position = "none") +
  theme(aspect.ratio = 1.8)  # Adjusting the width of the bar
c08_1890




#combined plots using Cowplot package
plot <- plot_grid(
  c, c08_1890, c08_1860,align="hv",  rel_heights = c(4,3),rel_widths = c(7,2)
)
plot + plot_annotation(
  title = "THE RISE OF THE NEGROES FROM SLAVERY TO FREEDOM IN ONE GENERATION.\n
PROGRÈS GRADUEL DES NÈGRES DE LESCLAVAGE A LA LIBERTÈ EN UNE GÈNÈRATION.\n\n\n",
  subtitle = 'DONE BY ATLANTA UNIVERSITY',
  caption = 'Data: DuBois Paris Explosition Plate 50\nCreated by: Simisani Nokulunga Ndaba',
  theme = theme(plot.title = element_text(size = 15,hjust = 0.5,face = "bold"),
                plot.subtitle = element_text(size = 13,hjust = 0.5,vjust = 0.5,face = "bold"),
                plot.caption = element_text(size = 13,hjust = 1,face = "bold"),
                plot.background = element_rect(fill = 'papayawhip'),
                axis.title.x=element_blank(),
                axis.text.x=element_blank(),
                axis.ticks.x=element_blank(),
                axis.title.y=element_blank())) & 
  theme(text = element_text('mono'))

ggsave("challenge08.png", width = 10, height = 10)
