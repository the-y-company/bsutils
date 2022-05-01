#' Progress
#' 
#' Progress bars.
#' 
#' @param ... Progress bars as returned by [progressBar()].
#' @param id Parent id.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   actionButton(
#'     "rand",
#'     "Randomise"
#'   ),
#'   progress(
#'     progressBar(15, id = "bar")
#'   )
#' )
#' 
#' server <- \(input, output, session){
#'   observeEvent(input$rand, {
#'     update_progress("bar", sample(10:99, 1))
#'   })
#' }
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @export 
progress <- \(
  ...,
  id = NULL
) {
  div(
    class = "progress",
    ...
  )
}

#' Progress Bar
#' 
#' A progress bar to pass to [progress()].
#' 
#' @param value Value of progress bar.
#' @param min,max Minimum and maximum values.
#' @param id ID of progress bar.
#' @param class Additional classes.
#' 
#' @export 
progressBar <- \(
  value = 0L,
  min = 0L,
  max = 100L,
  id = NULL,
  class = ""
) {
  if(value < 0L || value > 100L)
    stop("`value` must be between 0 and 100")

  id <- get_id(id)
  val <- round((value / max) * 100)
  style <- sprintf("width: %s%%;", val)

  tagList(
    get_dep("progress"),
    div(
      id = id,
      class = sprintf("bsutils-progress progress-bar %s", class),
      role = "progressbar",
      style = style,
      `aria-valuenow` = value,
      `aria-valuemin` = min,
      `aria-valuemax` = max
    )
  )
}

#' Update Progress
#' 
#' Update a [progressBar()].
#' 
#' @param id ID of progress bar to update.
#' @param value Value to set the progress bar to.
#' @param session A valid shiny session.
#' 
#' @export 
update_progress <- \(
  id, 
  value, 
  session = shiny::getDefaultReactiveDomain()
){
  if(missing(id))
    stop("Missing `id`")

  if(missing(value))
    stop("Missing `value`")

  session$sendInputMessage(id, value)
}
