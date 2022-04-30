#' Offcanvas Button
#' 
#' Offcanvas button trigger.
#' 
#' @param content Content of the offcanvas as returned by 
#' [offcanvasContent()].
#' @param ... Passed to the button.
#' @param class Additional class to pass to the button.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   offcanvasButton(
#'     offcanvasContent(
#'       offcanvasHeader(
#'         "Off canvas"
#'       ),
#'       p(
#'         "Hello world"
#'       )
#'     ),
#'     "Open"
#'   )
#' )
#' 
#' server <- \(input, output, session){
#' 
#' }
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @name offcanvasButton
#' 
#' @export
offcanvasButton <- \(
  content,
  ...,
  class = ""
) {
  UseMethod("offcanvasButton")
}

#' @importFrom htmltools tagGetAttribute
#' @describeIn offcanvasButton Button for offcanvas content
#' @method offcanvasButton offcanvasContent
#' @export 
offcanvasButton.offcanvasContent <- \(
  content,
  ...,
  class = ""
) {
  target_id <- tagGetAttribute(content, "id")

  class <- sprintf("btn btn-default %s", class)

  tagList(
    tags$button(
      class = class,
      type = "button",
      `data-bs-toggle` = "offcanvas",
      `data-bs-target` = sprintf("#%s", target_id),
      `aria-controls` = target_id,
      ...
    ),
    content 
  )
}

#' Offcanvas Content
#' 
#' Offcanvas content.
#' 
#' @param ... Content of the offcanvas.
#' @param id Id of the canvas.
#' @param class Additional classes.
#' @param .position Where the canvas should open.
#' 
#' @export 
offcanvasContent <- \(
  ...,
  id = NULL,
  class = "",
  .position = c("start", "end", "top", "bottom")
) {
  id <- get_id(NULL)
  position <- match.arg(.position)
  class <- sprintf("offcanvas offcanvas-%s %s", position, class)

  content <- div(
    class = class,
    tabindex = "-1",
    id = id,
    div(
      class = "offcanvas-body",
      ...
    )
  )

  structure(
    content,
    class = c("offcanvasContent", class(content))
  )
}

#' Canvas Header
#' 
#' Header for [offcanvasContent()].
#' 
#' @param header An HTML tag or a character string.
#' 
#' @export 
offcanvasHeader <- \(
  header
) {
  if(missing(header))
    stop("Missing `header`")

  if(is.character(header))
    header <- h5(header)

  div(
    class = "offcanvas-header",
    header,
    tags$button(
      type = "button",
      class = "btn-close text-reset",
      `data-bs-dismiss` = "offcanvas",
      `aria-label` = "Close"
    )
  )
}