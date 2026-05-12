#' Sequential and Diverging Colour Palettes for AAGI Graphical Outputs
#'
#' @param name Character. Name of the desired palette.
#' @param n Integer. Number of different colours in the palette. Defaults to 5.
#' @param direction Integer. If `1`, default order. If `-1`, reverse order.
#'
#' @returns A character vector of hexadecimal colour codes.
#' @autoglobal
#' @export

aagi_palettes <- function(
  name,
  n = 5,
  direction = 1
) {
  name <- rlang::arg_match(name, .aagi_palette_names)

  if (
    ((!is.numeric(n) && !is.integer(n)) ||
      length(n) != 1L ||
      is.na(n) ||
      !is.finite(n))
  ) {
    cli::cli_abort(c(x = "{.arg n} must be a single finite numeric value."))
  }

  .validate_direction(direction)

  n <- as.integer(n)

  if (n < 3L) {
    cli::cli_warn(c(
      i = "You have requested <3 values for your palette.
        However, {.arg n} should be >3. Returning a palette with 3 values."
    ))
    n <- 3L
  }

  pal_env <- new.env(parent = emptyenv())
  utils::data("aagi_palettes_list", package = "AAGIPalettes", envir = pal_env)
  palettes <- pal_env[["aagi_palettes_list"]]

  pal <- palettes[[name]]
  if (is.null(pal)) {
    cli::cli_abort(c(x = "Unknown palette name: {.val {name}}."))
  }

  ns_avail <- sort(as.integer(names(pal)))

  if (!n %in% ns_avail) {
    if (n > max(ns_avail)) {
      cli::cli_warn(c(
        i = "You have requested >{max(ns_avail)} values for a palette that
          only has {max(ns_avail)} total. Returning a palette with
          {max(ns_avail)} values."
      ))
      n <- max(ns_avail)
    } else if (n < min(ns_avail)) {
      cli::cli_warn(c(
        i = "You have requested <{min(ns_avail)} values for a palette that
          starts at {min(ns_avail)}. Returning a palette with {min(ns_avail)}
          values."
      ))
      n <- min(ns_avail)
    } else {
      n2 <- max(ns_avail[ns_avail <= n])
      cli::cli_warn(c(
        i = "Palette {.val {name}} does not provide exactly {.val {n}} stops.
          Returning {.val {n2}} stops."
      ))
      n <- n2
    }
  }

  p <- pal[[as.character(n)]]
  if (direction == 1L) p else rev(p)
}
