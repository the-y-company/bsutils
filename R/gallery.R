#' Gallery
#' 
#' Demo of utilities.
#' 
#' @export 
gallery <- \(){
  shiny::shinyAppFile(
    system.file("app/app.R", package = "bsutils")
  )
}