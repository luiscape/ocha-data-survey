#### Bar plot - data types vs. organization types. #### 

setwd("~/Documents/Programming/ocha-data-survey")

library(ggplot2)


What.type.of.data.are.you.most.interested.in.using..

What.type.of.organization.are.you.currently.working.for..

# Bar graph with response groups. #
ggplot(data, aes(reorder(data$What.type.of.data.are.you.most.interested.in.using.., data$What.type.of.data.are.you.most.interested.in.using.., function(x) length(x)))) + theme_bw() + 
  geom_bar(stat = 'bin', aes(fill = What.type.of.organization.are.you.currently.working.for..)) + 
  coord_flip() + 
  xlab("What type of data are\nyou most interested in using?") + ylab("Where are you located?") + 
  labs(title = "Type of data people are the most interested in using vs. their institution type.") + 
  theme(plot.title = element_text(vjust = 2, face = 'italic'), 
        axis.text.x = element_text(size = 12)
  ) + 
  scale_fill_discrete(name="Where are you located?") 