# Interpolate an AAGI Colour Palette to Expand the Colour Values

Takes a AAGI colour palette and generates more colours from it, so that
there are enough to make your chart. The interpolation method is set to
`spline` (the default is `linear`) in an attempt to reduce the number of
vomit colours that get produced when generating many colours.

## Usage

``` r
interpolate_aagi_colours(
  colours = c("AAGI Orange", "AAGI Yellow", "AAGI Bright Green", "AAGI Green",
    "AAGI Teal", "AAGI Blue"),
  direction = 1,
  ...
)
```

## Arguments

- colours:

  `Character`; given names of AAGI colours to use in the interpolation.
  Defaults to "AAGI Orange", "AAGI Yellow", "AAGI Bright Green", "AAGI
  Teal", "AAGI Blue" in that order.

- direction:

  `Integer` Sets the order of colours in the scale. If `1`, the default
  order is used. If `-1`, the order of colours is reversed.

- ...:

  Additional arguments to pass to
  [`grDevices::colorRampPalette()`](https://rdrr.io/r/grDevices/colorRamp.html),
  see details here
  [`grDevices::colorRamp()`](https://rdrr.io/r/grDevices/colorRamp.html).

## Value

A function that takes a single value and makes that many colours.

## See also

aagi_palettes

## Examples

``` r
library(ggplot2)

x <- interpolate_aagi_colours()
# round the weights to clean up the legend, this is just an e.g. after all...
wt_vals <- x(length(unique(round(mtcars$wt, 1))))

ggplot(mtcars, aes(x = mpg, y = hp, colour = as.factor(round(wt, 1)))) +
  geom_point() +
  scale_colour_manual("Weight", values = wt_vals)

```
