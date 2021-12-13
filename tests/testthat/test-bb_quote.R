x <- rBreakingBad::bb_quote()
x_id <- rBreakingBad::bb_quote(quote_id = 5)

test_that("bb_quote returns an S3 object with correct names", {
  expect_s3_class(x, "bb_api")
  expect_equal(names(x), c("content", "path", "response"))
})

test_that("bb_quote returns correct quote by id", {
  expect_equal(x_id$content$quote, "Say my name.")
})
