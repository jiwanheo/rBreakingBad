x <- rBreakingBad::bb_quote()

test_that("bb_quote returns an S3 object with correct names", {
  expect_s3_class(x, "bb_api")
  expect_equal(names(x), c("content", "response"))
})
