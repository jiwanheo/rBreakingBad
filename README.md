
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rBreakingBad

<!-- badges: start -->
<!-- badges: end -->

An R package to get Breaking Bad quotes!

![](https://media.giphy.com/media/3oFzmkkwfOGlzZ0gxi/giphy.gif)

## Installation

``` r
remotes::install_github("jiwanheo/rBreakingBad")
```

## Usage

The main function of this package is `one_who_knocks`. By default, it
messages and invisibly returns one random quote from the show.

``` r
library(rBreakingBad)

one_who_knocks(message = TRUE)
#> Shut up! Shut up! Shut up! - Skyler White
```

It can take one of two arguments, `quote_id` and `quote_by`.

`quote_id` looks up and returns a specific quote by ID, whereas
`quote_by` argument takes the name of a character, and returns a random
quote from them.

``` r
one_who_knocks(quote_id = 1)
#> I am not in danger, Skyler. I am the danger! - Walter White
one_who_knocks(quote_by = "Jesse Pinkman")
#> Hey, you girls. Want to meet my fat stack? - Jesse Pinkman
```
