
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
messages and invisibly returns one random quote by any of the main
characters in the show. It can also take a `quote_id` argument, which
specifies the quote to return.

``` r
library(rBreakingBad)

one_who_knocks(quote_id = NULL, message = TRUE)
#> I'm a lawyer, not a criminal - Jimmy McGill
one_who_knocks(quote_id = 1, message = TRUE)
#> I am not in danger, Skyler. I am the danger! - Walter White
```
