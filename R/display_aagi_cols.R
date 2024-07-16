#' AAGI Palette Plots
#'
#' A quick and dirty way to show \acronym{AAGI} colours in a palette plot.
#' 
#' @param name A either `aagi_colours` or a palette name from the lists below.
#' @param n `Numeric` Number of different colours in the palette, minimum 3,
#'   maximum depends on the palette. Defaults to `5`.  Ignored if name is
#'   `aagi_colours`.
#'
#' There are 3 types of palettes provided, qualitative, sequential and
#'   diverging.
#' \enumerate{
#'  \item{qualitative palettes are suited to ...}
#'  \item{Sequential palettes are suited to ordered data that progress from low
#'   to high.  Lightness steps dominate the look of these schemes, with light
#'   colours for low data values to dark colours for high data values.}
#'  \item{Diverging palettes put equal emphasis on mid-range critical values and
#'   extremes at both ends of the data range.  The critical class or break in
#'   the middle of the legend is emphasized with light colours and low and high
#'   extremes are emphasized with dark colours that have contrasting hues.}
#'  }
#' 
#' The sequential palettes names are:
#' * \dQuote{aagi_blues},
#' * \dQuote{aagi_bright_greens},
#' * \dQuote{aagi_BrYl},
#' * \dQuote{aagi_greens},
#' * \dQuote{aagi_greys},
#' * \dQuote{aagi_reds},
#' * \dQuote{aagi_oranges},
#' * \dQuote{aagi_RdYl},
#' * \dQuote{aagi_teals},
#' * \dQuote{aagi_TlGnYl},
#' * \dQuote{aagi_TlYl},
#' * \dQuote{aagi_yellows}
#'
#' All the sequential palettes are available in variations from 3 different
#'  values up to 11 different values.
#'
#' The diverging palettes are:
#' * \dQuote{aagi_BuOr},
#' * \dQuote{aagi_BuYl},
#' * \dQuote{aagi_GnYl},
#' * \dQuote{aagi_RdBu},
#' * \dQuote{aagi_RdTl},
#' * \dQuote{aagi_TlGn}
#'
#' All the diverging palettes are available in variations from 3 different
#'  values up to 11 different values.
#'
#' For qualitative palettes, the lowest number of distinct values available
#'  always is 3, but the largest number is different for different palettes.
#'  It is given together with the palette names in the following table.

#' @return `NULL`. Called for its side-effects, a plot of the given palette.
#' @export
#'
#' @examples
#' 
#' # display the official AAGI colours
#' display_aagi_cols(aagi_colours)
#' 
#' # display five colours from the Blue Orange diverging palette
#' display_aagi_cols(name = "aagi_BuOr")
#'
display_aagi_cols <- function(name, n = NULL) {

  if (name == "aagi_colours") {
    return(scales::show_col(aagi_colours))
  } else {
    if (is.null(n)) {
      n <- 5
    }
    return(scales::show_col(aagi_palettes(
      n = n,
      name = name,
      direction = 1
    )))
  }
}
