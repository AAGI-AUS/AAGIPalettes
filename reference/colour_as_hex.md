# Extract AAGI Colours as Hex Codes From Names

Use plain English colour names for AAGI colours to get the hex codes.

## Usage

``` r
colour_as_hex(
  name = c("AAGI Black", "AAGI Bright Green", "AAGI Blue", "AAGI Teal", "AAGI Green",
    "AAGI Yellow", "AAGI Orange", "AAGI Grey")
)
```

## Arguments

- name:

  Character names of AAGI colours. Multiple values are allowed.

## Value

A string value that consists of the corresponding colour hex code that
was requested.

## Examples

``` r
# return AAGI Black as a hex code
colour_as_hex(name = "AAGI Black")
#> [1] "#414042"

# return AAGI Black, Bright Green and Orange as hex codes
colour_as_hex(name = c("AAGI Black", "AAGI Bright Green", "AAGI Orange"))
#> [1] "#414042" "#B6D438" "#ec8525"
```
