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

#' Text Area Input Floating Label
#' 
#' Text area input with floating label.
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

#' Select Floating Label
#' 
#' Select input with floating label.
#' 
#' @param inputId ID of input.
#' @param label Label of input.
#' @param choices Choices, named vector.
#' @param ... Passed to input.
#' 
#' @importFrom htmltools tagAppendChild
#' 
#' @export 
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

#' Switch Input
#' 
#' Switch input, similar to checkbox.
#' 
#' @param inputId ID of input.
#' @param label Label of input.
#' @param checked Whether the input is initialised checked.
#' @param ... Passed to input.
#' 
#' @export 
switchInput <- \(
  inputId,
  label,
  checked = FALSE,
  ...
) {
  if(missing(inputId))
    stop("Missing `inputId`")

  if(missing(label))
    stop("Missing `label`")

  input <- tags$input(
    class = "form-check-input",
    type = "checkbox",
    id = inputId,
    ...
  )

  if(checked) 
    input <- tagAppendAttributes(input, checked = NA)

  div(
    class = "form-check form-switch",
    input,
    tags$label(
      class = "form-check-label",
      `for` = inputId,
      label
    )
  )
}

#' Color Picker Input
#' 
#' Color picker input.
#' 
#' @param inputId ID of input.
#' @param value Initial value of the input.
#' @param ... Passed to input.
#' 
#' @export 
colorPickerInput <- \(
  inputId,
  value = NULL,
  ...
) {
  if(missing(inputId))
    stop("Missing `inputId`")

  tagList(
    get_dep("color"),
    tags$input(
      type = "color",
      class = "form-control form-control-color bsutils-color",
      id = inputId,
      value = value,
      ...
    )
  )
}

#' Update Color Picker
#' 
#' Update a [colorPickerInput()] from the server.
#' 
#' @param id ID of input to update.
#' @param value Value to set.
#' @param session A valid shiny session.
#' 
#' @export 
update_color_picker <- \(
  id,
  value,
  session = shiny::getDefaultReactiveDomain()
){
  if(missing(id))
    stop("Missing `id`")

  if(missing(value))
    stop("Missing `value`")

  session$sendInputMessage(id, value)
}

#' Range Input
#' 
#' A range input similar to a slider.
#' 
#' @param id ID of input.
#' @param label Label of input.
#' @param value Initial value of input.
#' @param min,max Minimum and maximum values of the range.
#' @param step Step of range change.
#' @param ... Passed to input.
#' 
#' @param 
rangeInput <- \(
  id,
  label,
  value = 0L,
  ...,
  min = 0L,
  max = 100L,
  step = 1L
) {
  tagList(
    get_dep("range"),
    tags$label(
      label,
      `for` = id,
      class = "form-label"
    ),
    tags$input(
      type = "range",
      class = "form-range bsutils-range",
      id = id,
      value = value,
      min = min,
      max = max,
      step = step,
      ...
    )
  )
}

#' Update Range
#' 
#' Update a [rangeInput()] from the server.
#' 
#' @param id ID of input to update.
#' @param session A valid shiny session.
#' @param ... Elements to update, one or more of,
#' `value`, `min`, and `max`.
#' 
#' @export 
update_range <- \(
  id,
  ...,
  session = shiny::getDefaultReactiveDomain()
) {
  session$sendInputMessage(
    id,
    list(...)
  )
}
