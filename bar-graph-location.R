#### Creating a bar graph. ####

setwd("~/Documents/Programming/ocha-data-survey")

library(ggplot2)

# Bar graph with response groups. #
ggplot(data, aes(reorder(data$What.type.of.organization.are.you.currently.working.for.., data$What.type.of.organization.are.you.currently.working.for.., function(x) length(x)))) + theme_bw() + 
  geom_bar(stat = 'bin', aes(fill = Where.are.you.located.)) + 
  coord_flip() + 
  xlab("What type of organization are\nyou currently working for?") + ylab("Where are you located?") + 
  labs(title = "Type of organization and place of work.") + 
  theme(plot.title = element_text(vjust = 2, face = 'italic'), 
        axis.text.x = element_text(size = 12)
        ) + 
  