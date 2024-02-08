#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)



# Define UI
ui <- fluidPage(
  titlePanel("Age Histogram"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("age_range", "Age Range", min = 0, max = 100, value = c(20, 80)),
      numericInput("bins", "Number of Bins", min = 5, max = 50, value = 20)
    ),
    mainPanel(
      plotOutput("age_hist")
    )
  )
)


server <- function(input, output) {
  output$age_hist <- renderPlot({
    
    age_data <- rnorm(1000, mean = 50, sd = 15)
    
    
    filtered_data <- age_data[age_data >= input$age_range[1] & age_data <= input$age_range[2]]
    
    
    hist(filtered_data, breaks = input$bins, main = "Age Histogram", col = "lightblue")
  })
}


shinyApp(ui = ui, server = server)

