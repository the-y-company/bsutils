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