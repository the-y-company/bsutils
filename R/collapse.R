#' Collapse
#' 
#' Create a collapsible.
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
#'   collapse(
#'     collapseLink(
#'       "Reveal"
#'     ),
#'     collapseContent(
#'       "Some collapsed content"
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
#' @name collapse
#' @export
collapse <- \(trigger, content) UseMethod("collapse")

#' @describeIn collapse Collapse wrapper
#' @method collapse collapseTrigger
#' @export 
collapse.collapseTrigger <- \(
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

#' Collapse Button
#' 
#' Collapse button.
#' 
#' @param ... Passed to the button.
#' @param id Button id.
#' @param class Additional classes to pass to the button.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   collapse(
#'     collapseButton(
#'       "Reveal"
#'     ),
#'     collapseContent(
#'       "Some collapsed content"
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
#' @export 
collapseButton <- \(
  ...,
  id = NULL,
  class = ""
){
  id <- get_id(id)
  class <- sprintf("btn btn-default action-button %s", class)

  btn <- \(target_id){
    class <- sprintf("btn btn-default %s", class)
    tags$a(
      id = id,
      class = class,
      `data-bs-toggle` = "collapse",
      role = "button",
      `aria-expanded` = "false",
      `aria-controls` = target_id,
      href = sprintf("#%s", target_id),
      ...
    )
  }

  structure(
    btn,
    class = c("collapseTrigger", class(btn))
  )
}

#' Collapse Link
#' 
#' Collapse link.
#' 
#' @param ... Passed to the link.
#' @param id Link id.
#' @param class Additional class to pass to the link.
#' 
#' @export 
#' @name collapseLink
collapseLink <- \(
  ...,
  id = NULL,
  class = ""
){
  id <- get_id(id)
  class <- sprintf("action-button %s", class)

  lnk <- \(target_id){
    tags$a(
      `data-bs-toggle` = "collapse",
      `aria-expanded` = "false",
      `aria-controls` = target_id,
      href = sprintf("#%s", target_id),
      ...
    )
  }

  structure(
    lnk,
    class = c("collapseTrigger", class(lnk))
  )
}

#' Collapse Content
#' 
#' Collapse content, to pass to [collapseButton()] or 
#' [collapseLink()].
#' 
#' @param ... Content of the collapsible.
#' @param .id Id of the element.
#' 
#' @export
collapseContent <- \(
  ...,
  .id = NULL
){

  id <- get_id(.id)

  content <- div(
    class = "collapse",
    id = id,
    ...
  )

  structure(
    content,
    class = c("collapseContent", class(content))
  )
}
