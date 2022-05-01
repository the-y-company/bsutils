library(shiny)

code <- \(code) {
  tags$pre(
    tags$code(
      HTML(
        code
      )
    )
  )
}

ui <- navbarPage(
  "bsutils",
  theme = bslib::bs_theme(version = 5L),
  tabPanel(
    "Accordion",
    fluidRow(
      column(
        6,
        accordion(
          accordionItem(
            .expanded = TRUE,
            "Something",
            p("Some content")
          ),
          accordionItem(
            "Something else",
            p("Some other content")
          ),
          accordionItem(
            "Another thing",
            p("Some other item")
          )
        )
      ),
      column(
        6,
        code(
          '
accordion(
  accordionItem(
    .expanded = TRUE,
    "Something",
    p("Some content")
  ),
  accordionItem(
    "Something else",
    p("Some other content")
  ),
  accordionItem(
    "Another thing",
    p("Some other item")
  )
)'
        )
      )
    )
  )
)

server <- \(input, output, session) {

}

shinyApp(ui, server)
