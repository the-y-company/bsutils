#' Alert
#' 
#' @param ... Content of alert.
#' @param class Additional classes, e.g.: `alert-success`.
#' 
#' @examples
#' alert(
#'   alertHeading("Header!"),
#'   shiny::p("Some content")
#' )
#' 
#' @export
alert <- \(
  ...,
  class = ""
) {
  div(
    class = sprintf("alert %s", class),
    role = "alert",
    ...
  )
}

#' Alert Heading
#' 
#' Alert heading to be placed in [alert()].
#' 
#' @param heading A character string or an HTML tag.
#' 
#' @importFrom htmltools tagAppendAttributes
#' 
#' @export 
alertHeading <- \(heading){
  if(is.character(heading))
    return(h4(class = "alert-heading", heading))

  tagAppendAttributes(
    heading,
    class = "alert-heading"
  )
}