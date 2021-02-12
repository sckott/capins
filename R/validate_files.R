#' check if two files are the same
#' 
#' use case: user wants to compare if contents of two files are the same
#' @export
#' @param x,y two file paths
#' @return boolean, whether files have the same content or not, 
#' based on comparing output of [contentid::content_id()] with [identical()]
#' @examples
#' x <- tempfile()
#' writeLines("foo bar\n", x)
#' y <- tempfile()
#' file.copy(x, y)
#' same_files(x, y)
same_files <- function(x, y) {
  identical(contentid::content_id(x), contentid::content_id(y))
}
