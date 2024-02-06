mapServer <- function(id, filteredData, session) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    output$map <- renderLeaflet({
      data <- filteredData()  # Using the passed reactive
      
      leaflet(data) %>%
        addTiles() %>%
        addCircleMarkers(
          ~longitudeDecimal, ~latitudeDecimal, popup = ~paste(vernacularName, locality),
          radius = 8, color = "red", stroke = TRUE, fillOpacity = 0.8
        ) %>%
        addScaleBar(position = "bottomleft")
    })
  })
}
