fn <- "http://cipolli.com/students/data/biomarker.csv"
dat <- read.csv(file = fn, header = TRUE, sep = ",")
head(dat)
###Calculate the age of each subject
#install.packages("lubridate",repos = "http://cloud.r-project.org/")
library(lubridate)
###Create Date Variable for Date Sampled
dos <- mdy(dat$Date.of.sampling)
dos.year <- year(dos)
###Create age Variable
age <- dos.year - dat$Year.of.Birth
###Add age to original dataset
dat <- data.frame(dat, age)

# get the age mean, sd, and iqr by fibrosis stage
ages.mean<-round(tapply(X=dat$age, INDEX=dat$Fibrosis.Stage, mean),2)
ages.sd<-round(tapply(X=dat$age, INDEX=dat$Fibrosis.Stage, sd),2)
ages.iqr<-round(tapply(X=dat$age, INDEX=dat$Fibrosis.Stage, IQR),2)

# get the female and male count by fibrosis stage
female.only<-dat[which(dat$Gender=="female"),]
female.count<-tapply(X=female.only$Gender, INDEX=female.only$Fibrosis.Stage, length)

male.only<-dat[which(dat$Gender=="male"),]
male.count<-tapply(X=male.only$Gender, INDEX=male.only$Fibrosis.Stage, length)

total.count<-female.count+male.count

# get the number of patients with each HCV genotype, by fibrosis stage
# just create a 2 way table
hcv.count<-table(dat$HCV.Genotype, dat$Fibrosis.Stage)
