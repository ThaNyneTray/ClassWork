# generate 1000 random ints w/ replacement
random.ints <- sample(x = 1:10000000,
                      size = 10000000,
                      replace = TRUE)

# vectors to hold runtimes of the 2 different approaches
runtime_type1 <- c()
runtime_type2 <- c()

#for (n in 1:5) {
start_time <- Sys.time()

# random.type1 -> values will be appended as they are decided
random.type1 <- c()

# populating by appending
for (i in 1:length(random.ints)) {
  if (random.ints[i] %% 2 == 0) {
    random.type1 <- c(random.type1, "even")
  }
  else {
    random.type1 <- c(random.type1, "odd")
  }
}
end_time <- Sys.time()
run_time1 <- as.numeric(end_time - start_time)
runtime_type1 <- append(runtime_type1, run_time1)
#}


#for (n in 1:5) {
start_time <- Sys.time()
# random.type2 -> vector will be indexed
random.type2 <- rep(NA, length(random.ints))

# populating by indexing
for (i in 1:length(random.ints)) {
  if (random.ints[i] %% 2 == 0) {
    random.type2[i] <- "even"
  }
  else{
    random.type2[i] <- "odd"
  }
}

end_time <- Sys.time()
run_time2 <- as.numeric(end_time - start_time)
runtime_type2 <- append(runtime_type2, run_time2)
#}
results<-data.frame(
  T1=runtime_type1,
  T2=runtime_type2
)