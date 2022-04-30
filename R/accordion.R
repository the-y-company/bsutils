#' Accordion
#' 
#' Collapsible accordion made up of [accordionItem()].
#' 
#' @param ... Any number of [accordionItem()].
#' @param .id Id of accordion.
#' @param .flush remove default background color, some
#' borders, some rounded corners.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   accordion(
#'     accordionItem(
#'       .expanded = TRUE,
#'       "Something",
#'       p("Some content")
#'     ),
#'     accordionItem(
#'       "Something else",
#'       p("Some other content")
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
#' @import shiny
#' 
#' @export 
accordion <- \(
  ...,
  .id = NULL,
  .flush = FALSE
) {
  fns <- list(...)

  if(length(fns) == 0L)
    stop("Must pass `accordionItem`")

  flush <- ifelse(.flush, "accordion-flush", "")
  id <- get_id(.id)

  fns |> 
    lapply(\(fn) {
      fn(id)
    }) |> 
    div(
      class = sprintf("accordion %s", flush),
      id = id
    )
}

#' AccordionItem
#' 
#' Accordion item to place within [accordion()].
#' 
#' @param label Label of the item.
#' @param ... Elements to place in the body of the item.
#' @param .id Id of item.
#' @param .expanded Whether the element is initially expanded.
#' @param .label_tag Tag to use for the label.
#' 
#' @export 
accordionItem <- \(
  label,
  ...,
  .id = NULL,
  .expanded = FALSE,
  .label_tag = shiny::h2
) {
  if(missing(label))
    stop("Missing `label`")

  id <- get_id(.id)

  toggled <- ifelse(.expanded, "show", "collapse")
  toggled_button <- ifelse(.expanded, "", "collapsed")

  \(parent_id) {
    div(
      class = "accordion-item",
      .label_tag(
        class = "accordion-header",
        tags$button(
          class = sprintf("accordion-button %s", toggled_button),
          type = "button",
          `data-bs-toggle` = "collapse",
          `data-bs-target` = sprintf("#%s", id),
          `aria-expanded` = tolower(.expanded),
          `aria-controls` = id,
          label
        )
      ),
      div(
        id = id,
        class = sprintf("accordion-collapse collapse %s", toggled),
        `data-bs-parent` = sprintf("#%s", parent_id),
        div(
          class = "accordion-body",
          ...
        )
      )
    )
  }
}
