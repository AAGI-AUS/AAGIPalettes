#' Sequential and Diverging Colour Palettes for AAGI Graphical Outputs
#'
#' @param n Integer. Number of different colours in the palette.
#' @param name Character. Name of the desired palette.
#' @param direction Integer. If `1`, default order. If `-1`, reverse order.
#'
#' @returns A character vector of hexadecimal colour codes.
#' @autoglobal
#' @export
aagi_palettes <- function(
  n,
  name = c(
    "aagi_BrYl",
    "aagi_BuOr",
    "aagi_BuYl",
    "aagi_GnYl",
    "aagi_RdBu",
    "aagi_RdTl",
    "aagi_RdYl",
    "aagi_TlGn",
    "aagi_TlYl",
    "aagi_TlGnYl",
    "aagi_blues",
    "aagi_bright_greens",
    "aagi_greens",
    "aagi_greys",
    "aagi_reds",
    "aagi_teals",
    "aagi_oranges",
    "aagi_yellows"
  ),
  direction = 1L
) {
  name <- rlang::arg_match(name)
  n <- as.integer(n)

  if (direction != -1L && direction != 1L) {
    cli::cli_abort(
      c(
        x = "You have entered an invalid value for {.arg direction},
        {.val direction}; it should be either -1 (reversed) or 1 (normal)."
      )
    )
  }

  if (n < 3L) {
    cli::cli_warn(
      c(
        i = "You have requested <3 values for your palette.
        However, {.arg n} should be >3. Returning a palette with 3 values."
      )
    )
    n <- 3L
  }

  # Look up palette in data
  pal <- aagi_palettes_list[[name]]
  if (is.null(pal)) {
    cli::cli_abort(c(x = "Unknown palette name: {.val {name}}."))
  }

  # Determine which n values exist for this palette and clamp as needed
  ns_avail <- as.integer(names(pal))
  ns_avail <- sort(ns_avail)

  # If requested n doesn't exist, clamp to nearest available <= n,
  # otherwise to max available (this mimics your old “cap at max stops” behavior).
  if (!n %in% ns_avail) {
    if (n > max(ns_avail)) {
      cli::cli_warn(
        c(
          i = "You have requested >{max(ns_avail)} values for a palette that
          only has {max(ns_avail)} total. Returning a palette with
          {max(ns_avail)} values."
        )
      )
      n <- max(ns_avail)
    } else if (n < min(ns_avail)) {
      # Should only happen if min(ns_avail) > 3, but handle generically.
      cli::cli_warn(
        c(
          i = "You have requested <{min(ns_avail)} values for a palette that
          starts at {min(ns_avail)}. Returning a palette with {min(ns_avail)}
          values."
        )
      )
      n <- min(ns_avail)
    } else {
      # For gaps (e.g. if a palette had 3,5,7 only), pick nearest lower
      n2 <- max(ns_avail[ns_avail <= n])
      cli::cli_warn(
        c(
          i = "Palette {.val {name}} does not provide exactly {.val {n}} stops.
          Returning {.val {n2}} stops."
        )
      )
      n <- n2
    }
  }

  p <- pal[[as.character(n)]]

  if (direction == -1L) {
    p <- rev(p)
  }

  return(p)
}
