#' file
#' @export
#' @param x (character) a file path
#' @param meta either a file path (character), rdf objet from package
#' \pkg{rdflib}, or `NULL`
#' @examples
#' # a file that's already on the web
#' x <- system.file("extdata", "vostok.icecore.co2", package = "contentid")
#' capin(x)
#' url <- 'https://cdiac.ess-dive.lbl.gov/ftp/trends/co2/vostok.icecore.co2'
#' capin(url)
#' 
#' # a file not on the web
#' w <- tempfile(fileext=".csv")
#' df <- data.frame(a = letters, b = LETTERS)
#' write.csv(df, file = w)
#' res <- capin(w)
#' res
#' contentid::query_sources(res)
#' 
#' # associate metadata with the data
#' x <- system.file("extdata", "vostok.icecore.co2", package = "contentid")
#' m <- system.file("examples/rdf_eg1.rdf", package = "capins")
#' capin(x, meta = m)
capin <- function(x, meta = NULL) {
  stopifnot("metadata must be NULL or character" = 
    is.character(meta) || is.null(meta) || inherits(meta, "rdf"))
  tmp <- contentid::register(x)
  class(tmp) <- "capin"
  if (!is.null(meta)) {
    if (is.character(meta)) {
      stopifnot("file does not exist" = file.exists(meta))
      mfile <- meta
    } else {
      mfile <- capin_metadata(tmp, meta)
    }
    attr(tmp, "metadata") <- mfile
  }
  return(tmp)
}

# url <- "https://raw.githubusercontent.com/facebook/prophet/master/examples/example_retail_sales.csv"
# ctid_pin <- contentid::pin(url)
# read.csv(ctid_pin)
# pins_pin <- pins::pin(url)
# read.csv(pins_pin)

