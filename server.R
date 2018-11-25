#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define the server logic
server <- function(input, output) {
  output$plot <- renderPlotly({
    data <- subset(gapminder,
                   continent %in% input$continents &
                     year >= input$years[1] & year <= input$years[2])
    
    Myplot <- ggplot(data, aes(gdpPercap, lifeExp)) +
      geom_point(size = input$size, col = input$colour) +
      scale_x_log10() +
      ggtitle(input$title)
    
    if (input$fit) {
      Myplot <- Myplot + geom_smooth(method = "lm")
    }
    Myplot
  })
  
  output$data1 <- DT::renderDataTable(
    DT::datatable(data = gapminder, 
                  options = list(pageLength = 15), 
                  rownames = FALSE))
  
}