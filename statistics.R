#### Analyzing the survey data. ####

setwd("~/Documents/Programming/ocha-data-survey")


library(ggplot2)
library(HH)

data <- read.csv("data/survey-data-with-locations.csv", header=T)


# Cleaning for making the Likert scale plot #

a <- data$Please.rate.the.following.statements.based.on.your.experience.with.humanitarian.work....Humanitarian.data.is.easy.to.find
a <- data.frame(a)
colnames(a)[1] <- "Answer"
a$variable <- "Humanitarian.data.is.easy.to.find"

b <- data$Please.rate.the.following.statements.based.on.your.experience.with.humanitarian.work....Humanitarian.data.is.timely
b <- data.frame(b)
colnames(b)[1] <- "Answer"
b$variable <- "Humanitarian.data.is.trustworthy"

c <- data$Please.rate.the.following.statements.based.on.your.experience.with.humanitarian.work....Humanitarian.data.is.trustworthy
c <- data.frame(c)
colnames(c)[1] <- "Answer"
c$variable <- "It.is.easy.to.compare.humanitarian.data.across.crises"

d <- data$Please.rate.the.following.statements.based.on.your.experience.with.humanitarian.work....It.is.easy.to.compare.humanitarian.data.across.crises
d <- data.frame(d)
colnames(d)[1] <- "Answer"
d$variable <- "It.is.easy.to.compare.humanitarian.data.across.crises"
d <- subset(d, d$Answer != "")

e <- data$Please.rate.the.following.statements.based.on.your.experience.with.humanitarian.work....I.regularly.analyze.humanitarian.data.to.inform.my.d
ecisions
e <- data.frame(e)
colnames(e)[1] <- "Answer"
e$variable <- "I.regularly.analyze.humanitarian.data.to.inform.my.decisions"
e <- subset(e, e$Answer != "")


likert <- cbind(a,b,c,d,e)

likert <- subset(likert, likert[3] != "")
likert <- subset(likert, likert[5] != "")
likert <- subset(likert, likert[7] != "")
likert <- subset(likert, likert[9] != "")

# test to see if there are white spaces or NAs
y <- ifelse(likert[9] == "", TRUE, FALSE)



#### Plotting ####

# Creating plot based on locations #
 ggplot(data, aes(Where.are.you.located.)) + theme_bw() +
  geom_bar(stat = 'bin', aes(fill = What.type.of.organization.are.you.currently.working.for..), size = 1) + 
  scale_x_discrete(limits = c("Africa", "Asia", 'North America',  'Europe', "Australia/Pacific Islands"))


# Creating plot based on the Likert scale #
ggplot(likert, aes(variable, fill = Answer)) + theme_bw()+ 
  geom_bar() + 
  coord_flip()

# Creating a Likert scale plot based on the sjPlotLikert.R package #
# Failed due to levels. Correct Likert scales have pair levels. Ours was incorrectly done and has 5. 
levels <- list(c("Strongly disagree", "Disagree", "Agree", "Somewhat agree", "Strongly Agree"))
items <- list(c("Q1", "Q2", "Q3", "Q4", "Q5"))
sjp.stackfrq(likert, legendLabels=levels, barColor="brown", orderBy="variable", barWidth = 0.5)


# Plotting using the 'HH' package. ##
likert <- likert(likert)
plot.likert(likert, main="", as.percent=TRUE, rightAxisLabels=NULL, rightAxis=NULL, ylab.right="", positive.order=TRUE)


# Plot for making simple histograms. # 

ggplot(d) + theme_bw() +   
  geom_bar(aes(Answer)) + 
  scale_x_discrete(breaks = c("Strongly disagree", "Disagree","Somewhat agree", "Agree", "Strongly agree"))


ggplot(e) + theme_bw() +   
  geom_histogram(aes(Answer)) + 
  xlim(c("Strongly disagree", "Disagree","Somewhat agree", "Agree", "Strongly agree"))


reg <- read.csv('data/regularly-analyze.csv')
easy <- read.csv('data/easy-to-compare.csv')

View(reg)

p1 <- ggplot(reg, aes(I.regularly.analyze.humanitarian.data.to.inform.my.decisions, Count)) + 
  theme_bw() + 
  geom_bar(stat = 'identity', width = 0.5, fill = "#0988bb") + 
  xlim(c("Strongly disagree", "Disagree","Somewhat agree", "Agree", "Strongly agree")) +
  ylab(NULL) + 
  xlab(NULL) + 
  theme(plot.title = element_text(vjust = 2, face = 'italic'), 
        axis.text.x = element_text(size = 12)) +
  labs(title = 'I regularly analyze humanitarian data to inform my decisions.')




p2 <- ggplot(easy, aes(It.is.easy.to.compare.humanitarian.data.across.crises, Count)) + 
  theme_bw() + 
  geom_bar(stat = 'identity', width = 0.5, fill = "#0988bb") + 
  xlim(c("Strongly disagree", "Disagree","Somewhat agree", "Agree", "Strongly agree")) +
  ylab(NULL) + 
  xlab(NULL) + 
  theme(plot.title = element_text(vjust = 2, face = 'italic'), 
        axis.text.x = element_text(size = 12)) +
  labs(title = 'It is easy to compare humanitarian data across crises.') 

multiplot(p1, p2, cols = 2)




