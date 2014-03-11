#### Cleaning Survey Data. 

library(ggplot2)

setwd("~/Documents/Programming/ocha-data-survey")

data <- read.csv("data/survey-data-with-locations.csv", header=T)

## Adding an ID column. 

id <- 1:nrow(survey)
survey <- cbind(id=id, survey)


#### Cleaning for *internal use* ####

survey$Email.Address <- NULL 
survey$First.Name <- NULL 
survey$LastName <- NULL 
survey$Custom.Data <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Name. <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Company.  <- NULL 

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Address.1.   <- NULL 

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Address.2.   <- NULL 

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....City.Town.   <- NULL 

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....State.Province.  <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....ZIP.Postal.Code. <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Phone.Number.<- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Country. <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Name.  <- NULL

colnames(survey)[21] <- "Email.Address"


write.csv(survey, file="ocha_data_survey_internal_use.csv", row.names=FALSE)





#### Cleaning for *external use* ####

survey$RespondentID <- NULL
survey$CollectorID <- NULL
survey$IP.Address <- NULL 
survey$Email.Address <- NULL 
survey$First.Name <- NULL 
survey$LastName <- NULL 
survey$Custom.Data <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Name. <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Company.  <- NULL 

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Address.1.   <- NULL 

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Address.2.   <- NULL 

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....City.Town.   <- NULL 

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....State.Province.  <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....ZIP.Postal.Code. <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Phone.Number.<- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Country. <- NULL

survey$We.appreciate.your.feedback..If.you.are.interested.participating.in.the.ReliefWeb.Labs.data.space..please.provide.us.with.your.email.details.and.we.will.contact.you..To.learn.more.about.OCHA.s.data.efforts.on.behalf.of.the.humanitarian.community..email.us.at.ochadataproject.un.org..Thank.you....Name.  <- NULL


write.csv(survey, file="ocha_data_survey_external_use.csv", row.names=FALSE)
