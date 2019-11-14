#
# minor functions for learning testthat package
# 2019-11-14
#

## setup ----

library(dplyr)
setwd("C:/NotBackedUp/Learning testthat")

## function definition ----

# Removes non-standard characters from text leaving more readable text behind.
tidy_text = function(string){
  string = gsub('_', ' ', string)
  string = gsub('\\.', ' ', string)
  return(string)
}

# capitalise the first letter of a string
capitalize = function(s){
  paste0(toupper(substring(s,1,1)),substring(s,2))
}

# Not In - Negative of %in%
'%not_in%' <- function(x,y){
  !('%in%'(x,y))
}

# Assert function for run time testing of code.
# Throws an error if condition is not TRUE
assert <- function(condition, msg){
  # condition must be logical
  if(! is.logical(condition)){
    msg <- sprintf("expected condition to be logical, received %s instead\n",class(condition))
    stop(msg)
  }
  # check condition and throw error
  if(condition == FALSE)
    stop(msg)
}

# Inform user with time stamped measure
run_time_inform_user <- function(msg){
  # time
  now <- as.character(Sys.time())
  # display
  cat(now, "|", msg, "\n")
}

## run tests ----

testthat::test_dir("./tests")
