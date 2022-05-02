#' Tooltip
#' 
#' Add a tooltip to an element.
#' 
#' @param el Element.
#' @param title HTML tag or character vector of length 1.
#' @param placement Placement of the tooltip.
#' 
#' @examples
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   withTooltip(
#'     span("plain"),
#'     "content"
#'   ),
#'   br(),
#'   withTooltip(
#'     span("HTML"),
#'     tagList(
#'       strong("HTML"),
#'       "content"
#'     )
#'   )
#' )
#' 
#' server <- \(input, output, session){
#' }
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @export 
withTooltip <- \(
  el,
  title,
  placement = c(
    "top",
    "right",
    "bottom",
    "left"
  )
) {
  placement <- match.arg(placement)
  tagAppendAttributes(
    el,
    title = HTML(as.character(title)),
    `data-bs-placement` = placement,
    `data-bs-toggle` = "tooltip",
    `data-bs-html` = "true"
  ) |> 
    htmltools::attachDependencies(
      get_dep("tooltip")
    )
}