
f1 <- function(x)
  (log(sqrt(x * 10 ^ 3)))


f2 <- function(x) {
  a <- x * 10 ^ 3
  b <- sqrt(a)
  c <- log(b)
  return(c)
}

start_time_f1 <- Sys.time()
for (j in 1:1000000) {
  f1(1)
}
end_time_f1 <- Sys.time()
run_time_f1 <- end_time_f1 - start_time_f1


start_time_f2 <- Sys.time()
for (j in 1:1000000) {
  f2(1)
}

end_time_f2 <- Sys.time()
run_time_f2 <- end_time_f2 - start_time_f2

