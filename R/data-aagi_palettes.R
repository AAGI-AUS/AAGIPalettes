#' AAGI sequential and diverging colour palettes (hex codes)
#'
#' A nested list of sequential and diverging AAGI colour palettes used by
#' [aagi_palettes()]. The top-level names are palette identifiers (e.g.
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
#' defined only for 3–7 stops in the source function.
#'
#' @examples
#' # List available palettes
#' names(aagi_palettes_data)
#'
#' # Available 'n' values for a palette
#' names(aagi_palettes_data[["aagi_RdTl"]])
#'
#' # Get the 11-stop RdTl palette
#' aagi_palettes_data[["aagi_RdTl"]][["11"]]
#'
#' # Reverse order (equivalent to direction = -1)
#' rev(aagi_palettes_data[["aagi_RdTl"]][["11"]])
#'
#' @name data-aagi_palettes
#' @keywords datasets
#' @docType data
NULL
