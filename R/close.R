#' Close Button
#' 
#' Button to dismiss or close a component.
#' 
#' @export 
closeButton <- \() {
  tags$button(
    type = "button",
    class = "btn-close",
    `aria-label` = "Close"
  )
}