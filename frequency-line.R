#### Creating a fequency line. ####

setwd("~/Documents/Programming/ocha-data-survey")

library(ggplot2)
library(lubridate)

data <- read.csv("data/survey-data-with-locations.csv", header=T)

data$StartDate <- mdy_hms(data$StartDate)


#### Plotting #### 
# Response frequency #
ggplot(data, aes(StartDate)) +  theme_bw() + 
  geom_area(stat = 'bin', alpha = 0.3, fill = "#0988bb") +
  geom_line(stat = 'bin', size = 1.3, color = "#0988bb") + 
  ylab("Number of Responses") + xlab("Date") + 
  labs(title = "Number of Responses per Day") + 
  theme(plot.title = element_text(vjust = 2, face = "italic"))