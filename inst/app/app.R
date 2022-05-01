library(shiny)

code <- \(code) {
  tags$pre(
    tags$code(
      class = "language-r",
      code
    )
  )
}

ui <- navbarPage(
  "bsutils",
  theme = bslib::bs_theme(version = 5L),
  header = list(
    tags$link(
      href = "https://unpkg.com/prismjs@v1.x/themes/prism.css",
      rel = "stylesheet"
    )
  ),
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
  ),
  tabPanel(
    "Carousel",
    carousel(
      indicators = TRUE,
      controls = TRUE,
      carouselItem(
        h5("First"),
        p("First carousel slide"),
        class = "bg-primary rounded p-4"
      ),
      carouselItem(
        h5("Second"),
        p("Second carousel slide"),
        class = "bg-info rounded p-4"
      )
    ),
    code(
      '
carousel(
  indicators = TRUE,
  controls = TRUE,
  carouselItem(
    h5("First"),
    p("First carousel slide"),
    class = "bg-primary rounded p-4"
  ),
  carouselItem(
    h5("Second"),
    p("Second carousel slide"),
    class = "bg-info rounded p-4"
  )
)'
    )
  ),
  tabPanel(
    "Collapsible",
    fluidRow(
      column(
        6,
        collapse(
          collapseButton(
            "Reveal",
            id = "x"
          ),
          collapseContent(
            "Some collapsed content"
          )
        )
      ),
      column(
        6,
        code(
          '
collapse(
  collapseButton(
    "Reveal",
    id = "x"
  ),
  collapseContent(
    "Some collapsed content"
  )
)'
        )
      )
    )
  ),
  tabPanel(
    "dropdown",
    fluidRow(
      column(
        6,
        dropdownButton(
          "Buttons",
          actionLink("first", "First"),
          actionLink("second", "Second"),
          actionLink("third", "Third")
        )
      ),
      column(
        6,
        code(
          '
dropdownButton(
  "Buttons",
  actionLink("first", "First"),
  actionLink("second", "Second"),
  actionLink("third", "Third")
)'
        )
      )
    )
  ),
  tabPanel(
    "Offcanvas",
    offcanvas(
      offcanvasButton(
        "Open"
      ),
      offcanvasContent(
        offcanvasHeader(
          "Off canvas"
        ),
        p(
          "Hello world"
        ),
        uiOutput("text")
      )
    ),
    code(
      '
offcanvas(
  offcanvasButton(
    "Open"
  ),
  offcanvasContent(
    offcanvasHeader(
      "Off canvas"
    ),
    p(
      "Hello world"
    ),
    uiOutput("text")
  )
)'
    ),
    tags$script(
      src = "https://unpkg.com/prismjs@v1.x/components/prism-core.min.js"
    ),
    tags$script(
      src = "https://unpkg.com/prismjs@v1.x/plugins/autoloader/prism-autoloader.min.js"
    )
  ),
  tabPanel(
    "Progress",
    actionButton(
      "rand",
      "Randomise"
    ),
    progress(
      progressBar(15, id = "bar")
    )
  ),
  tabPanel(
    "Toast",
    toast(
      "toast",
      toastHeader(
        strong(
          "Toast",
          class = "me-auto"
        )
      ),
      toastBody("The body of the toast!")
    ),
    h1("Hello"),
    actionButton("show", "Show toast"),
    actionButton("hide", "Hide toast")
  )
)

server <- \(input, output, session) {

  observeEvent(input$rand, {
    update_progress("bar", sample(10:99, 1))
  })

  observeEvent(input$show, {
    toast_show("toast", auto_hide = FALSE)
  })

  observeEvent(input$hide, {
    toast_hide("toast")
  })

}

shinyApp(ui, server)
