cc <- function(x) Filter(Negate(is.null), x)
last <- function(x) x[length(x)]
stract <- function(str, pattern) regmatches(str, gregexpr(pattern, str))
