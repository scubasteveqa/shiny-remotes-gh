library(shiny)
library(ggplot2)
library(tidyverse)

# Define UI for application
ui <- fluidPage(
  titlePanel("Shiny App using ggplot2 and tidyverse from GitHub"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs",
                  "Number of observations:",
                  min = 1,
                  max = 1000,
                  value = 500)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$distPlot <- renderPlot({
    # Generate a random dataset
    data <- tibble(x = rnorm(input$obs))
    
    # Create a plot using ggplot2
    ggplot(data, aes(x = x)) + geom_histogram(binwidth = 0.5)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
