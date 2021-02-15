##setwd("~/Desktop/INFO_201_Assignments/a8-shiny-aarushv")
library(shiny)
library(dplyr)
library(ggplot2)
library(data.table)
rsconnect::setAccountInfo(name='aarushvohra',
                          token='09284FA07A21092D58E87B6F839864FD',
                          secret='dVIqk/RaPyFaYmK3/kiek5YjdbJ574qOPzHCl5wB')
##reads in the cereal data set
cereal_data <- read.table(file = "data/cereal.tsv", fill = TRUE, stringsAsFactors = FALSE, header = TRUE, sep = "")

##takes in user input as a perameter and alters the output using ggplot to produce different bar charts
my.server <- shinyServer(function(input, output) {
  cereal.server <- function() {

    choice <- filter(cereal_data, mfr == input$brand) %>%
      select(name, calories, potass)
    ychoice <- select(choice, input$nutrition)
  
    ggplot(choice) +
      geom_bar(mapping=aes(x=name, y=ychoice), color = "Yellow" , stat= "identity") + coord_flip() + labs(x = "Cereal Names", y = "Quantity of Nutrition Input")
    
  }
    output$createPlot <- renderPlot({
      cereal.server()
  })
})

shinyServer(my.server)
