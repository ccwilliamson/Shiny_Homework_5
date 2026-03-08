# Build your UI page here


ui <- bslib::page_fluid(
  
  
  selectizeInput( 
    "select", 
    "Select options below:", 
    list("Choice 1A" = "1A", "Choice 1B" = "1B", "Choice 1C" = "1C"), 
    multiple = TRUE 
  ), 
  
  checkboxInput("checkbox", "Checkbox", FALSE), 
  
  gt::gt_output("myTable")
 
)