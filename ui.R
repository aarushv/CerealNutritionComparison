library(shiny)
my.ui <- fluidPage(
  
  # Page title
  titlePanel("Nurtrition Data as per Cereal Manufacturer"),
  
  # Creating a dropdodwn and a slider to allow interaction.
  sidebarLayout(
    sidebarPanel(
        selectInput("brand", 
                    label = "Select a Manufacturer",
                    choices = list("General Mills" = "G", "Kelloggs" = "K", "Nabisco" = "N", "Post" = "P",
                                   "Quaker Oats" = "Q", "Ralston Purina" = "R"), 
                    selected = "G"),
        
        selectInput("nutrition",
                    label = "Select Nutrition Data Input",
                    choices = list("Calories" = "calories", "Potassium" = "potass" ),
                    selected = "calories")
  ),
  # Plots a bar chart with relevant values
  mainPanel(
    plotOutput("createPlot")
  )
 )
)
shinyUI(my.ui)