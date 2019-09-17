# generate 1000 random ints w/ replacement
random.ints <- sample(x = 1:1000,
                      size = 10000,
                      replace = TRUE)

# appending approach
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
run_time1 <- end_time - start_time


# indexing approach

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
run_time2 <- end_time - start_time

