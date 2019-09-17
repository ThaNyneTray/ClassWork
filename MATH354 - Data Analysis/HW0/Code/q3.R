# fib.vector holds the 2 most recent fibonacci numbers
# Starting with 1,2 since they are the first 2 fibonacci numbers
fib.vector <- c(1,2)

# sum.fib is the sum of the even fibonacci numbers.
#  Initialized at 2 since 2 is the first even term
sum.fib <- 2

repeat {
  # get the value of the next fibonacci number
  next.fib = sum(fib.vector)
  # break if the value of next.fib exceeds 1,000,000
  if (next.fib > 1000000) {
    break
  }
  # add the next fib number to sum.fib is it's an even term 
  else if (next.fib %% 2 == 0) {
    sum.fib <- sum.fib + next.fib
  }
  
  # update the fib vector to hold the current 2 fib numbers.
  fib.vector[1] = fib.vector[2]
  fib.vector[2] = next.fib
}