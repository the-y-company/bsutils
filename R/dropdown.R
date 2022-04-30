#' Dropdown Button
#' 
#' Dropdown buttons for [shiny::actionLink()].
#' 
#' @param label Label of the dropdown.
#' @param ... [shiny::actionLink()] to place within the
#' dropdown.
#' @param id ID of parent dropdown.
#' @param class Additional class for dropdown button.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   dropdownButton(
#'     "Buttons",
#'     actionLink("first", "First"),
#'     actionLink("second", "Second")
#'   )
#' )
#' 
#' server <- \(input, output, session){
#' 
#' }
#' 
#' if(interactive())
#'   shinyApp(ui, server)
#' 
#' @importFrom htmltools tagAppendAttributes
#' 
#' @export 
dropdownButton <- \(
  label,
  ...,
  id = NULL,
  class = ""
) {

  id <- get_id(id)
  class <- sprintf("btn btn-default dropdown-toggle %s", class)

  btns <- list(...) |> 
    lapply(\(btn) {
      btn <- tagAppendAttributes(btn, class = "dropdown-item")
      tags$li(btn)
    })

  div(
    class = "dropdown",
    tags$button(
      class = class,
      type = "button",
      `data-bs-toggle` = "dropdown",
      `aria-expanded` = "false",
      id = id,
      label
    ),
    tags$ul(
      class = "dropdown-menu",
      `aria-labelledby` = id,
      btns
    )
  )
}