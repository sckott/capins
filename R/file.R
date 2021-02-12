#' file
#' @export
#' @param x (character) a file path
#' @examples
#' # a file that's already on the web
#' x <- system.file("extdata", "vostok.icecore.co2", package = "contentid")
#' file(x)
#' url <- 'https://cdiac.ess-dive.lbl.gov/ftp/trends/co2/vostok.icecore.co2'
#' file(url)
#' 
#' # a file not on the web
#' w <- tempfile(fileext=".csv")
#' df <- data.frame(a = letters, b = LETTERS)
#' write.csv(df, file = w)
#' res <- file(w)
#' res
#' contentid::query_sources(res)
file <- function(x) {
  contentid::register(x)
}

# url <- "https://raw.githubusercontent.com/facebook/prophet/master/examples/example_retail_sales.csv"
# ctid_pin <- contentid::pin(url)
# read.csv(ctid_pin)
# pins_pin <- pins::pin(url)
# read.csv(pins_pin)

