# .validate_direction rejects invalid values

    Code
      .validate_direction(0)
    Condition
      Error in `.validate_direction()`:
      x Invalid `direction`: 0.
      i `direction` must be either -1 (reversed) or 1 (normal).

---

    Code
      .validate_direction(1.5)
    Condition
      Error in `.validate_direction()`:
      x Invalid `direction`: 1.5.
      i `direction` must be either -1 (reversed) or 1 (normal).

---

    Code
      .validate_direction("1")
    Condition
      Error in `.validate_direction()`:
      x Invalid `direction`: "1".
      i `direction` must be either -1 (reversed) or 1 (normal).

---

    Code
      .validate_direction(c(1, -1))
    Condition
      Error in `.validate_direction()`:
      x Invalid `direction`: 1 and -1.
      i `direction` must be either -1 (reversed) or 1 (normal).

---

    Code
      .validate_direction(NA)
    Condition
      Error in `.validate_direction()`:
      x Invalid `direction`: NA.
      i `direction` must be either -1 (reversed) or 1 (normal).

