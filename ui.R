# Build your UI page here


ui <- page_navbar(
  
  title = "1973 US Crime Statistics By State ",
  
  nav_panel(
    "All Crime Statistics",

  card(
    card_header("All states"),
    card_body(
      selectizeInput( 
        "select", 
        "Select options below:", 
        list("Alabama", "Alaska", "Arizona", "Arkansas", "California",
             "Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
             "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
             "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland",
             "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri",
             "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
             "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio",
             "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina",
             "South Dakota", "Tennessee", "Texas", "Utah", "Vermont",
             "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"), 
        multiple = TRUE 
      ),
      
      gt::gt_output("myTable")
    )
  )
  )

 
  
  
  )
