test_that("aagi_palettes returns palette values for valid inputs", {
  pal <- aagi_palettes("aagi_RdTl", n = 5)

  expect_type(pal, "character")
  expect_length(pal, 5)
  expect_true(all(grepl("^#[A-Fa-f0-9]{6}$", pal)))
  expect_identical(pal, aagi_palettes_list[["aagi_RdTl"]][["5"]])
})

test_that("aagi_palettes reverses palette when direction = -1", {
  forward <- aagi_palettes("aagi_RdTl", n = 5, direction = 1)
  reverse <- aagi_palettes("aagi_RdTl", n = 5, direction = -1)

  expect_identical(reverse, rev(forward))
})

test_that("aagi_palettes accepts numeric n and coerces to integer", {
  pal_num <- aagi_palettes("aagi_RdTl", n = 5)
  pal_dbl <- aagi_palettes("aagi_RdTl", n = 5.0)

  expect_identical(pal_num, pal_dbl)
})

test_that("aagi_palettes validates palette name", {
  expect_snapshot(error = TRUE, {
    aagi_palettes("not_a_palette", n = 5)
  })
})

test_that("aagi_palettes validates n", {
  expect_snapshot(error = TRUE, {
    aagi_palettes("aagi_RdTl", n = NA)
  })

  expect_snapshot(error = TRUE, {
    aagi_palettes("aagi_RdTl", n = Inf)
  })

  expect_snapshot(error = TRUE, {
    aagi_palettes("aagi_RdTl", n = c(4, 5))
  })

  expect_snapshot(error = TRUE, {
    aagi_palettes("aagi_RdTl", n = "5")
  })
})

test_that("aagi_palettes validates direction", {
  expect_snapshot(error = TRUE, {
    aagi_palettes("aagi_RdTl", n = 5, direction = 0)
  })

  expect_snapshot(error = TRUE, {
    aagi_palettes("aagi_RdTl", n = 5, direction = 1.5)
  })

  expect_snapshot(error = TRUE, {
    aagi_palettes("aagi_RdTl", n = 5, direction = "1")
  })
})

test_that("aagi_palettes warns and clamps n below 3", {
  expect_snapshot({
    pal <- aagi_palettes("aagi_RdTl", n = 2)
  })

  expect_length(pal, 3)
  expect_identical(pal, aagi_palettes_list[["aagi_RdTl"]][["3"]])
})

test_that("aagi_palettes warns and clamps n above max available", {
  max_n <- max(as.integer(names(aagi_palettes_list[["aagi_RdTl"]])))

  expect_snapshot({
    pal <- aagi_palettes("aagi_RdTl", n = max_n + 1)
  })

  expect_length(pal, max_n)
  expect_identical(
    pal,
    aagi_palettes_list[["aagi_RdTl"]][[as.character(max_n)]]
  )
})
