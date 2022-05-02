<!-- badges: start -->
<!-- badges: end -->

# bsutils

UI utilities for Bootstrap 5 and Shiny.

## Note

This is intended to demonstrate some of the functionalities
that come with Bootstrap 5 which are easily accessible;
it's 99% pure HTML, and comes with close to no JavaScript.

It either remains like this or grow into a fully-fledged
utility library to handle all of the "extras," it'll
depend on what dis actually wanted by the community.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/bsutils")
```

## Utilities

- Accordion
- Alerts
- Card
- Carousel
- Collapse
- Dropdown
- List group
- Modal
- Offcanvas
- Popover
- Progress
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
