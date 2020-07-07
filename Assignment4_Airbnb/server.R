library(shiny)
library(tidyverse)

load("Manh_airbnb.RData")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$mymap = renderLeaflet({
        rate_selected = input$rate
        type_selected = input$type
        region_selected = input$Regions
        min_price = input$price[1]
        max_price = input$price[2]
        
        house_selected = Manh_airbnb %>% 
            filter(room_type %in% type_selected,
                   rating %in%  rate_selected,
                   neighbourhood %in%  region_selected) %>% 
            filter( price > min_price &  price <= max_price) 
        
        popupmessage = paste("Name:", as.character(house_selected$name), "<br>",
                             "Room Type:", as.character(house_selected$room_type), "<br>",
                             "Price: $", as.character(house_selected$price), "<br>",
                             "Rating:", house_selected$rating,"<br>")
        
        house_selected %>% 
            leaflet() %>%
            setView(lng = -73.9712, lat = 40.7831, zoom = 12) %>% 
            addTiles() %>%
            addAwesomeMarkers(clusterOptions = markerClusterOptions(),
                              popup = popupmessage)
    })
    
})
