test_that("colour_as_hex returns expected hex code for one colour", {
  expect_identical(
    colour_as_hex("AAGI Black"),
    "#414042"
  )
})

test_that("colour_as_hex returns expected hex codes for multiple colours", {
  expect_identical(
    colour_as_hex(c("AAGI Black", "AAGI Bright Green", "AAGI Orange")),
    c("#414042", "#B6D438", "#ec8525")
  )
})

test_that("colour_as_hex preserves input order", {
  expect_identical(
    colour_as_hex(c("AAGI Orange", "AAGI Black", "AAGI Yellow")),
    c("#ec8525", "#414042", "#FFBC42")
  )
})

test_that("colour_as_hex validates names", {
  expect_snapshot(error = TRUE, {
    colour_as_hex("Not a real colour")
  })
})
