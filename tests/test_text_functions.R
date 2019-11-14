context("text functions")

test_that("types are preserved",{
  
  expect_is(capitalize("asd"), "character")
  expect_that(tidy_text("foo"), is_a("character"))
  
})

test_that("capitalisation applied",{
  
  expect_equal(capitalize("foo"), "Foo")
  expect_equal(capitalize("Foo"), "Foo")
  expect_equal(capitalize("fOO"), "FOO")
  expect_equal(capitalize("FOO"), "FOO")
  expect_equal(capitalize("foo bar"), "Foo bar")
  
})

test_that("symbols and special cases are not capitalised",{
  
  expect_equal(capitalize("1foo"), "1foo")
  expect_equal(capitalize(".foo"), ".foo")
  expect_equal(capitalize("_foo"), "_foo")
  expect_equal(capitalize(" foo"), " foo")
  
})

test_that("special characters tidied away",{
  
  expect_equal(tidy_text("foo"), "foo")
  expect_equal(tidy_text("f.o.o"), "f o o")
  expect_equal(tidy_text("f_o_o"), "f o o")
  expect_equal(tidy_text("f_o.o"), "f o o")
  expect_equal(tidy_text("f$o$o"), "f$o$o")
  
})

