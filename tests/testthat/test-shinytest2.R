library(shinytest2)

test_that("{shinytest2} recording: Testing Search Functionality", {
  app <- AppDriver$new(name = "Testing Search Functionality", height = 772, width = 1406)
  app$expect_values()
  app$set_inputs(speciesName = "Mist")
  app$set_inputs(speciesName = "Mistlet")
  app$set_inputs(speciesName = "Mistletoe")
})



test_that("{shinytest2} recording: Search Random Species(Not available in data)", {
  app <- AppDriver$new(name = "Search Random Species(Not available in data)", height = 772, 
      width = 1406)
  app$expect_values()
  app$expect_values()
  app$set_inputs(speciesName = "Kapil")
})



test_that("{shinytest2} recording: Map Zoom in Zoom out functionality", {
  app <- AppDriver$new(name = "Map Zoom in Zoom out functionality", height = 772, 
      width = 1406)
  app$expect_values()
  app$set_inputs(`mapModule-map_bounds` = c(53.4880455360562, 25.90576171875, 50.7920470644069, 
      13.73291015625), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_zoom` = 7, allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_bounds` = c(52.8293209103137, 22.8680419921875, 51.481382896101, 
      16.7816162109375), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_zoom` = 8, allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_bounds` = c(53.4880455360562, 25.90576171875, 50.7920470644069, 
      13.73291015625), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_zoom` = 7, allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_bounds` = c(54.7753458593645, 31.9921875, 49.3823727870096, 
      7.646484375), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_zoom` = 6, allow_no_input_binding_ = TRUE)
})



test_that("{shinytest2} recording: Map Interactions clicking on map markers", {
  app <- AppDriver$new(name = "Map Interactions clicking on map markers", height = 772, 
      width = 1406)
  app$expect_values()
  app$set_inputs(speciesName = "Herb")
  app$set_inputs(speciesName = "Herb-")
  app$set_inputs(speciesName = "Herb-P")
  app$set_inputs(speciesName = "Herb-Paris")
  app$set_inputs(`mapModule-map_marker_mouseover` = c(0.188602161277753, 51.893, 
      16.6916), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_marker_mouseout` = c(0.46565971180928, 51.893, 16.6916), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_marker_mouseover` = c(0.011852773120449, 52.4137774103, 
      22.2523498605), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_marker_mouseout` = c(0.743655537425628, 52.4137774103, 
      22.2523498605), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_marker_mouseover` = c(0.349137531611065, 51.893, 
      16.6916), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_marker_click` = c(0.108162639986163, 51.893, 16.6916), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_marker_mouseout` = c(0.518376442789139, 51.893, 16.6916), 
      allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_marker_mouseover` = c(0.769605440088138, 52.4137774103, 
      22.2523498605), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_marker_click` = c(0.504625529341058, 52.4137774103, 
      22.2523498605), allow_no_input_binding_ = TRUE)
  app$set_inputs(`mapModule-map_marker_mouseout` = c(0.46185293144688, 52.4137774103, 
      22.2523498605), allow_no_input_binding_ = TRUE)
})

