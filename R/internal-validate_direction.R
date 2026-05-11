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
  if (
    !is.numeric(direction) ||
      !rlang::is_scalar_atomic(direction) ||
      !(direction %in% c(-1, 1))
  ) {
    cli::cli_abort(c(
      x = "Invalid {.arg direction}: {.val {direction}}.",
      i = "{.arg direction} must be either {-1} (reversed) or {1} (normal)."
    ))
  }

  invisible(TRUE)
}
