install.packages("tidyverse")

library(tidyverse)
library(ggplot2)

challenge03 <- read_csv("https://raw.githubusercontent.com/ajstarks/dubois-data-portraits/master/challenge/2024/challenge03/data.csv")


view(challenge03)

challenge03 <- rbind(c(1874,338769), challenge03)
colnames(challenge03)[1] <- "Year" 
colnames(challenge03)[2] <- "Acres" 

challenge03$Acres <- as.numeric(challenge03$Acres) / 1000

challenge03 <- challenge03 %>% mutate(across(c('Acres'), round, 0))

challenge03 <- challenge03[-14,] #remove duplicate 1888 value
View(challenge03)

ggplot(data = challenge03, aes(x = Year, y = Acres)) +  #Remove gaps in ggplot x-axis for missing data using factor()
  geom_bar(stat="identity", fill = "red")  +
  scale_x_reverse(breaks = seq(from = 1874, to = 1899, by = 1))+
  
  labs(
    title = "ACRES OF LAND OWNED BY NEGROES IN GEORGIA.",
    caption = "Source: Du Bois Data Portaits") + coord_flip()



