#' Card
#' 
#' Card.
#' 
#' @param ... Content, generally [cardBody()].
#' 
#' @examples
#' card(
#'   cardHeader("Header"),
#'   cardBody(
#'     cardTitle("Title"),
#'     cardSubtitle("Subtitle"),
#'     cardText("The content of the card")
#'   )
#' )
#' 
#' @export 
card <- \(
  ...
) {
  div(
    class = "card",
    ...
  )
}

#' Card Body
#' 
#' Card body to be placed within [card()].
#' 
#' @param ... Content, HTML tags, [cardText()], [cardTitle()],
#' or [cardSubtitle()].
#' 
#' @export 
cardBody <- \(
  ...
) {
  div(
    class = "card-body",
    ...
  )
}

#' Card Text
#' 
#' Card text to be placed in [cardBody()].
#' 
#' @param ... Content of the text.
#' 
#' @export 
cardText <- \(
  ...
) {
  p(
    class = "card-text",
    ...
  )
}

#' Card Title & Subtitle
#' 
#' Card title and subtitle to be placed within [cardBody()].
#' 
#' @param content Content of the title or subtitle, either
#' a character vector or an HTML header tag.
#' 
#' @name cardTitle
#' @export 
cardTitle <- \(
  content
) {
  if(missing(content))
    stop("Missing `content`")

  if(is.character(content))
    return(h5(content, class = "card-title"))

  tagAppendAttributes(
    content,
    class = "card-title"
  )
}

#' @rdname cardTitle
#' @export
cardSubtitle <- \(
  content
) {
  if(missing(content))
    stop("Missing `content`")

  if(is.character(content))
    return(h6(content, class = "card-subtitle"))

  tagAppendAttributes(
    content,
    class = "card-subtitle"
  )
}

#' Card Header
#' 
#' Card header placed within [card()] before [cardBody()].
#' 
#' @param content Content of the title or subtitle, either
#' a character vector or an HTML header tag.
#' 
#' @importFrom htmltools tagAppendAttributes
#' 
#' @export 
cardHeader <- \(
  content
) {
  if(missing(content))
    stop("Missing `content`")
  
  if(is.character(content))
    return(h5(content, class = "card-header"))

  tagAppendAttributes(
    content,
    class = "card-header"
  )
}
