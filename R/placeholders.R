#' As Placeholder
#' 
#' Turn an element into a placeholder.
#' 
#' @param el Element to turn into a placeholder.
#' @param glow Whether the elements should glow.
#' 
#' @examples 
#' shiny::p() |> 
#'  asPlaceholder()
#' 
#' shiny::actionButton("id", "") |> 
#'  asPlaceholder()
#' 
#' @export 
asPlaceholder <- \(el, glow = FALSE){
  if(missing(el))
    stop("Missing `el`")

  cls <- "placeholder"
  if(glow)
    cls <- paste0(cls, "-glow")

  htmltools::tagAppendAttributes(
    el,
    class = cls
  )
}