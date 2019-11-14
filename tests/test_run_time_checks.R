context("run time checks")

test_that("messages outputed",{
  
  expect_output(run_time_inform_user("message text"), as.character(Sys.Date()))
  expect_output(run_time_inform_user("message text"), "message text")
  
})

test_that("assert performs",{
  
  expect_error(assert(FALSE, "message text"), "message text")
  
})

test_that("true assert has no return",{
  
  a1 = assert(TRUE, "msg")
  
  expect_equal(a1, NULL)
  expect_equivalent(a1, NULL)
  expect_identical(a1, NULL)
  
})
