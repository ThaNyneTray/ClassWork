f1_runtimes <- c()
f2_runtimes <- c()

f1 <- function(x) {
  return (log(sqrt(x * 10 ^ 3)))
}

f2 <- function(x) {
  a <- x * 10 ^ 3
  b <- sqrt(a)
  c <- log(b)
  return(c)
}

for (i in 1:1000) {
  start_time_f1 <- Sys.time()
  for (j in 1:1000) {
    f1(2500)
  }
  end_time_f1 <- Sys.time()
  run_time_f1 <- as.numeric(end_time_f1 - start_time_f1)
  f1_runtimes<-append(f1_runtimes, run_time_f1)
}

for (i in 1:1000) {
  start_time_f2 <- Sys.time()
  for (j in 1:1000) {
    f2(2500)
  }
  
  end_time_f2 <- Sys.time()
  run_time_f2 <- as.numeric(end_time_f2 - start_time_f2)
  f2_runtimes<-append(f2_runtimes, run_time_f2)
}


results <- data.frame(
                      F1=f1_runtimes,
                      F2=f2_runtimes
)
