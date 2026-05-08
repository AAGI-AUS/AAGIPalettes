#' Validate a direction signal for a palette
#' Direction values should be either -1 (reversed) or 1 (normal), this
#' checks and ensures that users don't pass spurious values.
#' @param direction A user-passed value to validate.
#' @examples
#' # Passes
#' .validate_direction(-1)
#' .validate_direction(1)
#'
#' # Fails
#' .validate_direction(-10)
#' .validate_direction(1.5)
#' @returns An invisible `TRUE`.
#' @dev
.validate_direction <- function(direction) {
  if (direction != -1 && direction != 1) {
    cli::cli_abort(
      c(
        x = "You have entered an invalid value for {.arg direction}.",
        i = "{.arg direction}; it should be either -1 (reversed) or 1 (normal)."
      )
    )
  }
  return(invisible(TRUE))
}
