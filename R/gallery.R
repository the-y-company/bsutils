gallery <- \(){
  shiny::shinyAppFile(
    system.file("app/app.R", package = "bsutils")
  )
}