# aagi_palettes validates palette name

    Code
      aagi_palettes("not_a_palette", n = 5)
    Condition
      Error in `aagi_palettes()`:
      ! `name` must be one of "aagi_BrYl", "aagi_BuOr", "aagi_BuYl", "aagi_GnYl", "aagi_RdBu", "aagi_RdTl", "aagi_RdYl", "aagi_TlGn", "aagi_TlYl", "aagi_TlGnYl", "aagi_blues", "aagi_bright_greens", "aagi_greens", "aagi_greys", "aagi_reds", "aagi_teals", "aagi_oranges", or "aagi_yellows", not "not_a_palette".

# aagi_palettes validates n

    Code
      aagi_palettes("aagi_RdTl", n = NA)
    Condition
      Error in `aagi_palettes()`:
      x `n` must be a single finite numeric value.

---

    Code
      aagi_palettes("aagi_RdTl", n = Inf)
    Condition
      Error in `aagi_palettes()`:
      x `n` must be a single finite numeric value.

---

    Code
      aagi_palettes("aagi_RdTl", n = c(4, 5))
    Condition
      Error in `aagi_palettes()`:
      x `n` must be a single finite numeric value.

---

    Code
      aagi_palettes("aagi_RdTl", n = "5")
    Condition
      Error in `aagi_palettes()`:
      x `n` must be a single finite numeric value.

# aagi_palettes validates direction

    Code
      aagi_palettes("aagi_RdTl", n = 5, direction = 0)
    Condition
      Error in `.validate_direction()`:
      x Invalid `direction`: 0.
      i `direction` must be either -1 (reversed) or 1 (normal).

---

    Code
      aagi_palettes("aagi_RdTl", n = 5, direction = 1.5)
    Condition
      Error in `.validate_direction()`:
      x Invalid `direction`: 1.5.
      i `direction` must be either -1 (reversed) or 1 (normal).

---

    Code
      aagi_palettes("aagi_RdTl", n = 5, direction = "1")
    Condition
      Error in `.validate_direction()`:
      x Invalid `direction`: "1".
      i `direction` must be either -1 (reversed) or 1 (normal).

# aagi_palettes warns and clamps n below 3

    Code
      pal <- aagi_palettes("aagi_RdTl", n = 2)
    Condition
      Warning:
      i You have requested <3 values for your palette. However, `n` should be >3. Returning a palette with 3 values.

# aagi_palettes warns and clamps n above max available

    Code
      pal <- aagi_palettes("aagi_RdTl", n = max_n + 1)
    Condition
      Warning:
      i You have requested >11 values for a palette that only has 11 total. Returning a palette with 11 values.

