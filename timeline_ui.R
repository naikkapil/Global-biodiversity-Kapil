timelineUI <- function(id) {
  ns <- NS(id)
  plotOutput(ns("timeline"))
}