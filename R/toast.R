#' Toast
#' 
#' Toast notifications.
#' 
#' @param id ID of toast, used to show/hide from server.
#' @param ... Content, generally [toastHeader()], [toastBody()].
#' @param class Any additional classes.
#' @param position Position of the toast.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   toast(
#'     "toast",
#'     toastHeader(
#'       strong(
#'         "Toast",
#'         class = "me-auto"
#'       )
#'     ),
#'     toastBody("The body of the toast!")
#'   ),
#'   h1("Hello"),
#'   actionButton("show", "Show toast"),
#'   actionButton("hide", "Hide toast")
#' )
#' 
#' server <- \(input, output, session){
#'   observeEvent(input$show, {
#'     toast_show("toast", auto_hide = FALSE)
#'   })
#' 
#'   observeEvent(input$hide, {
#'     toast_hide("toast")
#'   })
#' }
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @export 
toast <- \(
  id,
  ...,
  class = "",
  position = c(
    "top-right", 
    "top-left", 
    "bottom-right", 
    "bottom-left"
  )
) {
  if(missing(id))
    stop("Missing `id`")

  style <- get_position(position)

  tagList(
    get_dep("toast"),
    div(
      class = sprintf("position-fixed %s", style),
      div(
        class = sprintf("toast %s", class),
        role = "alert",
        `aria-live` = "assertive",
        `aria-atomic` = "true",
        id = id,
        ...
      )
    )
  )
}

#' Toast Content
#' 
#' Content of the toast to place within [toast()].
#' 
#' @param ... Content.
#' @param class Any additional class.
#' 
#' @name toastContent
#' 
#' @export 
toastHeader <- \(
  ...,
  class = ""
) {
  div(
    class = sprintf("toast-header %s", class),
    ...,
    tags$button(
      type = "button",
      class = "btn-close",
      `data-bs-dismiss` = "toast",
      `aria-label` = "Close"
    )
  )
}

#' @rdname toastContent
#' @export 
toastBody <- \(
  ...,
  class = ""
) {
  div(
    class = sprintf("toast-body %s", class),
    ...
  )
}

#' Toast Toggle
#' 
#' Show or hide a toast.
#' 
#' @param id ID of [toast()] to toggle.
#' @param animation Whether to animate the toast.
#' @param auto_hide Whether to automatically hide the 
#' toast after `delay`.
#' @param delay Milliseconds after which to hide the
#' toast (if `auto_hide = TRUE`).
#' @param session A valid shiny session.
#' @param header,body Header and body of the toast
#'  to replace existing content.
#' 
#' @name toastToggle
#' 
#' @export
toast_show <- \(
  id,
  header = NULL,
  body = NULL,
  animation = TRUE,
  auto_hide = TRUE,
  delay = 5000L,
  session = shiny::getDefaultReactiveDomain()
) {
  id <- namespace(session, id)

  if(!is.null(body))
    body <- as.character(body)

  if(!is.null(header))
    header <- as.character(header)

  session$sendCustomMessage(
    "bsutils-toast", 
    list(
      id = id,
      action = "show",
      body = body,
      header = header,
      opts = list(
        animation = animation,
        autohide = auto_hide,
        delay = delay
      )
    )
  )
}

#' @rdname toastToggle
#' @export
toast_hide <- \(
  id,
  session = shiny::getDefaultReactiveDomain()
) {
  id <- namespace(session, id)

  session$sendCustomMessage(
    "bsutils-toast", 
    list(
      id = id,
      action = "hide",
      opts = list()
    )
  )
}
