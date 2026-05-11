test_that("display_aagi_cols works for aagi_colours", {
  expect_invisible(display_aagi_cols("aagi_colours"))
})

test_that("display_aagi_cols works for named palettes", {
  expect_invisible(display_aagi_cols("aagi_RdTl", n = 5))
})

test_that("display_aagi_cols validates palette name", {
  expect_snapshot(error = TRUE, {
    display_aagi_cols("not_a_palette")
  })
})

test_that("contrast_color chooses black text for light colours", {
  expect_identical(contrast_color("#FFFFFF"), "black")
  expect_identical(contrast_color("#F2F2F2"), "black")
})

test_that("contrast_color chooses white text for dark colours", {
  expect_identical(contrast_color("#000000"), "white")
  expect_identical(contrast_color("#414042"), "white")
})
