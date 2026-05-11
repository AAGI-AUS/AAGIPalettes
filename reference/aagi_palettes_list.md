# AAGI sequential and diverging colour palettes (hex codes)

A nested list of sequential and diverging AAGI colour palettes used by
[`aagi_palettes()`](https://AAGI-AUS.github.io/AAGIPalettes/reference/aagi_palettes.md).
The top-level names are palette identifiers (e.g. `"aagi_RdTl"`). Each
palette is itself a named list keyed by the number of colour stops
(`"3"`, `"4"`, …). Each entry is a character vector of hex colour codes
of length `n`.

A nested list of sequential and diverging AAGI colour palettes used by
[`aagi_palettes()`](https://AAGI-AUS.github.io/AAGIPalettes/reference/aagi_palettes.md).
The top-level names are palette identifiers (e.g. `"aagi_RdTl"`). Each
palette is itself a named list keyed by the number of colour stops
(`"3"`, `"4"`, …). Each entry is a character vector of hex colour codes
of length `n`.

## Format

A named list of named lists of character vectors.

A named list of named lists of character vectors.

## Details

This dataset is intended for internal reuse and for users who want
direct access to the fixed palette definitions without calling the
palette function.

Not all palettes support all values of `n`. For example, `"aagi_RdYl"`
is defined only for 3–7 stops in the source function.

This dataset is intended for internal reuse and for users who want
direct access to the fixed palette definitions without calling the
palette function.

Not all palettes support all values of `n`. For example, `"aagi_RdYl"`
is defined only for 3–7 stops in the source function.

## Examples

``` r
# List available palettes
names(aagi_palettes_list)
#>  [1] "aagi_BrYl"          "aagi_BuOr"          "aagi_BuYl"         
#>  [4] "aagi_GnYl"          "aagi_RdBu"          "aagi_RdTl"         
#>  [7] "aagi_RdYl"          "aagi_TlGn"          "aagi_TlGnYl"       
#> [10] "aagi_TlYl"          "aagi_blues"         "aagi_bright_greens"
#> [13] "aagi_greens"        "aagi_greys"         "aagi_reds"         
#> [16] "aagi_teals"         "aagi_oranges"       "aagi_yellows"      

# Available 'n' values for a palette
names(aagi_palettes_list[["aagi_RdTl"]])
#> [1] "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11"

# Get the 11-stop RdTl palette
aagi_palettes_list[["aagi_RdTl"]][["11"]]
#>  [1] "#8b0b00" "#a8432d" "#c36d59" "#da9788" "#eec2b9" "#ffeeed" "#c6e4e7"
#>  [8] "#9ecacf" "#76b1b8" "#4b98a1" "#00808b"

# Reverse order (equivalent to direction = -1)
rev(aagi_palettes_list[["aagi_RdTl"]][["11"]])
#>  [1] "#00808b" "#4b98a1" "#76b1b8" "#9ecacf" "#c6e4e7" "#ffeeed" "#eec2b9"
#>  [8] "#da9788" "#c36d59" "#a8432d" "#8b0b00"

# List available palettes
names(aagi_palettes_list)
#>  [1] "aagi_BrYl"          "aagi_BuOr"          "aagi_BuYl"         
#>  [4] "aagi_GnYl"          "aagi_RdBu"          "aagi_RdTl"         
#>  [7] "aagi_RdYl"          "aagi_TlGn"          "aagi_TlGnYl"       
#> [10] "aagi_TlYl"          "aagi_blues"         "aagi_bright_greens"
#> [13] "aagi_greens"        "aagi_greys"         "aagi_reds"         
#> [16] "aagi_teals"         "aagi_oranges"       "aagi_yellows"      

# Available 'n' values for a palette
names(aagi_palettes_list[["aagi_RdTl"]])
#> [1] "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11"

# Get the 11-stop RdTl palette
aagi_palettes_list[["aagi_RdTl"]][["11"]]
#>  [1] "#8b0b00" "#a8432d" "#c36d59" "#da9788" "#eec2b9" "#ffeeed" "#c6e4e7"
#>  [8] "#9ecacf" "#76b1b8" "#4b98a1" "#00808b"

# Reverse order (equivalent to direction = -1)
rev(aagi_palettes_list[["aagi_RdTl"]][["11"]])
#>  [1] "#00808b" "#4b98a1" "#76b1b8" "#9ecacf" "#c6e4e7" "#ffeeed" "#eec2b9"
#>  [8] "#da9788" "#c36d59" "#a8432d" "#8b0b00"
```
