# load necessary packages
# and source your functions.R file
library(shiny)
library(tidyverse)
library(bslib)
library(gt)
library(dplyr)
library(usmap)

arrestByState <- read.csv("arrestByState.csv")

source('functions.R')

# this function defines your server logic
server <- function(input, output){
  # you will put your interactions here
  
  filteredTable <- reactive({
    if(is.null(input$select)){
      filtered <- arrestByState
    } else {
      filtered <- arrestByState %>%
        filter(state %in% input$select) }
  })
  
  filteredMap <- reactive({
    if(is.null(input$select) || length(input$select) == 0){
      arrestByState
    } else {
      arrestByState %>% filter(state %in% input$select)
    }
  })
  
  output$myTable <- gt::render_gt({
    
     filteredTable() %>%
      gt() %>%
      cols_label(state ~ "State", 
                 Murder ~ "Murder",
                 Assault ~ "Assault",
                 UrbanPop ~ "Urban Population",
                 Rape ~ "Rape") %>%
      tab_header(title = "1973 Arrests per 100,000 People in Each State") %>%
      tab_source_note(md(" **Source** McNeil, D. R. (1977) *Interactive Data Analysis*. New York: Wiley. ")) %>%
      cols_align(align = "center", columns = everything())
  })
  
  
  
  output$plot <- renderPlot({
    req(input$selectCrime)
    req(nrow(filteredMap()) > 0)
    plot_usmap(data = filteredMap(), values = input$selectCrime, color = "white") +
      scale_fill_continuous(low = "lightblue", high = "darkred", name = input$selectCrime) +
      labs(title = "US Murder Arrests by State") +
      theme(legend.position = "right")
      
    
    
    
  })
  
}
