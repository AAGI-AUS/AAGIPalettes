test_that("colour_as_hex returns expected hex codes for one or more colours", {
  expect_identical(
    colour_as_hex("AAGI Black"),
    "#414042"
  )

  expect_identical(
    colour_as_hex(c("AAGI Black", "AAGI Bright Green", "AAGI Orange")),
    c("#414042", "#B6D438", "#ec8525")
  )
})

test_that("colour_as_hex errors for unknown names", {
  expect_error(
    colour_as_hex("Not a real colour"),
    'not "Not a real colour"'
  )
})
