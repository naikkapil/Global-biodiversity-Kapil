timelineServer <- function(id, filteredData, input_specieName) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    output$timeline <- renderPlot({
      data <- filteredData()  # Using the passed reactive
      data$eventDate <- as.Date(data$eventDate)
      
      ggplot(data, aes(x = eventDate)) +
        geom_histogram(binwidth = 150, fill = "blue", color = "black") +
        labs(x = "Date of Observation", y = "Number of Observations") +
        theme_minimal() +
        if(input_specieName() != ""){
          ggtitle(paste("Observations Over Time for", input_specieName()))
        } else {
          ggtitle("Observations Over Time for Slow Worm")
        }
    })
  })
}
