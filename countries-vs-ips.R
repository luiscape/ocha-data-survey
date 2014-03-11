#### Comparing countries stated vs. IPs ####

library(ggplot2)
library(countrycode)

b <- data.frame(countrycode(data$country_name, "country.name", "continent"))

data.compare <- cbind(data,b)

ggplot(data.compare) + theme_bw() + 
  geom_bar(aes(Where.are.you.located.), stat = 'bin', fill = "#EB5C53") + 
  geom_bar(aes(ip.location), stat = 'bin', fill = "#0988bb") 
  geom



ggplot(b) + theme_bw() + 
  geom_bar(aes(reorder(b$Var1, b$Freq), b$Freq), stat = 'identity') + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

b$iso3 <- countrycode(b$Var1, "country.name", "iso3c")

ceiling(sum(b$Freq)/5)  # Trying conditional formatting. 