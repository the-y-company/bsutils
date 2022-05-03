#' Text Input Floating Label
#' 
#' Text input with floating label.
#' 
#' @param inputId ID of input.
#' @param label Label of input.
#' @param placeholder Placeholder value.
#' @param value Value of input.
#' 
#' @export 
floatingTextInput <- \(
  inputId,
  label,
  placeholder,
  value = ""
) {
  if(missing(inputId))
    stop("Missing `inputId`")

  if(missing(label))
    stop("Missing `label`")

  if(missing(placeholder))
    stop("Missing `placeholder`")
  
  div(
    class = "form-floating",
    tags$input(
      id = inputId,
      type = "text",
      class = "form-control",
      placeholder = placeholder,
      value = value
    ),
    tags$label(
      `for` = inputId,
      label
    )
  )
}