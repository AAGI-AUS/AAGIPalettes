
---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![R-CMD-check](https://github.com/AAGI-AUS/AAGIPalettes/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/AAGI-AUS/AAGIPalettes/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

# {AAGIPalettes} AAGI Colours and Colour Palettes for R <img align="right" src="man/figures/logo.png">

This repository contains the code for the R package {AAGIPalettes}, which once installed in your R session (local or RStudio Server), provides helper functions, data and palettes for working with AAGI colours.

## Installation instructions

You can install {AAGIPalettes} like so:

```r

o <- options() # store default options

options(pkg.build_vignettes = TRUE)
if (!require("pak"))
  install.packages("pak")
pak::pak("AAGI-AUS/AAGIPalettes")

options(o) # reset options
```

## Quick start

Following are some quick examples of {AAGIPalettes} functionality.

### Official Colours

{AAGIPalette} provides a data object of the official AAGI colours from the comms guide.
You can see the hex code values in a named vector like so.


``` r
library(AAGIPalettes)

aagi_colours
#> AAGI Bright Green         AAGI Teal         AAGI Blue        AAGI Green 
#>         "#B6D438"         "#00808b"         "#648FD2"         "#54921E" 
#>       AAGI Yellow       AAGI Orange        AAGI Black         AAGI Grey 
#>         "#FFBC42"         "#ec8525"         "#414042"         "#F2F2F2"
```

### Viewing Colours

{AAGIPalettes} provides limited functionality for viewing and working with colours.
You can plot the colours or palettes in the package as follows.


``` r
display_aagi_cols("aagi_colours")
```

<div class="figure">
<img src="man/figures/README-plot_official_colours-1.png" alt="A plot of the official AAGI colours." width="100%" />
<p class="caption">A plot of the official AAGI colours.</p>
</div>

Display the "aagi_BuOr" palette with 9 stops.


``` r
display_aagi_cols(name = "aagi_BuOr", n = 9)
```

<div class="figure">
<img src="man/figures/README-plot_BuOR-1.png" alt="A plot of the AAGI BuOr palette with 9 stops." width="100%" />
<p class="caption">A plot of the AAGI BuOr palette with 9 stops.</p>
</div>

### Interpolating Colours


``` r
library(ggplot2)

x <- interpolate_aagi_colours()
# round the weights to clean up the legend, this is just an e.g. after all...
wt_vals <- x(length(unique(round(mtcars$wt, 1))))

ggplot(mtcars, aes(x = mpg, y = hp, colour = as.factor(round(wt, 1)))) +
  geom_point() +
  scale_colour_manual("Weight", values = wt_vals)
```

<div class="figure">
<img src="man/figures/README-interpolate_colours-1.png" alt="A plot demonstrating the colour interpolation functionality of the package." width="100%" />
<p class="caption">A plot demonstrating the colour interpolation functionality of the package.</p>
</div>

## Code of Conduct

Please note that the AAGIPalettes project is released with a [Contributor Code of Conduct](https://AAGI-AUS.github.io/AAGIPalettes/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

## Logo Rights

The logo of this project and the AAGI strategic partners do not come under MIT License.
The Analytics for the Australian Grains Industry (AAGI) project retains full rights to the AGGI logo and the Grains Research and Development Corporation (GRDC) and strategic partners, Curtin University, the University of Queensland and Adelaide University, retain full rights to their own logos, respectively.
