#' file metadata
#' 
#' associate metadata with a file
#' @export
#' @param x (character) a file path
#' @param metadata metadata something or other
#' @return file path for the metadata file, containing
#' RDF
#' @examples
#' library(contentid)
#' f <- system.file("extdata", "vostok.icecore.co2", package = "contentid")
#' x <- file(f)
#' 
#' # create some metadata file
#' library(rdflib)
#' r <- rdf()
#' z <- rdf_add(r,
#'   subject = "http://www.dajobe.org/",
#'   predicate = "http://purl.org/dc/elements/1.1/language",
#'   object = "en")
#' file_metadata(x, metadata=z)
file_metadata <- function(x, metadata) {
  if (!contentid:::is_hash(x, "hashuri"))
    stop("'x' should be a contentid hash")
  hex <- last(stract(x, contentid:::hex_regex)[[1]])
  file <- paste0(hex, ".rdf")
  rdflib::rdf_serialize(metadata, file)
  return(file)
}
