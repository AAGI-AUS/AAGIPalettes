

#' Interpolate an AAGI Colour Palette to Expand the Colour Values
#'
#' Takes a \acronym{AAGI} colour palette and generates more colours from it, so
#'   that there are enough to make your chart. The interpolation method is set
#'   to `spline` (the default is `linear`) in an attempt to reduce the number of
#'   vomit colours that get produced when generating many colours.
#'
#' @param palette (`character`; default = `colourful`) given name of an
#'   \acronym{AAGI} palette: [aagi_palettes()]
#' @param reverse (`Boolean`; default = `FALSE`) indicating if palette should
#'   be reversed.
#' @param ... Additional arguments to pass to [grDevices::colorRampPalette()],
#'   see details here [grDevices::colorRamp()].
#'
#' @returns A function that takes a single value and makes that many colours.
#'
#' @seealso aagi_palettes
#'
#' @examples
#' library(ggplot2)
#'
#' x <- interpolate_aagi_palette("colourful")
#' # round the weights to clean up the legend, this is just an e.g. after all...
#' wt_vals <- x(length(unique(round(mtcars$wt, 1))))
#'
#' ggplot(mtcars, aes(x = mpg, y = hp, colour = as.factor(round(wt, 1)))) +
#' geom_point() +
#' scale_colour_manual("Weight", values = wt_vals)
#'
#' @export
#'
interpolate_aagi_palette <- function(palette = "colourful",
                                    reverse = FALSE,
                                    ...) {
  pal <- rlang::arg_match(
    palette,
    multiple = FALSE,
    values = c(
      "colourful",
      "primary",
      "secondary",
      "sequential",
      "diverging"
    )
  )
  pal <- aagi_palettes()[[palette]]

  if (reverse)
    pal <- rev(pal)

  grDevices::colorRampPalette(pal, ..., interpolate = "spline")
}
