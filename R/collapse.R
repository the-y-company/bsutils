#' Collapse Button
#' 
#' Collapse button.
#' 
#' @param content An object of class `collapseContent`
#' as returned by [collapseContent()].
#' @param ... Passed to the button.
#' @param class Additional classes to pass to the button.
#' 
#' @export 
#' @name collapseButton
collapseButton <- \(
  content, 
  ...,
  class = ""
){
  UseMethod("collapseButton")
}

#' @describeIn collapseButton Collapse button
#' @method collapseButton collapseContent
#' @export 
collapseButton.collapseContent <- \(
  content,
  ...,
  class = ""
){
  target_id <- htmltools::tagGetAttribute(content, "id")

  class <- sprintf("btn btn-default %s", class)

  div(
    tags$a(
      class = class,
      `data-bs-toggle` = "collapse",
      role = "button",
      `aria-expanded` = "false",
      `aria-controls` = target_id,
      href = sprintf("#%s", target_id),
      ...
    ),
    content
  )
}

#' Collapse Link
#' 
#' Collapse link.
#' 
#' @param content An object of class `collapseContent`
#' as returned by [collapseContent()].
#' @param ... Passed to the link.
#' 
#' @export 
#' @name collapseLink
collapseLink <- \(
  content, 
  ...
){
  UseMethod("collapseLink")
}

#' @describeIn collapseLink Collapse button
#' @method collapseLink collapseContent
#' @export 
collapseLink.collapseContent <- \(
  content,
  ...
){
  target_id <- htmltools::tagGetAttribute(content, "id")

  div(
    tags$a(
      `data-bs-toggle` = "collapse",
      `aria-expanded` = "false",
      `aria-controls` = target_id,
      href = sprintf("#%s", target_id),
      ...
    ),
    content
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