make_id <- \(){
  letters |> 
    sample(10L) |> 
    paste0(collapse = "")
}

get_id <- \(id = NULL) {
  if(!is.null(id))
    return(id)

  make_id()
}

namespace <- \(
  session,
  id
) {
  ns <- session$ns(NULL)

  if(length(ns) == 0L)
    return(id)

  sprintf("%s-%s", ns, id)
}

get_position <- \(
  position = c(
    "top-right", 
    "top-left", 
    "bottom-right", 
    "bottom-left"
  )
) {
  position <- match.arg(position)

  if(position == "top-right")
    return("top-0 end-0")

  if(position == "top-left")
    return("top-0 start-0")

  if(position == "bottom-right")
    return("bottom-0 end-0")
  
  "bottom-0 start-0"
}
