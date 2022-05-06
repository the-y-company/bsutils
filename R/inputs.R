#' Text Input Floating Label
#' 
#' Text input with floating label.
#' 
#' @param inputId ID of input.
#' @param label Label of input.
#' @param placeholder Placeholder value.
#' @param value Value of input.
#' @param ... Passed to input.
#' 
#' @export 
floatingTextInput <- \(
  inputId,
  label,
  placeholder,
  value = "",
  ...
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
      value = value,
      ...
    ),
    tags$label(
      `for` = inputId,
      label
    )
  )
}

#' Text Input Area Floating Label
#' 
#' Text input with floating label.
#' 
#' @param inputId ID of input.
#' @param label Label of input.
#' @param placeholder Placeholder value.
#' @param value Value of input.
#' @param ... Passed to input.
#' 
#' @export 
floatingTextAreaInput <- \(
  inputId,
  label,
  placeholder,
  value = "",
  ...
) {
  if(missing(inputId))
    stop("Missing `inputId`")

  if(missing(label))
    stop("Missing `label`")

  if(missing(placeholder))
    stop("Missing `placeholder`")
  
  div(
    class = "form-floating",
    tags$textarea(
      id = inputId,
      class = "form-control",
      placeholder = placeholder,
      value = value,
      ...
    ),
    tags$label(
      `for` = inputId,
      label
    )
  )
}

#' @importFrom htmltools tagAppendChild
floatingSelectInput <- \(
  inputId,
  label,
  choices = NULL,
  ...
) {
  if(missing(inputId))
    stop("Missing `inputId`")

  if(missing(label))
    stop("Missing `label`")

  select <- tags$select(
    id = inputId,
    class = "form-select",
    `aria-label` = label
  )

  if(!is.null(choices)){
    for(i in 1:length(choices)) {
      nm <- names(choices)[i]
      if(is.null(nm))
        nm <- unname(choices[i])

      opt <- tags$option(
        value = unname(choices[i]),
        nm
      )
      select <- tagAppendChildren(select, opt)
    }
  }

  div(
    class = "form-floating",
    select,
    tags$label(
      `for` = inputId,
      label
    )
  )

}
