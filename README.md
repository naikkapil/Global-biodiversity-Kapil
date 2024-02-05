Species Observation Dashboard
Author -Kapil Naik
**Overview
This project focuses on analyzing and visualizing subsetted occurrence data specific to Poland. By default, the app displays data for the Slow Worm species. I've employed various tools and packages to manage dependencies, create visualizations, ensure code quality, and provide user-friendly search functionalities.

**Features
--Subsetted Occurrence Data (Poland) using PySpark: Leveraging the power of PySpark, I have efficiently subsetted occurrence data specifically for the region of Poland. The processed data has been stored in CSV format with the filename occurrence_poland.csv. This approach allows for a more focused and detailed analysis of the data relevant to this geographical area.

--Dependency Management with renv: To manage dependencies, I've utilized renv. This ensures that all necessary R packages and their specific versions are consistently maintained, leading to more reproducible and stable code.

--Interactive Maps with Leaflet: Utilizing the Leaflet package, I've created interactive maps that display markers for various occurrences. Each marker on the map is equipped with a popup showing the vernacular name and locality, providing an intuitive and informative way to explore the data.

--Timeline Visualization with ggplot2: For timeline visualizations, ggplot2 has been employed. This powerful tool enables me to create compelling and informative graphs, showcasing trends and patterns over time in the occurrence data.

--Testing with shinytest2: To ensure the reliability and integrity of my application, I have used shinytest2 for creating test cases. This helps in automatically testing my Shiny applications, ensuring that they function as expected.

--Search Functionality: I've added a search functionality that allows users to search for a species either by its vernacular name or scientific name, such as Paris quadrifolia, Anguis fragilis, Polygonatum multiflorum, Asarum europaeum, Euphorbia cyparissias, Solomon's-seal, European Wild Ginger, Cypress Spurge, Marsh-marigold, etc. The occurrence of the species will be visible on the map, and clicking on a marker will display locality and species name details. Users can also view the occurrence timeline in a graph located below the map.

**Installation
To install and run the Species Observation Dashboard:

Clone the repository to your local machine.
Install renv if not already installed.
In the project directory, run renv::restore() to install all necessary dependencies.
Open app.R and run the app to start the dashboard.

**Usage
To search for species, use the search function within the dashboard to enter either the vernacular name or scientific name. Examples include:

Paris quadrifolia (Scientific)
Solomon's-seal (Vernacular)
Upon conducting a search, the occurrences will be pinpointed on the interactive map with markers. Clicking on a marker will reveal detailed information about the species' locality and name. Below the map, you will find a timeline graph that visualizes the occurrences over time, allowing for a temporal analysis of the data.
