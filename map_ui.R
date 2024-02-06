mapUI <- function(id) {
  ns <- NS(id)
  leafletOutput(ns("map"))
}