#' Badge
#' 
#' Badge.
#' 
#' @param ... Content of the badge.
#' @param color Background color of the badge.
#' @param pill Whether to create a rounded badge.
#' @param class Additional classes to passs to the badge.
#' 
#' @export 
badge <- \(
  ...,
  color = c(
    "primary",
    "secondary",
    "success",
    "danger",
    "warning",
    "info",
    "light",
    "dark"
  ),
  pill = FALSE,
  class = ""
) {
  color <- match.arg(color)
  pill_class <- ""

  if(pill)
    pill_class <- "rounded-pill"

  cl <- sprintf(
    "badge bg-%s %s",
    color,
    pill_class
  )

  span(
    class = cl,
    ...
  )
}