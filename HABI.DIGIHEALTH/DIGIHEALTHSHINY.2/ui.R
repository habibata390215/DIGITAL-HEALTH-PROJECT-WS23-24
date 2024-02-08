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
  titlePanel("Region Counts"),
  sidebarLayout(
    sidebarPanel(
      selectInput("sort_by", "Sort by:", choices = c("Count", "Region (A-Z)"), selected = "Count"),
      numericInput("bins", "Number of Bars", min = 5, max = 20, value = 10)
    ),
    mainPanel(
      plotOutput("region_counts")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Load sample data (replace with your data)
  region_data <- data.frame(region = c("Northern", "Ashanti", "Eastern", "Western", "Greater Accra","Volta","Upper East","Upper West","Central","Brong Ahafo"), count = c(98,102,83,118,99,104,95,105,83,112))
  
  # Create reactive data for sorting
  reactive_data <- reactive({
    sorted_data <- region_data
    if (input$sort_by == "Count") {
      sorted_data <- arrange(sorted_data, desc(count))
    } else {
      sorted_data <- arrange(sorted_data, region)
    }
    sorted_data[1:input$bins, ]  # Limit to selected number of bars
  })
  
  # Create bar graph
  output$region_counts <- renderPlot({
    ggplot(reactive_data(), aes(x = region, y = count)) +
      geom_bar(stat = "identity", fill = "skyblue") +
      labs(title = "Number of People per Region", x = "", y = "") +
      theme_bw() +
      scale_x_discrete(expand = c(0.1, 0.1)) + 
      theme(axis.text.x = element_text(angle = 45, hjust = 1))  
  })
}


# Run the Shiny app
shinyApp(ui = ui, server = server)

