#' Function to return a random quote
#'
#' This function returns a random quote from
#' \url{https://breakingbadapi.com}. It first messages the quote and invisibly
#' returns it as a character.
#'
#' @return Invisibly returns the first item holding the quote as a character.
#' @importFrom magrittr %>%
#' @export
#'
bb_quote <- function() {
  url <- "https://www.breakingbadapi.com/api/quote/random"

  resp <- httr::GET(url)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  # parse the response, grab the first item in the list of lists
  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)[[1]]

  # S3 object to return both content and response
  structure(
    list(
      content = parsed,
      response = resp
    ),
    class = "bb_api"
  )

}

# Print method for bb_api object

#' @noRd
#' @importFrom utils str
#' @export
#'
print.bb_api <- function(x, ...) {
  cat("<Breaking Bad ", ">\n", sep = "")
  str(x$content)
  invisible(x)
}

#' Print a Breaking Bad Quote and Author
#'
#' This function returns a random quote and its author from
#' \url{https://breakingbadapi.com} as a single character vector. It first
#' messages the quote and invisibly returns it.
#'
#' @return a character vector
#' @export
#'
one_who_knocks <- function() {
  quote_ <- rBreakingBad::bb_quote()$content
  output <- paste(quote_$quote, "-", quote_$author)

  message(output)
  invisible(output)
}
