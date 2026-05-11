test_that("aagi_palettes returns a character vector of requested length", {
  pal <- aagi_palettes("aagi_RdTl", n = 5)

  expect_type(pal, "character")
  expect_length(pal, 5)
  expect_true(all(grepl("^#[A-Fa-f0-9]{6}$", pal)))
})

test_that("aagi_palettes reverses palette order when direction = -1", {
  forward <- aagi_palettes("aagi_RdTl", n = 5, direction = 1)
  reverse <- aagi_palettes("aagi_RdTl", n = 5, direction = -1)

  expect_identical(reverse, rev(forward))
})

test_that("aagi_palettes rejects invalid n values", {
  expect_error(
    aagi_palettes("aagi_RdTl", n = NA),
    "must be a single finite numeric value"
  )

  expect_error(
    aagi_palettes("aagi_RdTl", n = c(3, 4)),
    "must be a single finite numeric value"
  )

  expect_error(
    aagi_palettes("aagi_RdTl", n = Inf),
    "must be a single finite numeric value"
  )
})

test_that("aagi_palettes warns and clamps n below 3", {
  expect_warning(
    pal <- aagi_palettes("aagi_RdTl", n = 2),
    "Returning a palette with 3 values"
  )

  expect_length(pal, 3)
})

test_that("aagi_palettes warns and clamps n above available maximum", {
  max_n <- max(as.integer(names(aagi_palettes_list[["aagi_RdTl"]])))

  expect_warning(
    pal <- aagi_palettes("aagi_RdTl", n = max_n + 10),
    paste0("Returning a palette with\\s+", max_n, "\\s+values")
  )

  expect_length(pal, max_n)
})

test_that("aagi_palettes errors for invalid direction", {
  expect_error(
    aagi_palettes("aagi_RdTl", n = 5, direction = 0),
    "direction.*must be either"
  )
})
