library(shiny)
library(bsutils)

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
    "Buttons",
    h4("Dropdown"),
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
    ),
    h4("Group"),
    buttonGroup(
      actionButton("first", "First", class = "btn-primary"),
      actionButton("second", "Second", class = "btn-warning"),
      actionButton("third", "Third", class = "btn-success")
    ),
    code(
'
buttonGroup(
  actionButton("first", "First", class = "btn-primary"),
  actionButton("second", "Second", class = "btn-warning"),
  actionButton("third", "Third", class = "btn-success")
)'
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
        plotOutput("plot")
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
    ),
    h4("UI"),
    code(
      '
actionButton(
  "rand",
  "Randomise"
),
progress(
  progressBar(15, id = "bar")
)'
    ),
    h4("Server"),
    code(
      '
observeEvent(input$rand, {
  update_progress("bar", sample(10:99, 1))
})'
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
    actionButton("hide", "Hide toast"),
    h4("UI"),
    code(
      '
toast(
  "toast",
  toastHeader(
    strong(
      "Toast",
      class = "me-auto"
    )
  ),
  toastBody("The body of the toast!")
)'
    ),
    h4("Server"),
    code(
      '
observeEvent(input$show, {
  toast_show("toast", auto_hide = FALSE)
})

observeEvent(input$hide, {
  toast_hide("toast")
})'
    )
  ),
  tabPanel(
    "Modal",
    actionButton("show_modal", "Show modal"),
    modal(
      id = "modal",
      modalHeader(
        modalTitle("Title")
      ),
      modalBody(
        p("The content of the modal")
      ),
      modalFooter(
        p("The footer of the modal")
      )
    ),
    h4("UI"),
    code(
      '
modal(
  id = "modal",
  modalHeader(
    modalTitle("Title")
  ),
  modalBody(
    p("The content of the modal")
  ),
  modalFooter(
    p("The footer of the modal")
  )
)'
    ),
    h4("Server"),
    code(
      '
observeEvent(input$show, {
  modal_show("modal")
})'
    )
  ),
  tabPanel(
    "Tooltips",
    fluidRow(
      column(
        4,
        withTooltip(
          span("plain"),
          "content"
        )
      ),
      column(
        8,
        code(
          '
withTooltip(
  span("plain"),
  "content"
)'
        )
      )
    ),
    fluidRow(
      column(
        4,
        withTooltip(
          span("HTML"),
          tagList(
            strong("HTML"),
            "content"
          )
        )
      ),
      column(
        8,
        code(
          '
withTooltip(
  span("HTML"),
  tagList(
    strong("HTML"),
    "content"
  )
)'
        )
      )
    )
  ),
  tabPanel(
    "List",
    fluidRow(
      column(
        4,
        listGroup(
          listGroupItem("Item 1"),
          listGroupItem("Item 2"),
          listGroupItem("Item 3"),
          listGroupItem("Item 4")
        )
      ),
      column(
        8,
        code(
          '
listGroup(
  listGroupItem("Item 1"),
  listGroupItem("Item 2"),
  listGroupItem("Item 3"),
  listGroupItem("Item 4")
)'
        )
      )
    )
  ),
  tabPanel(
    "Popover",
    withPopover(
      span("click me"),
      "The content",
      "The title"
    ),
    code(
      '
withPopover(
  span("click me"),
  "The content",
  "The title"
)'
    )
  ),
  tabPanel(
    "Inputs",
    fluidRow(
      column(
        6,
        floatingTextInput(
          "text",
          "Text input",
          "placeholder text"
        )
      ),
      column(
        6,
        code(
          '
floatingTextInput(
  "text",
  "Text input",
  "placeholder text"
)'
        )
      )
    ),
    fluidRow(
      column(
        6,
        floatingTextAreaInput(
          "textarea",
          "Text input",
          "placeholder text",
          style = "height: 10rem;"
        )
      ),
      column(
        6,
        code(
          '
floatingTextAreaInput(
  "textarea",
  "Text input",
  "placeholder text",
  style = "height: 10rem;"
)'
        )
      )
    ),
    fluidRow(
      column(
        6,
        floatingSelectInput(
          "select",
          "Select Something",
          letters
        )
      ),
      column(
        6,
        code(
          '
floatingSelectInput(
  "select",
  "Select Something",
  letters
)'
        )
      )
    ),
    fluidRow(
      column(
        6,
        switchInput(
          "switch",
          "Switch input"
        )
      ),
      column(
        6,
        code(
          '
switchInput(
  "switch",
  "Switch input"
)'
        )
      )
    ),
    fluidRow(
      column(
        6,
        colorPickerInput(
          "color",
          value = "#000000"
        )
      ),
      column(
        6,
        code(
          '
colorPickerInput(
  "color",
  value = "#000000"
)'
        )
      )
    ),
    fluidRow(
      column(
        6,
        rangeInput(
          "range",
          "A range input"
        )
      ),
      column(
        6,
        code(
          '
rangeInput(
  "range",
  "A range input"
)'
        )
      )
    ),
    fluidRow(
      column(
        6,
        textGroupInput(
          "textGroup",
          "@",
          placeholder = "username"
        )
      ),
      column(
        6,
        code(
          '
textGroupInput(
  "textGroup",
  "@",
  placeholder = "username"
)'
        )
      )
    )
  )
)

server <- \(input, output, session) {

  output$plot <- renderPlot({
    plot(cars)
  })

  observeEvent(input$rand, {
    update_progress("bar", sample(10:99, 1))
  })

  observeEvent(input$show, {
    toast_show("toast", auto_hide = FALSE)
  })

  observeEvent(input$hide, {
    toast_hide("toast")
  })

  observeEvent(input$show_modal, {
    modal_show("modal")
  })

  observeEvent(input$text, {
    print(input$text)
  })

  observeEvent(input$textarea, {
    print(input$textarea)
  })

  observeEvent(input$select, {
    print(input$select)
  })

  observeEvent(input$switch, {
    print(input$switch)
  })

  observeEvent(input$color, {
    print(input$color)
  })

  observeEvent(input$range, {
    print(input$range)
  })

  observeEvent(input$textGroup, {
    print(input$textGroup)
  })
}

shinyApp(ui, server)
