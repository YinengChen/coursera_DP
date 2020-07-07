library(shiny)
library(leaflet)

button_color_css <- "
#DivCompClear, #FinderClear, #EnterTimes{
/* Change the background color of the update button
to blue. */
background: DodgerBlue;
/* Change the text size to 15 pixels. */
font-size: 15px;
}"

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("Search for an Airbnb house in Manhattan"),
    sidebarLayout(
        sidebarPanel(
            h2("Desired Airbnb Characteristics!"),
            fluidRow(column(5,
                             checkboxGroupInput(inputId = "rate",
                                               label = "Choose a rate",
                                               choices = c("1","2","3","4","5"),
                                               selected = "3")
                            ),
                     column(5, offset = 2,
                            checkboxGroupInput(inputId = "type",
                                               label = "Choose rome type",
                                               choices = c("Entire home/apt","Private room","Hotel room","Shared room"),
                                               selected = "Entire home/apt"),)
                     ),
            
            selectInput(inputId = "Regions", 
                        label = "Choose a Region", 
                        choices = c("Midtown","Murray Hill","Hell's Kitchen","Chinatown",
                                    "West Village","East Harlem","Upper West Side","East Village",
                                    "Harlem","Lower East Side","Chelsea","Kips Bay","Nolita",
                                    "Upper East Side","Washington Heights" ,"Tribeca","NoHo",
                                    "Morningside Heights","Flatiron District","Roosevelt Island",
                                    "SoHo","Greenwich Village" ,"Little Italy","Gramercy",
                                    "Inwood","Theater District","Financial District","Battery Park City",
                                    "Two Bridges", "Civic Center", "Stuyvesant Town", "Marble Hill")),
            sliderInput("price", "Pick a price rage",
                        100, 500, value = c(200, 300))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Searching Result:"),
            leafletOutput("mymap")
           
        )
    )
))
