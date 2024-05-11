#install.packages("ggplot","tidyverse","ggtext","patchwork","maps",..etc)
library(ggplot2)
library(tidyverse)
library(ggtext)
library(ggfx)
library(patchwork)
library(cowplot)
library(ggforce)
library(maps)

challenge10 <- readr::read_csv("https://raw.githubusercontent.com/sndaba/2024DuBoisChallengeInRstats/main/challenge10/challenge10data.csv")


                                         #title annotation
titlePlot <- data.frame(x=c(1, 2, 3, 4, 5),
                   y=c(2, 4, 6, 8, 12))
titleTop <- ggplot(data = titlePlot, aes(x, y)) +
  theme_void()+
  annotate(geom = "text",size = 6,family ="mono", color = "black", fontface="bold",lineheight = .6,x=1,y=3,
           label = "A SERIES OF STATISTICAL CHARTS ILLUSTRA-\n
           TING THE CONDITION OF THE DESCENDANTS OF FOR-\n
           MER AFRICAN SLAVES NOW RESIDENT IN THE UNITED STATES OF AMERICA.")

                                        #subtitle annotation
subtitlePlot <- data.frame(x=c(1, 2, 3, 4, 5),
                        y=c(2, 4, 6, 8, 12))
subtitleTop <- ggplot(data = subtitlePlot, aes(x, y)) +
  theme_void()+
  annotate(geom = "text",size =5, color = "red",lineheight = .6,x=1,y=3,family = "mono",
           label = "UNE SERIE DE CARTES ET DIAGRAMMES STATISTIQUES MONTRANT LA-\n
           CONDITION PRESENTE DES DESCENDANTS DES ANCIENS ESCLAVES AFRI-\n
           CAINS ACTUELLMENT ETABLIS DANS LES ETATS UNIS D AMERIQUE.")


                                      #Get map data for USA states
usa_map <- map_data("state")

# Define colors for each state (replace these with your desired colors)
state_colors <- c(
  "Alabama" = "red",
  "Arizona" = "lightblue",
  "Arkansas" = "lightgreen",
  "California" = "red",
  "Colorado" = "red",
  "Connecticut" = "gold",
  "Delaware" = "red",
  "Florida" = "grey",
  "Georgia" = "black",
  "Idaho" = "lightpink",
  "Illinois" = "seashell2",
  "Indiana" = "darkorange",
  "Iowa" = "seagreen1",
  "Kansas" = "seashell2",
  "Kentucky" = "saddlebrown",
  "Louisiana" = "sandybrown",
  "Maine" = "lightgreen",
  "Maryland" = "saddlebrown",
  "Massachusetts" = "red",
  "Michigan" = "navyblue",
  "Minnesota" = "blue",
  "Mississippi" = "lightblue",
  "Missouri" = "red",
  "Montana" = "seashell2",
  "Nebraska" = "gold",
  "Nevada" = "seashell2",
  "New Hampshire" = "gold",
  "New Jersey" = "lightgreen",
  "New Mexico" = "lightgreen",
  "New York" = "seashell2",
  "North Carolina" = "lightpink",
  "North Dakota" = "lightpink",
  "Ohio" = "lightblue",
  "Oklahoma" = "pink",
  "Oregon" = "lightgreen",
  "Pennsylvania" = "lightseagreen",
  "Rhode Island" = "navyblue",
  "South Carolina" = "gold",
  "South Dakota" = "saddlebrown",
  "Tennessee" = "navyblue",
  "Texas" = "gold",
  "Utah" = "saddlebrown",
  "Vermont" = "seashell2",
  "Virginia" = "salmon",
  "Washington" = "seagreen",
  "West Virginia" = "lightblue",
  "Wisconsin" = "gold",
  "Wyoming" = "navyblue"
)
state_colors <- setNames(state_colors, tolower(names(state_colors)))

                              # Plot the map with matching state names
us <- ggplot() +
  geom_polygon(data = usa_map, aes(x = long, y = lat, group = group, fill = region)) +
  scale_fill_manual(values = state_colors[usa_map$region]) +  # Assigning colors manually
  coord_fixed() + #1.3
  annotate(geom = "text",label="Centre of Negro Population.\nATLANTA UNIVERSITY.",
           x=-100, y=25,size=2.5,family = "mono")+
  theme(legend.position = "none")+
  theme_void() +
  guides(fill = FALSE)  # Remove the legend

                                     #map annotations bottom of map
map1 <- data.frame(x=c(1, 2, 3, 4, 5),
                     y=c(2, 4, 6, 8, 12))
mapann1 <- ggplot(data = map1, aes(x, y)) +
  theme_void()+
  annotate(geom = "text",size = 4, color = "black", lineheight = .6,x=1,y=3,family = "mono",
           label = "THE UNIVERSITY WAS FOUNDED IN 1867. IT HAS INSTRUCTED 6000 NEGRO STUDENTS.\n
           L'UNIVERSITE A ETE FONDEE EN 1867. ELLE A DONNE L'INSTRUCTION A'6000 ETUDIANTS NEGRES.\n
                              IT HAS GRADUATED 330 NEGROES AMONG WHOM ARE:\n
           ELLE A DELIVRE DES DIPLOMES A 330 NEGRES DONT :")

                                      #map annotations:english side
map2 <- data.frame(x=c(1, 2, 3, 4, 5),
                       y=c(2, 4, 6, 8, 12))
mapann2 <- ggplot(data = map2, aes(x, y)) +
  theme_void()+
  annotate(geom = "text",size = 4, color = "black", lineheight = .6,x=1,y=3,family ="mono",
           label = "PREPARED AND EXECUTED BY\n
           NEGRO STUDENTS UNDER THE\n
           DIRECTION OF
           \n ATLANTA,GA.
           \n UNITED STATES OF AMERICA.")

                                    #map annotations:french side
map3 <- data.frame(x=c(1, 2, 3, 4, 5),
                       y=c(2, 4, 6, 8, 12))
mapann3 <- ggplot(data = map3, aes(x, y)) +
  theme_void()+
  annotate(geom = "text",size = 4, color = "black", lineheight = .6,x=1,y=3,family ="mono",
           label = "PREPAREES ET EXECUTEES PAR\n 
           DES ETUDIANTS NEGRES SOUS\n
           LA DIRIECTION DE L'UNIVERSITE\n
           D'ATLANTA.\n.
           ETAT DE GEORGIE.\n
           ETATS UNIS D'AMERIQUE.")


                                   #making the pie chart
order <- c(2,1,3,4,5,6)
rbind(data, order)
challenge10 <- data.frame(Occupation = occupation, Percentage = percentage, Order = order)

challenge10 <- challenge10[order(-challenge10$Percentage), ]
# Create a new column for ordering
challenge10$order <- seq_len(nrow(challenge10))
challenge10
# Adjust the order so that the second highest follows the highest on the left side
challenge10$order <- ifelse(challenge10$order == 2, 1, ifelse(challenge10$order == 1, 2, challenge10$order))

# Create an ordered pie chart with the second highest following the highest on the left side
m <- ggplot(challenge10, aes(x = "", y = Percentage, fill = Occupation, label = paste0(Percentage, "%"), order = order)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = -pi/2) +  # Set start angle to -pi/2 to start at the top
  scale_fill_manual(values = c("ivory","pink","yellow","blue","lightgreen","red")) +  # Use a color palette
  theme_void() +
  theme(legend.position = "none")+
  geom_text(color = "black", size = 4, position = position_stack(vjust = 0.5))

                                              #side legends
                                            #left side legend
dff <- data.frame(x=c(1, 2, 2, 3, 3, 4, 8, 10),
                  y=c(2, 4, 5, 4, 7, 9, 10, 12))
c <- ggplot(data = dff, aes(x, y)) +
  theme_void()+
  geom_circle(aes(x0=1, y0=11, r=0.5), fill='#FF0000')+#, inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=10, r=0.5),fill='blue')+#, inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=9, r=0.5), fill='pink')+#,inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=8, r=0.5),  fill='ivory')+#,inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=7, r=0.5), fill='lightgreen')+#,inherit.aes=FALSE) +
  geom_circle(aes(x0=1, y0=6, r=0.5),fill='yellow')+#,inherit.aes=FALSE) +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 10)) +  #breaks = seq(0, 10, 1000),
  coord_fixed() +
  annotate(geom = "text", family = "mono",x = 3.5, y = 11,  size = 4, color = "black", lineheight = .6,label = "TEACHERS")+
  annotate(geom = "text", family = "mono",x = 3.5, y = 10,  size = 4, color = "black", lineheight = .6, label = "MINISTERS") +
  annotate(geom = "text", family = "mono",x = 5, y = 9,  size = 4, color = "black", lineheight = .6, label = "GOVERNMENT SERVICE") +
  annotate(geom = "text", family = "mono",x = 3.5, y = 8, size = 4, color = "black", lineheight = .6, label = "BUSINESS") + 
  annotate(geom = "text", family = "mono",x = 5, y = 7,  size = 4, color = "black", lineheight = .6, label = "OTHER PROFESSIONS") +
  annotate(geom = "text", family = "mono",x = 3.8, y = 6, size = 4, color = "black", lineheight = .6, label = "HOUSE WIVES") 


                                           #right side legend
othdff <- data.frame(x=c(1, 2, 3, 4, 5),
                  y=c(2, 4, 6, 8, 12))
d <- ggplot(data = othdff, aes(x, y)) +
  theme_void()+
  geom_circle(aes(x0=9, y0=11, r=0.5), fill='#FF0000')+#, inherit.aes=FALSE) +
  geom_circle(aes(x0=9, y0=10, r=0.5),fill='blue')+#, inherit.aes=FALSE) +
  geom_circle(aes(x0=9, y0=9, r=0.5), fill='pink')+#,inherit.aes=FALSE) +
  geom_circle(aes(x0=9, y0=8, r=0.5),  fill='ivory')+#,inherit.aes=FALSE) +
  geom_circle(aes(x0=9, y0=7, r=0.5), fill='lightgreen')+#,inherit.aes=FALSE) +
  geom_circle(aes(x0=9, y0=6, r=0.5),fill='yellow')+#,inherit.aes=FALSE) +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 10))+ #+  #breaks = seq(0, 10, 1000),
coord_fixed() +
  annotate(geom = "text", family = "mono",x = 4.5, y = 11,size = 4, color = "black", lineheight = .6,label = "PROFESSEURS ET INSTITUTERS")+
  annotate(geom = "text", family = "mono",x = 4.5, y = 10,size = 4, color = "black", lineheight = .6, label = "MINISTRES DE L'EVANGLE") +
  annotate(geom = "text", family = "mono",x = 4.5, y = 9,size = 4, color = "black", lineheight = .6, label = "EMPLOYES DU GOVERNEMENT") +
  annotate(geom = "text", family = "mono",x = 4.5, y = 8,size = 4, color = "black", lineheight = .6, label = "MARCHANES") + 
  annotate(geom = "text", family = "mono",x = 4, y = 7,size = 3.5, color = "black", lineheight = .6, label = "MEDONS,ADVOVACATS,ETUDIANTS") +
  annotate(geom = "text", family = "mono",x = 4.5, y = 6,size = 4, color = "black", lineheight = .6, label = "MERES DE FAMILLE") 


anntbl <- data.frame(x=c(1, 2, 3, 4, 5),
                     y=c(2, 4, 6, 8, 12))
ann <- ggplot(data = anntbl, aes(x, y)) +
  theme_void()+
  annotate(geom = "text",size = 3, color = "black", lineheight = .6,x=1,y=1,family = "mono",
                 label = "THE UNIVERSITY HAS 20 PROFESSIONALS AND INSTRUCTORS AND 250 STUDENTS AT PRESENT.\n
                 IT HAS FIVE BUILDINGS, 60 ACRES OF CAMPUS, AND A LIBRARY OF 11,000 VOLUMES. IT AIMS TO RAISE\n
                 AND CIVILIZE THE SONS OF THE FREEDMEN BY TRAINING THEIR MORE CAPABALE MEMBERS IN THE LIBER-\n
                 AL ARTS ACCORDING TO THE BEST STANDARDS OF THE DAY.\n
                    THE PROPER ACCOMPLISHMENT OF THS WORK DEMANDS AN ENDOWMENT FUND OS $500,000.\n
                     L' UNIVERSITE A ACTUELLEMENT 20 PROFESSUERS ET INSTRUCTEURS ET 250 ETUDIANTS.\n
                     ELLE EST COMPOSEE DE CINC BATIMENTS, 60 ACRES(ENVIRON 26 HECTARES)DE TERRAIN SERVANT DE\n
                 COUR ET DE CHAMP DE RECREATION, ET DUNE BIBLIOTHEQUE CONTENANT 11,000 VOLUMES\n.
                    SON BUT EST O'ELEVER ET DE CIVILISER LES FILS DES NEGRES AFFRANCHIS EN DONNANT AUX MIEUX\n
                 DOUES UNE EDUCATION DANS LES ARTS LIBERAUX EN ACCORD AVEC LES IDEES LES PLUS PROGESS-\n
                 SISTES DE L'EPOQUE.\n
                 L'ACCOMPLISSEMENT DE CETTE OEUVRE DEMANDE UNE DOTATION DE $500,00 (2,500,000 FRANCIS).\n
           source:Paris Exposition Plate 37 | Graphic by: Simisani Ndaba")


                                               #caption
simi <- data.frame(x=c(1, 2, 3, 4, 5),
                     y=c(2, 4, 6, 8, 12))
simicaption <- ggplot(data = simi, aes(x, y)) +
  theme_void()+
  annotate(geom = "text",size = 8,fontface="bold", color = "black", lineheight = .6,x=1,y=3,family = "mono",
           label = "source:Paris Exposition Plate 37 | Graphic by: Simisani Ndaba")


                                       #combined plots using patchwork
titles <- plot_grid(titleTop,subtitleTop,ncol=1)   #titles annotation

top <- plot_grid(mapann2,us,mapann3,ncol=3)   #map and side annotations

topplus <- plot_grid(top,mapann1,ncol=1)     #titles and map annotations

             
bottom <- plot_grid(c,m,d,ncol=3)          #pie chart
bottomAnn <- plot_grid(bottom,ann,ncol=1)   #pie chart annotations


                                     #final plot
final_plot <- plot_grid(titles,topplus,bottomAnn,simicaption,ncol=1)

final_plot +
  theme(panel.background = element_blank(),
        plot.background = element_rect(fill = 'papayawhip'),
        plot.margin = unit(c(-0.5, -0.5, -0.5,-0.5), "cm"))


ggsave("challenge10.png",width = 13,height=15)

