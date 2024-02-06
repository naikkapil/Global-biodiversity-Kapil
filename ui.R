library(shiny)
library(shinydashboard)
library(leaflet)
library(ggplot2)
library(dplyr)
library(DT)
library(shinyjs)
library(shinytest2)

source("map_ui.R",local = T)
source("timeline_ui.R",local = T)

ui <- dashboardPage(
  dashboardHeader(title = tags$a(tags$img(src="appsilon_gif.gif",height="95%"))),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      textInput("speciesName", "Enter Species Name")
      # Additional filters or options
    )
  ),
  dashboardBody(
    tags$script(HTML('$(document).ready(function(){$("header").find("nav").append(\'<div class="myclass"><b>Species Observartion Dashboard - by Kapil Naik </b></div>\')})')),
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(mapUI("mapModule"), width = 12)
              ),
              fluidRow(
                box(timelineUI("timelineModule"), width = 12)
              )
      )
    )
  ),
  skin = "blue"
)
