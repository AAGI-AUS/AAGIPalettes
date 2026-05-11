# Validate a direction signal for a palette Direction values should be either -1 (reversed) or 1 (normal), this checks and ensures that users don't pass spurious values.

Validate a direction signal for a palette Direction values should be
either -1 (reversed) or 1 (normal), this checks and ensures that users
don't pass spurious values.

## Usage

``` r
.validate_direction(direction)
```

## Arguments

- direction:

  A user-passed value to validate.

## Value

An invisible `TRUE`.

## Examples

``` r
# Passes
.validate_direction(-1)
#> Error in .validate_direction(-1): could not find function ".validate_direction"
.validate_direction(1)
#> Error in .validate_direction(1): could not find function ".validate_direction"

# Fails
.validate_direction(-10)
#> Error in .validate_direction(-10): could not find function ".validate_direction"
.validate_direction(1.5)
#> Error in .validate_direction(1.5): could not find function ".validate_direction"
```
