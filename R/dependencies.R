#' Get Dependencies
#' 
#' Get a dependency.
#' 
#' @param name Name of dependency.
#' 
#' @importFrom utils packageVersion
#' 
#' @keywords internal
get_dep <- \(
  name
) {
  htmltools::htmlDependency(
    name = sprintf("bsutils-%s", name),
    version = packageVersion("bsutils"),
    package = "bsutils",
    src = "assets",
    script = sprintf("%s.js", name)
  )
}
