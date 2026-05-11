test_that("interpolate_aagi_colours returns a palette function", {
  pal_fun <- interpolate_aagi_colours()

  expect_type(pal_fun, "closure")
})

test_that("interpolate_aagi_colours generated function returns requested number of colours", {
  pal_fun <- interpolate_aagi_colours()
  cols <- pal_fun(7)

  expect_type(cols, "character")
  expect_length(cols, 7)
  expect_true(all(grepl("^#[A-Fa-f0-9]{6}$", cols)))
})

test_that("interpolate_aagi_colours reverses order when direction = -1", {
  forward <- interpolate_aagi_colours(
    colours = c("AAGI Orange", "AAGI Yellow", "AAGI Bright Green"),
    direction = 1
  )(6)

  reverse <- interpolate_aagi_colours(
    colours = c("AAGI Orange", "AAGI Yellow", "AAGI Bright Green"),
    direction = -1
  )(6)

  expect_identical(reverse, rev(forward))
})

test_that("interpolate_aagi_colours warns for a single colour", {
  expect_warning(
    pal_fun <- interpolate_aagi_colours(colours = "AAGI Orange"),
    "only one colour"
  )

  expect_type(pal_fun, "closure")
})

test_that("interpolate_aagi_colours errors for no colours", {
  expect_error(
    interpolate_aagi_colours(colours = character(0)),
    "provided no colours"
  )
})

test_that("interpolate_aagi_colours errors for invalid direction", {
  expect_error(
    interpolate_aagi_colours(direction = 0),
    "must be either"
  )
})
