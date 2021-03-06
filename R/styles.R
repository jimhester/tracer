
#' @importFrom crayon make_style combine_styles bold white red blue

tracer_default_style <- function() {

  list(
    num = function(x) make_style("yellow")(paste0(" ", format(x))),
    baseenv = make_style("grey50"),
    env = blue,
    arg = make_style("grey80"),
    fnam = combine_styles(make_style("gold3"), bold),
    error = error_style,
    location = blue,
    pointer = combine_styles(make_style("firebrick2", bg = TRUE), white)
  )
}

error_style <- function(x) {
  fg <- make_style("firebrick2")
  txt <- paste0(" ", symbol$cross, " ", trim_ws(x), "\n")
  combine_styles(bold, fg)(txt)
}

#' @importFrom utils installed.packages

grey_envs <- c(
  rownames(installed.packages(priority = "base")),
  "R_GlobalEnv"
)

style_env <- function(e, style) {
  if (e %in% grey_envs) {
    paste0(style$baseenv(e), "::")
  } else if (e != "") {
    paste0(style$env(e), "::")
  } else {
    ""
  }
}
