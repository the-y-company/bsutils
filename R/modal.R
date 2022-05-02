#' Modal
#' 
#' Create a modal in the UI.
#' The modal is not down see [modal_show()], or
#' [modal_toggle()] (from server).
#' 
#' @param id ID of modal.
#' @param ... Content of the modal, [modalBody()],
#' [modalHeader()], [modalFooter()].
#' @param static_backdrop When backdrop is set to static,
#' the modal will not close when clicking outside it.
#' @param scrollable Whether to make the content scrollable.
#' @param centered Whether to make the content vertically
#' centered.
#' @param size Size of the modal.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   theme = bslib::bs_theme(version = 5L),
#'   actionButton("show", "Show modal"),
#'   modal(
#'     id = "modal",
#'     modalHeader(
#'       modalTitle("Title")
#'     ),
#'     modalBody(
#'       p("The content of the modal")
#'     ),
#'     modalFooter(
#'       p("The footer of the modal")
#'     )
#'   )
#' )
#' 
#' server <- \(input, output, session){
#'   observeEvent(input$show, {
#'     modal_show("modal")
#'   })
#' }
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @export 
modal <- \(
  id,
  ...,
  static_backdrop = FALSE,
  scrollable = FALSE,
  centered = FALSE,
  size = c(
    "default",
    "sm",
    "lg",
    "xl",
    "fullscreen",
    "fullscreen-sm-down",
    "fullscreen-md-down",
    "fullscreen-lg-down",
    "fullscreen-xl-down",
    "fullscreen-xxl-down"
  )
) {
  if(missing(id))
    stop("Missing `id`")

  size <- match.arg(size)

  dialog_class <- "modal-dialog"
  if(scrollable)
    dialog_class <- sprintf("%s modal-dialog-scrollable", dialog_class)

  if(centered)
    dialog_class <- sprintf("%s modal-dialog-centered", dialog_class)

  dialog_class <- sprintf("%s modal-%s", dialog_class, size)

  modal <- div(
    get_dep("modal"),
    class = "modal fade",
    id = id,
    tabindex = "-1",
    `aria-hidden` = "true",
    div(
      class = dialog_class,
      div(
        class = "modal-content",
        ...
      )
    )
  )

  if(static_backdrop)
    modal <- modal |> 
      tagAppendAttributes(
        `data-bs-backdrop` = "static"
      )

  modal
}

#' Modal Header 
#' 
#' Header of a modal, place within [modal()].
#' 
#' @param ... Content.
#' @param .close Whether to add the close button.
#' 
#' @export 
modalHeader <- \(
  ...,
  .close = TRUE
) {
  if(!.close)
    return(div(class = "modal-header", ...))

  div(
    class = "modal-header",
    ...,
    tags$button(
      type = "button",
      class = "btn-close",
      `data-bs-dismiss` = "modal",
      `aria-label` = "Close"
    )
  )
}

#' Modal Title
#' 
#' Modal title, place within [modalHeader()].
#' 
#' @param title An HTML tag or a character vector of length 1.
#' 
#' @export 
modalTitle <- \(
  title
) {
  if(inherits(title, "character"))
    return(h5(class = "modal-title", title))

  tagAppendAttributes(
    title,
    class = "modal-title"
  )
}

#' Modal Body
#' 
#' Body of the modal, place within [modal()].
#' 
#' @param ... Content of the body.
#' 
#' @export 
modalBody <- \(
  ...
) {
  div(
    class = "modal-body",
    ...
  )
}

#' Modal Footer
#' 
#' Footer of the modal, place within [modal()].
#' 
#' @param ... Content of the footer.
#' 
#' @export 
modalFooter <- \(
  ...
) {
  div(
    class = "modal-footer",
    ...
  )
}

#' Modal Toggle
#' 
#' Show, hide, or toggle a modal from the server.
#' 
#' @param id ID of the [modal()].
#' @param session A valid shiny session.
#' 
#' @name modalToggle
#' @export 
modal_show <- \(
  id,
  session = shiny::getDefaultReactiveDomain()
) {
  if(missing(id))
    stop("Missing `id`")

  session$sendCustomMessage(
    "bsutils-modal",
    list(
      id = id,
      action = "show"
    )
  )
}

#' @rdname modalToggle
#' @export 
modal_hide <- \(
  id,
  session = shiny::getDefaultReactiveDomain()
) {
  if(missing(id))
    stop("Missing `id`")

  session$sendCustomMessage(
    "bsutils-modal",
    list(
      id = id,
      action = "hide"
    )
  )
}

#' @rdname modalToggle
#' @export 
modal_toggle <- \(
  id,
  session = shiny::getDefaultReactiveDomain()
) {
  if(missing(id))
    stop("Missing `id`")

  session$sendCustomMessage(
    "bsutils-modal",
    list(
      id = id,
      action = "toggle"
    )
  )
}
