# FINAL PROJECT - COURSERA "Developing Data Products"


shinyUI(pageWithSidebar(
  headerPanel("My 2016 Stock Portfolio: Best stocks as per Frobes and My intuition"),
  sidebarPanel(
    wellPanel(
      p(strong("Stocks")),
      checkboxInput(inputId = "stock_imax", label = "Imax (IMAX)", value = TRUE),
      checkboxInput(inputId = "stock_anet", label = "Arista Networks (ANET)", value = FALSE),
      checkboxInput(inputId = "stock_nov",  label = "National Oilwell Varco (NOV)", value = FALSE),
      checkboxInput(inputId = "stock_goog", label = "Google (GOOG)", value = FALSE),
      checkboxInput(inputId = "stock_nflx", label = "Netflix (NFLX)", value = FALSE),
      checkboxInput(inputId = "stock_yhoo", label = "Yahoo (YHOO)", value = FALSE)
      
          ),
  
  #Chart Type selection
      selectInput(inputId = "chart_type",
                label = "Chart type",
                choices = c("Candlestick" = "candlesticks",
                            "Matchstick" = "matchsticks",
                            "Bar" = "bars",
                            "Line" = "line")
    ),
    
    
  #Boillinger Analysis
    selectInput(inputId = "BBAND",
                label = "Bollinger Analysis",
                choices = c("percent" = "percent" , "bands"="bands")
    ),
    
  #DATE rotuine
     dateRangeInput(inputId = "daterange", label = "Date range",
      start = Sys.Date() - 90, end = Sys.Date()),
  #LOG 
  
    checkboxInput(inputId = "log_y", label = "log y axis", value = TRUE)
  ),

  mainPanel(
  #summary  
   h4('Stock Analysis Chart vs. BBands'),

  #Plots
  
    conditionalPanel(condition = "input.stock_imax",
      br(),
      div(plotOutput(outputId = "plot_imax"))),

    conditionalPanel(condition = "input.stock_anet",
      br(),
      div(plotOutput(outputId = "plot_anet"))),

    conditionalPanel(condition = "input.stock_nov",
      br(),
      div(plotOutput(outputId = "plot_nov"))),

    conditionalPanel(condition = "input.stock_goog",
      br(),
      div(plotOutput(outputId = "plot_goog"))),

    conditionalPanel(condition = "input.stock_nflx",
      br(),
     div(plotOutput(outputId = "plot_nflx"))),
      
    conditionalPanel(condition = "input.stock_yhoo",
                 br(),
                 plotOutput(outputId = "plot_yhoo"))

  )
))
