test_that(".validate_direction accepts -1 and 1", {
  expect_invisible(.validate_direction(1))
  expect_invisible(.validate_direction(-1))
})

test_that(".validate_direction rejects invalid values", {
  expect_snapshot(error = TRUE, {
    .validate_direction(0)
  })

  expect_snapshot(error = TRUE, {
    .validate_direction(1.5)
  })

  expect_snapshot(error = TRUE, {
    .validate_direction("1")
  })

  expect_snapshot(error = TRUE, {
    .validate_direction(c(1, -1))
  })

  expect_snapshot(error = TRUE, {
    .validate_direction(NA)
  })
})
