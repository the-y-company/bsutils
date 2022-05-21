#' Alert
#' 
#' @param id ID of alert useful to toggle from server with
#' [alert_show()] or [alert_hide()].
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
  id = NULL,
  class = ""
) {
  tagList(
    get_dep("alert"),
    div(
      id = id,
      class = sprintf("alert %s", class),
      role = "alert",
      ...
    )
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

#' Toggle Alert
#' 
#' Show or hide an alert.
#' 
#' @param id ID of [alert()] to toggle.
#' @param session A valid shiny session.
#' 
#' @name alertServer
#' @export 
alert_show <- \(
  id,
  session = shiny::getDefaultReactiveDomain()
) {
  session$sendCustomMessage(
    "alert-show",
    id
  )
}

#' @rdname alertServer
#' @export 
alert_hide <- \(
  id,
  session = shiny::getDefaultReactiveDomain()
) {
  session$sendCustomMessage(
    "alert-hide",
    id
  )
}
