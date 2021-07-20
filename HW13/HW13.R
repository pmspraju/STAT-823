library(graphics)
library(ggplot2)
library(MASS)
library(Hmisc)
library(epiDisplay)
library(vcd)
library(mnormt)
library(MASS)
library(car)
library(ggpubr)
library(PairedData)
library(lmtest)
library(xtable)
library(faraway)
library(leaps)
library(psych)
library(Matrix)
library(dobson)
library(jtools)
library(Rcpp)
library(pryr)

f1 <- function(a,b){
  a*10
}
f1(10,stop("Nonsense"))
body(f1)
class(f1)
environment(f1)
objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)

# Cs1
x <- 1
h <- function() {
  y <- 2
  i <- function() {
    z <- 3
    c(x, y, z)
  }
  i()
}
h()
rm(x, h)

#cs2
j <- function(x) {
  y <- 2
  function() {
    c(x, y)
  }
}
k <- j(1)
k()
rm(j, k)

#cs3
l <- function(x) x + 1
m <- function() {
  l <- function(x) x * 2
  l(10)
}
m()
#> [1] 20
rm(l, m)

#cs4
n <- function(x) x / 2
o <- function() {
  n <- 10
  n(n)
}
o()
#> [1] 5
rm(n, o)

#cs5
j <- function() {
  if (!exists("a")) {
    a <- 1
  } else {
    a <- a + 1
  }
  a
}
j()
rm(j)

#cs6
f <- function() x + 1
codetools::findGlobals(f)
#> [1] "+" "x"

#cs7
c <- 10
c(c = c)

#cs8
f <- function(x) {
  f <- function(x) {
    f <- function(x) {
      x ^ 2
    }
    f(x) + 1
  }
  f(x) * 2
}
f(10)

#cs8
args <- list(1:10, na.rm = TRUE)
do.call(mean, args)
mean(1:10, na.rm = TRUE)

