#' Retrieve a Random Breaking Bad Quote
#'
#' This function retrieves a random quote from
#' \url{https://breakingbadapi.com} and returns an S3 object containing the
#' parsed request result and the request itself.
#'
#' @param quote_id Look up a quote by id.
#' @param quote_by Look up a quote by character in the show.
#' @return an S3 object
#' @importFrom magrittr %>%
#' @export
#'
bb_quote <- function(quote_id = NULL, quote_by = NULL) {

  url <- "https://www.breakingbadapi.com/api"

  # Determine endpoint.

  # If `quote_id` or `quote_by` is given, look up quote by id/name.
  # If not, return random quote.
  # When both `quote_id` and `quote_by` are provided, `quote_by` will be ignored.
  if(!is.null(quote_id)) {
    path <- paste0("/quotes/", quote_id)
  }
  else if(!is.null(quote_by)) {
    path <- paste0("/quote?author=", gsub(" ", "+", quote_by))
  }
  else {
    path <- "/quote/random"
  }
  url <- paste0(url, path)

  resp <- httr::GET(url)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  # parse the response, grab the first item in the list of lists
  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

  # Only return 1 quote. (author endpoint returns more than 1 quotes)
  parsed <- parsed[[sample(1:length(parsed), 1)]]

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

#' Print method for bb_api object
#'
#' This is a print method for the S3 bb_api object.
#'
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
#' @param quote_id Look up a quote by id.
#' @param quote_by Look up a quote by character in the show.
#' @param message A boolean. If TRUE, the quote is messaged to console.
#' @return a character vector
#' @export
#'
one_who_knocks <- function(quote_id = NULL, quote_by = NULL, message = TRUE) {
  quote_ <- rBreakingBad::bb_quote(quote_id, quote_by)$content
  output <- paste(quote_$quote, "-", quote_$author)

  if(message == TRUE) message(output)
  invisible(output)
}
