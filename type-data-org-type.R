#### Creating a bar graph for the type of data and organization type. ####

setwd("~/Documents/Programming/ocha-data-survey")

library(ggplot2)

## From R Cookbook http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/ ##
## Color palette from: http://jfly.iam.u-tokyo.ac.jp/color/ -- great for color blind. ##
# The palette with grey:
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# The palette with black:
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# To use for fills, add
scale_fill_manual(values=cbPalette)

# To use for line and point colors, add
scale_colour_manual(values=cbPalette)


## Plot of bar graph with org. type vs. data they want ## 
ggplot(data, aes(reorder(data$What.type.of.organization.are.you.currently.working.for.., data$What.type.of.organization.are.you.currently.working.for.., function(x) length(x)))) + theme_bw() + 
  geom_bar(aes(fill = What.type.of.data.are.you.most.interested.in.using..), position = "fill") + 
  coord_flip() + scale_fill_manual(values = cbPalette) + 
  xlab("What type of organization\nare you currently working for?") + 
  ylab("Share (%).") + 
  labs(title = "Type of data vs. organization type.") + scale_fill_discrete(name="What type of data are you most interested in using?") + 
  theme(plot.title = element_text(vjust = 2, face = 'italic'))

  
 

