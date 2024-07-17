#' Extract AAGI Colours as Hex Codes From Names
#'
#' Use plain English colour names for AAGI colours to get the hex codes.
#' 
#' @param name Character names of \acronym{AAGI} colours. Multiple values are
#'   allowed.
#' 
#' @examples
#' # return AAGI Black as a hex code
#' colour_as_hex(name = "AAGI Black")
#' 
#' # return AAGI Black, Bright Green and Orange as hex codes
#' colour_as_hex(name = c("AAGI Black", "AAGI Bright Green", "AAGI Orange"))
#' 
#' @export
colour_as_hex <- function(name = c(
                            "AAGI Black",
                            "AAGI Bright Green",
                            "AAGI Blue",
                            "AAGI Teal",
                            "AAGI Green",
                            "AAGI Yellow",
                            "AAGI Orange",
                            "AAGI Grey"
                          )) {

  name <- rlang::arg_match(name, multiple = TRUE)

  return(unname(AAGIPalettes::aagi_colours[name]))
}
