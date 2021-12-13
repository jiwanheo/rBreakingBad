
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
messages and invisibly returns one random quote from the show. It can
take a `quote_id` argument, which can look up and return a quote by ID,
as well as `quote_by` argument, that takes a name of a character, and
returns a random quote from them.

``` r
library(rBreakingBad)

one_who_knocks()
#> Shut up! Shut up! Shut up! - Skyler White
one_who_knocks(quote_id = 1)
#> I am not in danger, Skyler. I am the danger! - Walter White
one_who_knocks(quote_by = "Jesse Pinkman")
#> Yeah, totally Kafkaesque - Jesse Pinkman
```
