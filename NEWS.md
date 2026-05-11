# AAGIPalettes 0.0.2
- Strengthened input validation in `aagi_palettes()`: `n` is now validated
  (scalar, finite, non-`NA`) before coercion; `direction` is validated before
  the overflow guards run.
- Fixed overflow guard for `aagi_greens`: previously capped at 7 stops instead
  of its actual maximum of 9 stops.
- Added overflow guard for `aagi_RdYl`, which has a 7-stop maximum; requests
  above 7 now warn and clamp correctly instead of silently returning `NULL`.
- Replaced `ifelse(direction == 1, return(p), return(rev(p)))` with idiomatic
  `if/else`; removed dead `return(p)` that followed it.
- Fixed `interpolate_aagi_colours()` colour validation: colours are now matched
  against all eight official `aagi_colours` names rather than only the six
  listed in the parameter default.
- Added `direction` validation to `interpolate_aagi_colours()` to match the
  behaviour already present in `aagi_palettes()`.
- Simplified `display_aagi_cols()`: moved the `n = 5L` default into the
  function signature, removing the runtime `NULL` fallback.
- Renamed test file `test-test-colours_as_hex.R` to `test-colours_as_hex.R`

# AAGIPalettes 0.0.1

- First stable release
