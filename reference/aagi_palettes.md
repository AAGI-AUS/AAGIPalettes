# Sequential and Diverging Colour Palettes for AAGI Graphical Outputs

Sequential and Diverging Colour Palettes for AAGI Graphical Outputs

## Usage

``` r
aagi_palettes(
  n,
  name = c("aagi_BrYl", "aagi_BuOr", "aagi_BuYl", "aagi_GnYl", "aagi_RdBu", "aagi_RdTl",
    "aagi_RdYl", "aagi_TlGn", "aagi_TlYl", "aagi_TlGnYl", "aagi_blues",
    "aagi_bright_greens", "aagi_greens", "aagi_greys", "aagi_reds", "aagi_teals",
    "aagi_oranges", "aagi_yellows"),
  direction = 1L
)
```

## Arguments

- n:

  Integer. Number of different colours in the palette.

- name:

  Character. Name of the desired palette.

- direction:

  Integer. If `1`, default order. If `-1`, reverse order.

## Value

A character vector of hexadecimal colour codes.
