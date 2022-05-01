#' Offcanvas
#' 
#' Create an offcanvas element.
#' 
#' @param trigger A [collapseButton()] or [collapseLink()].
#' @param content The offcanvas content as returned by
#' [offcanvasContent()].
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   offcanvas(
#'     offcanvasButton(
#'       "Open"
#'     ),
#'     offcanvasContent(
#'       offcanvasHeader(
#'         "Off canvas"
#'       ),
#'       p(
#'         "Hello world"
#'       )
#'     )
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
#' @importFrom htmltools tagGetAttribute
#' 
#' @name offcanvas
#' @export
offcanvas <- \(trigger, content) UseMethod("offcanvas")

#' @describeIn offcanvas Offcanvas Wrapper
#' @method offcanvas offcanvasTrigger
#' @export 
offcanvas.offcanvasTrigger <- \(
  trigger,
  content
){
  if(missing(trigger))
    stop("Missing `trigger`")

  if(missing(content))
    stop("Missing `content`")

  target_id <- tagGetAttribute(content, "id")

  tagList(
    trigger(target_id),
    content
  )
}

#' Offcanvas Button
#' 
#' Offcanvas button trigger.
#' 
#' @param ... Passed to the button.
#' @param id ID of the button.
#' @param class Additional class to pass to the button.
#' 
#' @export
offcanvasButton <- \(
  ...,
  id = NULL,
  class = ""
) {
  id <- get_id(id)
  class <- sprintf("btn btn-default action-button %s", class)

  btn <- \(target_id) {
    tags$button(
      id = id,
      class = class,
      type = "button",
      `data-bs-toggle` = "offcanvas",
      `data-bs-target` = sprintf("#%s", target_id),
      `aria-controls` = target_id,
      ...
    )
  }

  structure(
    btn,
    class = c("offcanvasTrigger", class(btn))
  )
}

#' Offcanvas Link
#' 
#' Offcanvas link trigger.
#' 
#' @param ... Passed to the button.
#' @param id ID of the link.
#' @param class Additional class to pass to the button.
#' 
#' @export
offcanvasLink <- \(
  ...,
  id = NULL,
  class = ""
) {
  id <- get_id(id)
  class <- sprintf("action-button %s", class)

  lnk <- \(target_id) {
    tags$a(
      id = id,
      class = class,
      `data-bs-toggle` = "offcanvas",
      `data-bs-target` = sprintf("#%s", target_id),
      `aria-controls` = target_id,
      ...
    )
  }

  structure(
    lnk,
    class = c("offcanvasTrigger", class(lnk))
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