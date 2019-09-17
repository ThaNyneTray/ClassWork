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

## Subset dat according to fibrosis stage,
##   then get the mean, sd, and IQR of ages

## vectors to hold the mean, sd, and iqr for ages
##   corresponding to the columns F0-F4, as well as 'All' in the table
ages.mean <- rep(NA, 6)
ages.sd <- rep(NA, 6)
ages.iqr <- rep(NA, 6)

## the range 0:4 corresponds to fibrosis levels
## gets the mean, sd, and iqr then stores them.
for (i in 1:5) {
  fi.ages <- dat$age[which(dat$Fibrosis.Stage == i - 1)]
  ages.mean[i] <- round(mean(fi.ages), 2)
  ages.sd[i] <- round(sd(fi.ages), 2)
  ages.iqr[i] <- round(IQR(fi.ages), 2)
}

# mean, iqr, and sd for ages for the entire dataset.
ages.mean[6] <- round(mean(dat$age), 2)
ages.sd[6] <- round(sd(dat$age), 2)
ages.iqr[6] <- round(IQR(dat$age), 2)

## Next task is to find number of people in each group,
##  both total and by gender
## 2 vectors, storing the male count and female count, respectively

female.count <- rep(NA, 6)
male.count <- rep(NA, 6)

## Select and count patients with fibrosis stage == j-1 and
##   update the female.count and male.count vectors
for (j in 1:5) {
  female.count[j] <-
    length(dat$Patient.ID[which(dat$Gender == "female" &
                                  dat$Fibrosis.Stage == j - 1)])
  male.count[j] <-
    length(dat$Patient.ID[which(dat$Gender == "male" &
                                  dat$Fibrosis.Stage == j - 1)])
}
## count for all patients
female.count[6] <-
  length(dat$Patient.ID[which(dat$Gender == "female")])

male.count[6] <-
  length(dat$Patient.ID[which(dat$Gender == "male")])


## Final task is to summarise data about the HCV genotype
## Created adata frame where each column/vector represents a HCV genotype.
## This is really just for convenience; it allows me to select and populate
##   the vectors neatly in a for loop.

type.df <- data.frame(
  type.1 = rep(NA, 6),
  type.2 = rep(NA, 6),
  type.3 = rep(NA, 6),
  type.4 = rep(NA, 6),
  type.Other = rep(NA, 6),
  type.NA = rep(NA, 6)
)

## I think of the outer for loop as iterating over the Genotypes k==1 to 4
##   represents Genotypes 1-4. k==5 represents Other, k==6 represents NA

for (k in 1:6) {
  # the if else statements filters out and saves values in the
  #   Fibrosis.Stage column according to the current Genotype/k value.
  
  if (k %in% c(1, 2, 3, 4)) {
    fibrosis.stage <- dat$Fibrosis.Stage[which(dat$HCV.Genotype == k)]
  }
  else if (k == 5) {
    fibrosis.stage <-
      dat$Fibrosis.Stage[which(dat$HCV.Genotype == "andere")]
  }
  else {
    fibrosis.stage <-
      dat$Fibrosis.Stage[which(dat$HCV.Genotype == "")]
  }
  # l-1 in this case represents the Fibrosis stages.
  # l==1 to 5 ==> fibrosis stages 0 to 4. l==6 ==> whole data set
  for (l in 1:6) {
    if (l == 6)
    {
      type.df[l, k] <- length(fibrosis.stage)
    }
    else
    {
      type.df[l, k] <-
        length(fibrosis.stage[which(fibrosis.stage == l - 1)])
    }
  }
}
