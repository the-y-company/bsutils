#' Button Group
#' 
#' Group of buttons.
#' 
#' @param ... Any [shiny::actionButton()].
#' @param class Any additional class.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   buttonGroup(
#'     actionButton("first", "First", class = "btn-primary"),
#'     actionButton("second", "Second", class = "btn-warning"),
#'     actionButton("third", "Third", class = "btn-success")
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
buttonGroup <- \(
  ...,
  class = ""
) {
  div(
    class = sprintf("btn-group %s", class),
    ...
  )
}
