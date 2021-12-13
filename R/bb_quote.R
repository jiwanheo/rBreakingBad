#' Retrieve a Random Breaking Bad Quote
#'
#' This function retrieves a random quote from
#' \url{https://breakingbadapi.com} and returns an S3 object containing the
#' parsed request result and the request itself.
#'
#' @param quote_id A specific quote ID to return
#' @return an S3 object
#' @importFrom magrittr %>%
#' @export
#'
bb_quote <- function(quote_id = NULL) {

  url <- "https://www.breakingbadapi.com/api"

  # If `quote_id` is given, look up quote by id. If not, return random
  path <- if(is.null(quote_id)) "/quote/random" else paste0("/quotes/", quote_id)
  url <- paste0(url, path)

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
      path = path,
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
  cat("<Breaking Bad ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}

#' Print a Breaking Bad Quote and Author
#'
#' This function returns a random quote and its author from
#' \url{https://breakingbadapi.com} as a single character vector. It first
#' messages the quote and invisibly returns it.
#'
#' @param quote_id A specific quote ID to return
#' @param message A boolean. If TRUE, the quote is messaged to console.
#' @return a character vector
#' @export
#'
one_who_knocks <- function(quote_id = NULL, message = TRUE) {
  quote_ <- rBreakingBad::bb_quote(quote_id)$content
  output <- paste(quote_$quote, "-", quote_$author)

  if(message == TRUE) message(output)
  invisible(output)
}
