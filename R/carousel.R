#' Carousel
#' 
#' Carousel element.
#' 
#' @param ... Slides of the carousel, see [carouselItem()].
#' @param id ID of carousel.
#' @param class Additional class of the carousel.
#' @param indicators Whether to show indicators.
#' @param controls Whether to show control arrows.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   carousel(
#'     indicators = TRUE,
#'     controls = TRUE,
#'     carouselItem(
#'       h5("Hello"),
#'       class = "bg-primary rounded p-4"
#'     ),
#'     carouselItem(
#'       h5("World"),
#'       class = "bg-info rounded p-4"
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
carousel <- \(
  ...,
  id = NULL,
  class = "",
  controls = FALSE,
  indicators = FALSE
) {
  items <- list(...)
  id <- get_id(id)

  items[[1]] <- tagAppendAttributes(
    items[[1]],
    class = "active"
  )

  inner <- div(
    class = "carousel-inner",
    items
  )

  tagList(
    get_dep("carousel"),
    div(
      id = id,
      class = sprintf("bsutils-carousel carousel slide %s", class),
      `data-bs-ride` = "carousel",
      carouselIndicators(items, id, indicators),
      inner,
      carouselControls(controls, id)
    )
  )
}

#' Carousel Indicators
#' 
#' Carousel indicators
#' 
#' @param items list of [carouselItem()].
#' @param id Parent if of [carousel()].
#' @param show Whether to show the indicators.
#' 
#' @keywords internal
carouselIndicators <- \(
  items,
  id,
  show
) {
  if(!show)
    return()

  n <- length(items)
  lapply(1:n, \(i) {
    tags$button(
      type = "button",
      `data-bs-target` = sprintf("#%s", id),
      `data-bs-slide-to` = i - 1,
      class = if(i == 1) "active", 
      `aria-current` = if(i == 1) "true"
    )
  }) |> 
    div(
      class = "carousel-indicators"
    )
}

#' Carousel Controls
#' 
#' Carousel control arrows.
#' 
#' @param show Whether to show the control arrows.
#' @param id ID of parent [carousel()].
#' 
#' @keywords internal
carouselControls <- \(
  show,
  id
){
  if(!show)
    return()

  tagList(
    tags$button(
      class = "carousel-control-prev",
      type = "button",
      `data-bs-target` = sprintf("#%s", id),
      `data-bs-slide` = "prev",
      tags$span(
        class = "carousel-control-prev-icon",
        `aria-hidden` = "true"
      ),
      tags$span(
        class = "visually-hidden",
        "Previous"
      )
    ),
    tags$button(
      class = "carousel-control-next",
      type = "button",
      `data-bs-target` = sprintf("#%s", id),
      `data-bs-slide` = "next",
      tags$span(
        class = "carousel-control-next-icon",
        `aria-hidden` = "true"
      ),
      tags$span(
        class = "visually-hidden",
        "Next"
      )
    ) 
  )
}

#' Carousel Item
#' 
#' Carousel item to use within [carousel()].
#' 
#' @param ... Content of item.
#' @param interval Number of milliseconds this item should be shown.
#' @param class Additional classes.
#' 
#' @export 
carouselItem <- \(
  ...,
  interval = NULL,
  class = ""
) {
  div(
    class = sprintf("carousel-item %s", class),
    `data-bs-interval` = interval,
    ...
  )
}

#' Carousel Image
#' 
#' Carousel image to use within [carouselItem()].
#' 
#' @param ... Passed to `<img/>`.
#' @param class Additional classes.
#' 
#' @export 
carouselImg <- \(
  ...,
  class = ""
) {
  tags$img(
    class = sprintf("d-block w-100 %s", class),
    ...
  )
}
