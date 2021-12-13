skip_on_cran()

x <- rBreakingBad::one_who_knocks(message = FALSE)
x_id <- rBreakingBad::one_who_knocks(quote_id = 5, message = FALSE)

test_that("one_who_knocks returns a string", {
  expect_type(x, "character")
})

test_that("one_who_knocks returns correct quote by id", {
  expect_equal(x_id, "Say my name. - Walter White")
})
