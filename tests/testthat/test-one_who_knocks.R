x <- rBreakingBad::one_who_knocks()

test_that("one_who_knocks returns a string", {
  expect_type(x, "character")
})
