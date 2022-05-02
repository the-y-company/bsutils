#' List Group
#' 
#' List group, see [listGroupItem()].
#' 
#' @param ... Content of the list group, see [listGroupItem()].
#' 
#' @export 
listGroup <- \(
  ...
) {
  tags$ul(
    class = "list-group",
    ...
  )
}

#' List Group Item
#' 
#' Items for [listGroup()].
#' 
#' @param ... Content.
#' @param class Additional classes.
#' 
#' @export 
listGroupItem <- \(
  ...,
  class = ""
) {
  tags$li(
    class = sprintf("list-group-item %s", class),
    ...
  )
}