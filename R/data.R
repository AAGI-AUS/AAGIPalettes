#' Official AAGI Colours From the AAGI Comms Guide
#'
#' A Vector of the official AAGI Colour Hex Codes.  Other colour palettes are
#'   provided via [aagi_palettes_list] for plotting purposes but may not
#'   considered to be "official" \acronym{AAGI} colours.
#'
#' @format A `vector` with eight (8) colours as hexadecimal values:
#'   \describe{
#'      \item{AAGI Bright Green}{#B6D438}
#'      \item{AAGI Teal}{#00808B}
#'      \item{AAGI Blue}{#648FD2}
#'      \item{AAGI Green}{#54921E}
#'      \item{AAGI Yellow}{#FFBC42}
#'      \item{AAGI Orange}{#ec8525}
#'      \item{AAGI Black}{#414042}
#'      \item{AAGI Grey}{#F2F2F2}
#'      }
#' @keywords datasets
#' @docType data
#' @family data

"aagi_colours"

#' AAGI sequential and diverging colour palettes (hex codes)
#'
#' A nested list of sequential and diverging \acronym{AAGI} colour palettes used
#' by [aagi_palettes()]. The top-level names are palette identifiers (*e.g.*,
#' `"aagi_RdTl"`). Each palette is itself a named list keyed by the number of
#' colour stops (`"3"`, `"4"`, …). Each entry is a character vector of hex
#' colour codes of length `n`.
#'
#' This dataset is intended for internal reuse and for users who want direct
#' access to the fixed palette definitions without calling the palette function.
#'
#' @format A named list of named lists of character vectors.
#'
#' @details
#' Not all palettes support all values of `n`. For example, `"aagi_RdYl"` is
#' defined only for 3–7 stops.
#'
#' @examples
#' # List available palettes
#' names(aagi_palettes_list)
#'
#' # Available 'n' values for a palette
#' names(aagi_palettes_list[["aagi_RdTl"]])
#'
#' # Get the 11-stop RdTl palette
#' aagi_palettes_list[["aagi_RdTl"]][["11"]]
#'
#' # Reverse order (equivalent to direction = -1)
#' rev(aagi_palettes_list[["aagi_RdTl"]][["11"]])
#'
#' @keywords datasets
#' @docType data
#' @family data

"aagi_palettes_list"
