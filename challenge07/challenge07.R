install.packages("tidyverse")

library(tidyverse)
library(ggplot2)
library(forcats)

#extract and read data
challenge07 <- read_csv("https://raw.githubusercontent.com/ajstarks/dubois-data-portraits/master/challenge/2024/challenge07/data.csv")
view(challenge07)

challenge07 <- rbind(c("Romaine",72.9363), challenge07)

colnames(challenge07)[1] <- "Country" 
colnames(challenge07)[2] <- "Proposion" 
view(challenge07)

challenge07$Proposion <- as.numeric(challenge07$Proposion) * 10

ggplot(data = challenge07, aes(x  = Proposion, y = Country)) +  #Remove gaps in ggplot x-axis for missing data using factor()
  geom_bar(stat="identity", fill = "green")  
  #scale_x_reverse(breaks = seq(from = 0, to = 730, by = 1))

