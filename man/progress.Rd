% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/progress.R
\name{progress}
\alias{progress}
\title{Progress}
\usage{
progress(..., id = NULL)
}
\arguments{
\item{...}{Progress bars as returned by \code{\link[=progressBar]{progressBar()}}.}

\item{id}{Parent id.}
}
\description{
Progress bars.
}
\examples{
library(shiny)

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5L),
  actionButton(
    "rand",
    "Randomise"
  ),
  progress(
    progressBar(15, id = "bar")
  )
)

server <- \(input, output, session){
  observeEvent(input$rand, {
    update_progress("bar", sample(10:99, 1))
  })
}

if(interactive())
 shinyApp(ui, server)

}
