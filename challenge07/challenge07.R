install.packages("tidyverse")
install.packages("ggplot2")

library(tidyverse)
library(ggplot2)

#extract and read data
challenge07 <- read_csv("https://raw.githubusercontent.com/sndaba/2024DuBoisChallengeInRstats/main/challenge07/challenge07data.csv")

challenge07 <- rbind(c("Romaine",72.9363), challenge07)

colnames(challenge07)[1] <- "Country" 
colnames(challenge07)[2] <- "Proposion" 

literacy <- c("other", "other", "other","negroes","other","other","other","other","other","other")
challenge07['literacy'] <- literacy


view(challenge07)

challenge07$Proposion <- as.numeric(challenge07$Proposion) * 10

challenge07 <- arrange(challenge07, Proposion)
challenge07$Country <- factor(challenge07$Country, levels = challenge07$Country)
view(challenge07)


ggplot(challenge07, aes(Country, Proposion, fill = literacy)) + 
  theme_minimal() +
  labs(
    title = "Illiteracy of the American Negroes compared with that of other nations.\n",
    subtitle = "Proportion d' illettrés parmi les Nègres Americains comparée à celle des autres nations.\n\nDone by Atlanta University.\n\n\n\n",
    caption = "Source: Du Bois Paris Exposition- Plate 47\nCreated by Simi Ndaba") + 
  theme(text = element_text('mono'),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5, size=16),
        plot.subtitle = element_text(hjust = 0.5, size=12),
        plot.caption = element_text(hjust = 0.5, size=12),
        plot.background = element_rect(fill = 'papayawhip'),
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y =element_text(size = 13)) +
  geom_col(width = 0.6,position = position_dodge(width=0.9)) +
scale_fill_manual(values = c("red", "darkgreen")) +
 # geom_bar(stat="identity", fill="green") + 
  coord_flip() 

ggsave("challenge07.png", width = 12, height = 15)
