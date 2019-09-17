library(stringr)

reverse.string <- function(number.to.reverse) {
  split.number <- str_split(number.to.reverse, pattern = "")
  split.number.reversed <- rev(split.number[[1]])
  reversed.number <-
    as.numeric(paste(split.number.reversed, collapse = ""))
  reversed.number
}

largest.palindrome <- 0

find.largest.palindrome <- function() {
  for (num.1 in 100:999) {
    for (num.2 in 100:999) {
      num <- num.1 * num.2
      if (reverse.string(num) == num & num > largest.palindrome) {
        largest.palindrome <- num
      }
    }
  }
  largest.palindrome
}

check.if.product <- function(current.number) {
  for (i in 999:100) {
    quotient <- current.number / i
    if (current.number %% i == 0 & quotient <= 999 & quotient >= 100) {
      return (TRUE)
    }
    else if (quotient > 999) {
      return (FALSE)
    }
  }
}

find.largest.palindrome.v2 <- function() {
  max.product <- 999 * 999
  min.product <- 100 * 100
  for (current.number in max.product:min.product) {
    if (reverse.string(current.number) == current.number & check.if.product(current.number)) {
      return (current.number)
    }
  }
}
largest.palindrome<-find.largest.palindrome()
largest.palindrome.v2<-find.largest.palindrome.v2()
