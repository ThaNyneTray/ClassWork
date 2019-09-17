library(quantreg)
library(ggplot2)
data("uis")

# first, create add a column to the data frame
#  adding in the designations specified in (b)

categorical.beck <- rep(NA, nrow(uis))
for (i in 1:length(categorical.beck)) {
  beck.score <- uis$BECK[i]
  
  if (beck.score >= 0 &
      beck.score <= 13)
    categorical.beck[i] <- "Minimal"
  
  else if (beck.score >= 14 &
           beck.score <= 19)
    categorical.beck[i] <- "Mild"
  
  else if (beck.score >= 20 &
           beck.score <= 28)
    categorical.beck[i] <- "Moderate"
  
  else if (beck.score >= 29 &
           beck.score <= 63)
    categorical.beck[i] <- "Severe"
}

# frequency table
beck.table <- table(categorical.beck)

# proportion frequency table
beck.prop.table <- prop.table(beck.table)

# frequency bar plot
beck.dat <- data.frame(beck.table)
colnames(beck.dat)=c("Dep.cat", "Count")
beck.bar.plot<-ggplot(data=beck.dat, aes(x=Dep.cat, y=Count)) +
  geom_bar(stat = "identity",
           color = "black",
           fill = "lightblue") +
  xlab("Beck Depression Level") +
  ylab("Number of Patients") +
  ggtitle("Beck Depression Level Patient Count") +
  geom_hline(yintercept = 0) +
  theme_bw()
beck.bar.plot
(beck.bar.plot)

