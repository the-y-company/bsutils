accordion <- \(
  ...,
  .id = NULL,
  .flush = FALSE
) {
  fns <- list(...)
  flush <- ifelse(.flush, "accordion-flush", "")

  if(length(fns) == 0L)
    stop("Must pass `accordionItem`")

  id <- get_id(.id)

  fns |> 
    lapply(\(fn) {
      fn(id)
    }) |> 
    div(
      class = sprintf("accordion %s", flush),
      id = id
    )
}

accordionItem <- \(
  ...,
  .id = NULL,
  .expanded = FALSE
) {
  id <- get_id(.id)

  toggled <- ifelse(.expanded, "show", "collapse")
  toggled_button <- ifelse(.expanded, "", "collapsed")

  \(parent_id) {
    div(
      class = "accordion-item",
      h2(
        class = "accordion-header",
        tags$button(
          class = sprintf("accordion-button %s", toggled_button),
          type = "button",
          `data-bs-toggle` = "collapse",
          `data-bs-targe` = sprintf("#%s", id),
          `aria-expanded` = tolower(.expanded),
          `aria-controls` = id
        )
      ),
      div(
        id = id,
        class = sprintf("accordion-collapse collapse %s", toggled),
        `data-bs-parent` = sprintf("#%s", parent_id)
      )
    )
  }
}
