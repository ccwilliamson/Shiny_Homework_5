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
  
  
  output$myTable <- gt::render_gt({

    if(is.null(input$select)){
      filtered <- arrestByState
    } else {
      filtered <- arrestByState %>%
        filter(state %in% input$select) }
    
     filtered %>%
      gt() %>%
      cols_label(state ~ "State", 
                 murder ~ "Murder",
                 assault ~ "Assault",
                 urbanPop ~ "Urban Population",
                 rape ~ "Rape") %>%
      tab_header(title = "1973 Arrests per 100,000 People in Each State") %>%
      tab_source_note(md(" **Source** McNeil, D. R. (1977) *Interactive Data Analysis*. New York: Wiley. ")) %>%
      cols_align(align = "center", columns = everything())
  })
  
}
