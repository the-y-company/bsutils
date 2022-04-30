<!-- badges: start -->
<!-- badges: end -->

# bsutils

UI utilities for Bootstrap 5 and Shiny.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/bsutils")
```

## Example

Make sure you use Bootstrap 5.

```r
library(shiny)

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5L),
  offcanvasButton(
    offcanvasContent(
      offcanvasHeader(
        "Off canvas"
      ),
      p(
        "Hello world"
      )
    ),
    "Open"
  )
)

server <- \(input, output, session){

}

shinyApp(ui, server)
```
