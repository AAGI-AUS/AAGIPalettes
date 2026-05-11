test_that(".validate_direction accepts only -1 and 1", {
  expect_invisible(.validate_direction(1))
  expect_invisible(.validate_direction(-1))
})

test_that(".validate_direction rejects invalid values", {
  expect_error(
    .validate_direction(0),
    "must be either"
  )

  expect_error(
    .validate_direction(1.5),
    "must be either"
  )

  expect_error(
    .validate_direction("1"),
    "must be either"
  )
})
