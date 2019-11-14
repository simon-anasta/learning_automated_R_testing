context("not in")

test_that("univariate LHS is correct",{
  
  expect_true(1 %not_in% c(2,3,4))
  expect_true(1 %not_in% 2)
  expect_true(1 %not_in% c())
  expect_false(1 %not_in% 1)
  expect_false(1 %not_in% c(2,1))
  
})

test_that("multivariate LHS is correct",{
  
  a1 = c(1,2,3,4,5)
  
  expect_equal(c(1,2) %not_in% a1, c(FALSE, FALSE))
  expect_equal(c(7,2) %not_in% a1, c(TRUE, FALSE))
  expect_equal(c(3,7,2) %not_in% a1, c(FALSE, TRUE, FALSE))
  
})

test_that("within dataframe is correct",{
  
  df = data.frame(nums = c(1,2,3), chars = c("a","b","c"), stringsAsFactors = FALSE)
  
  t1 = df %>% mutate(new = nums %not_in% c(2,3,4))
  t2 = df %>% filter(chars %not_in% c("z","a"))
  
  t1_truth = data.frame(nums = c(1,2,3), chars = c("a","b","c"), new = c(TRUE, FALSE, FALSE), stringsAsFactors = FALSE)
  t2_truth = data.frame(nums = c(2,3), chars = c("b","c"), stringsAsFactors = FALSE)
  
  expect_equivalent(t1, t1_truth)
  expect_identical(t2, t2_truth)
  
})

test_that("different calls work",{
  
  a1 = c(1,2,3,4,5)
  a2 = c(5,6,7,8,9)
  b1 = c("a","b","c")
  b2 = c("c","d","e")
  
  expect_equal(a1 %not_in% a2, `%not_in%`(a1,a2))
  expect_equal(b1 %not_in% b2, `%not_in%`(b1,b2))
  expect_equal(b1 %not_in% a2, `%not_in%`(b1,a2))
  expect_equal(b1 %not_in% b1, `%not_in%`(b1,b1))
  
})
