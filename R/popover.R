#' Popover
#' 
#' Add a popover to an element.
#' 
#' @param el Element to place popover on.
#' @param content Content of the popover.
#' @param title Optional popover title.
#' @param container container of the popover.
#' @param placement Position of the popover.
#' 
#' @export 
withPopover <- \(
  el,
  content, 
  title = NULL,
  container = "body",
  placement = c(
    "top",
    "right",
    "bottom",
    "left"
  )
) {
  if(missing(el))
    stop("Missing `el`")

  if(missing(content))
    stop("Missing `content`")

  placement <- match.arg(placement)

  el <- tagAppendAttributes(
    el,
    `data-bs-toggle` = "popover",
    `data-bs-content` = content,
    `data-bs-placement` = placement,
    `data-bs-container` = container
  )

  if(!is.null(title))
    el <- tagAppendAttributes(
      el,
      title = title
    )

  htmltools::attachDependencies(el, get_dep("popover"))
}