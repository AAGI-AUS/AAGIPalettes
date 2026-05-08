#' AAGI Palette Plots
#'
#' A quick and dirty way to show \acronym{AAGI} colours in a palette plot.
#'
#' @param name Either `aagi_colours` (default) or a palette name from the lists
#'   below.
#' @param n `Numeric` Number of different colours in the palette, minimum 3,
#'   maximum depends on the palette. Defaults to `5`.  Ignored if name is
#'   `aagi_colours`.
#'
#' There are two (2) types of palettes provided, sequential and diverging.
#'  1. Sequential palettes are suited to ordered data that progress from low
#'   to high.  Lightness steps dominate the look of these schemes, with light
#'   colours for low data values to dark colours for high data values.
#'  2. Diverging palettes put equal emphasis on mid-range critical values and
#'   extremes at both ends of the data range.  The critical class or break in
#'   the middle of the legend is emphasized with light colours and low and high
#'   extremes are emphasized with dark colours that have contrasting hues.
#'
#' The sequential palettes names are:
#' * \dQuote{aagi_blues},
#' * \dQuote{aagi_bright_greens},
#' * \dQuote{aagi_greens},
#' * \dQuote{aagi_greys},
#' * \dQuote{aagi_reds},
#' * \dQuote{aagi_oranges},
#' * \dQuote{aagi_teals},
#' * \dQuote{aagi_TlGnYl},
#' * \dQuote{aagi_TlYl},
#' * \dQuote{aagi_yellows}
#'
#' All the sequential palettes are available in variations from 3 different
#'  values up to 11 different values.
#'
#' The diverging palettes are:
#' * \dQuote{aagi_BrYl}
#' * \dQuote{aagi_BuOr},
#' * \dQuote{aagi_BuYl},
#' * \dQuote{aagi_GnYl},
#' * \dQuote{aagi_RdBu},
#' * \dQuote{aagi_RdTl},
#' * \dQuote{aagi_RdYl},
#' * \dQuote{aagi_TlGn}
#'
#' All the diverging palettes are available in variations from 3 different
#'  values up to 11 different values.
#'
#' For qualitative palettes, the lowest number of distinct values available
#'  always is 3, but the largest number is different for different palettes.
#'  It is given together with the palette names in the following table.

#' @returns Called for its side-effects, a plot of the given palette.
#' @export
#'
#' @examples
#'
#' # display the official AAGI colours
#' display_aagi_cols(name = "aagi_colours")
#'
#' # display five colours from the Blue Orange diverging palette
#' display_aagi_cols(name = "aagi_BuOr")
#'
display_aagi_cols <- function(name = "aagi_colours", n = NULL) {
  name <- rlang::arg_match0(
    name,
    values = c(
      "aagi_colours",
      .aagi_colour_names
    )
  )
  if (name %in% c("aagi_colours")) {
    return(show_col_base(AAGIPalettes::aagi_colours))
  } else {
    if (is.null(n)) {
      n <- 5L
    }
    return(show_col_base(aagi_palettes(
      n = n,
      name = name,
      direction = 1L
    )))
  }
}

show_col_base <- function(colours) {
  colours <- toupper(colours)
  n <- length(colours)
  ncol <- ceiling(sqrt(n))
  nrow <- ceiling(n / ncol)

  # Pad to fill grid
  colours <- c(colours, rep(NA, ncol * nrow - n))

  plot(
    0,
    0,
    type = "n",
    xlim = c(0, ncol),
    ylim = c(0, nrow),
    xlab = "",
    ylab = "",
    axes = FALSE
  )

  for (i in seq_len(ncol * nrow)) {
    col <- ((i - 1L) %% ncol)
    row <- nrow - ((i - 1L) %/% ncol) - 1L
    if (!is.na(colours[i])) {
      rect(col, row, col + 1L, row + 1L, col = colours[i], border = NA)
      text(
        col + 0.5,
        row + 0.5,
        colours[i],
        cex = 0.7,
        col = contrast_color(colours[i])
      )
    }
  }
}

contrast_color <- function(hex) {
  rgb <- col2rgb(hex)
  # Perceived luminance (standard formula)
  luminance <- (0.299 * rgb[1] + 0.587 * rgb[2] + 0.114 * rgb[3]) / 255
  if (luminance > 0.5) "black" else "white"
}
