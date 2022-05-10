<!-- badges: start -->
<!-- badges: end -->

# bsutils

UI utilities for Bootstrap 5 and Shiny.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/bsutils")
```

## Utilities

- Accordion
- Alerts
- Badge
- Card
- Carousel
- Collapse
- Color input
- Dropdown
- Floating select input
- Floating text input
- Floating textarea input
- List group
- Modal
- Offcanvas
- Placeholder
- Popover
- Progress
- Range input
- Switch input
- Text group input
- Toast
- Tooltip

## Example

Run `bsutils::gallery()` for a demo.

Make sure you use __Bootstrap version 5__.

```r
library(shiny)
library(bsutils)

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5L),
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
      )
    )
  )
)

server <- \(input, output, session){}

shinyApp(ui, server)
```
