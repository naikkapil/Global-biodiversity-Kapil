library(shinytest2)

test_that("{shinytest2} recording: Global-biodiversity-Kapil", {
  app <- AppDriver$new(name = "Global-biodiversity-Kapil", height = 772, width = 1406)
  app$expect_values()
})



test_that("{shinytest2} recording:  Initial Load", {
  app <- AppDriver$new(variant = platform_variant(), name = " Initial Load", height = 772, 
      width = 1406)
  app$expect_values()
})



test_that("{shinytest2} recording: Species Search Functionality", {
  app <- AppDriver$new(name = "Species Search Functionality", height = 772, width = 1406)
  app$expect_values()
  app$set_inputs(speciesName = "Mist")
  app$set_inputs(speciesName = "Mistl")
  app$set_inputs(speciesName = "Mistle")
  app$set_inputs(speciesName = "Mistleto")
  app$set_inputs(speciesName = "Mistletoe")
  app$set_inputs(speciesName = "Mistleto")
  app$set_inputs(speciesName = "")
  app$set_inputs(speciesName = "M")
  app$set_inputs(speciesName = "Moor")
  app$set_inputs(speciesName = "Moor ")
  app$set_inputs(speciesName = "Moor Frog")
})



test_that("{shinytest2} recording: Searching random species (not available in data)", {
  app <- AppDriver$new(name = "Searching random species (not available in data)", 
      height = 772, width = 1406)
  app$expect_values()
  app$set_inputs(speciesName = "Kapil")
  app$set_inputs(speciesName = "Kapi")
  app$set_inputs(speciesName = "")
  app$set_inputs(speciesName = "Naik")
})



test_that("{shinytest2} recording: Map zoom in , zoom out functionality", {
  app <- AppDriver$new(variant = platform_variant(), name = "Map zoom in , zoom out functionality", 
      height = 772, width = 1406)
  app$expect_screenshot()
  app$set_inputs(map_bounds = c(53.4880455360562, 25.90576171875, 50.7920470644069, 
      13.73291015625), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_zoom = 7, allow_no_input_binding_ = TRUE)
  app$set_inputs(map_bounds = c(52.8293209103137, 22.8680419921875, 51.481382896101, 
      16.7816162109375), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_zoom = 8, allow_no_input_binding_ = TRUE)
  app$set_inputs(map_bounds = c(53.4880455360562, 25.90576171875, 50.7920470644069, 
      13.73291015625), allow_no_input_binding_ = TRUE)
  app$set_inputs(map_zoom = 7, allow_no_input_binding_ = TRUE)
  app$set_inputs(map_bounds = c(54.7753458593645, 31.9921875, 49.3823727870096, 7.646484375), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_zoom = 6, allow_no_input_binding_ = TRUE)
})



test_that("{shinytest2} recording: Map Interactions(clicking on map markers)", {
  app <- AppDriver$new(variant = platform_variant(), name = "Map Interactions(clicking on map markers)", 
      height = 772, width = 1406)
  app$expect_screenshot()
  app$set_inputs(map_marker_mouseover = c(0.894295364387298, 52.3692852775681, 22.7351926761959), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_marker_mouseout = c(0.893842712104454, 52.3692852775681, 22.7351926761959), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_marker_mouseover = c(0.76859888661522, 52.703017570571, 23.720572487851), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_marker_mouseout = c(0.964163641800897, 52.703017570571, 23.720572487851), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_marker_mouseover = c(0.652283618658872, 52.681472, 23.68543715), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_marker_mouseout = c(0.521682957948152, 52.681472, 23.68543715), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_marker_mouseover = c(0.432646549163007, 52.3692852775681, 22.7351926761959), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_marker_click = c(0.592155276266385, 52.3692852775681, 22.7351926761959), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(map_marker_mouseout = c(0.196803068377019, 52.3692852775681, 22.7351926761959), 
      allow_no_input_binding_ = TRUE)
})
