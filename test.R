library(shiny)
devtools::load_all()

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5L),
  actionButton("show", "Show modal"),
  modal(
    id = "modal",
    modalHeader(
      modalTitle("Title")
    ),
    modalBody(
      p("The content of the modal"),
      actionButton("remove", "Remove modal")
    ),
    modalFooter(
      p("The footer of the modal")
    )
  )
)
server <- \(input, output, session){
  observeEvent(input$show, {
    bsutils::modal_show("modal")
  })
  observeEvent(input$remove, {
    print("Removing modal")
    bsutils::modal_hide("modal")
  })
}

shinyApp(ui, server)
