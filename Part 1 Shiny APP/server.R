# FINAL PROJECT - COURSERA "Developing Data Products"

# Packages required to load stock information and stock plots

require ("quantmod")
require("TTR")
library (shiny)


#if (!require(quantmod)) {
#  stop("This app requires the quantmod package. To install it, run 'install.packages(\"quantmod\")'.\n")
#}

# Download data for a stock if needed, and return the data
require_symbol <- function(symbol, envir = parent.frame()) {
  if (is.null(envir[[symbol]])) {
    envir[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
  }

  envir[[symbol]]
}

shinyServer(function(input, output) {

  # Create an environment for storing data
  symbol_env <- new.env()
 
  # Make a chart for a symbol, with the settings from the inputs
  
  make_chart <- function(symbol) {
    symbol_data <- require_symbol(symbol, symbol_env)
 
  # Collect Data to plot charts
    chartSeries(symbol_data,
                name      = symbol,
                type      = input$chart_type,
                subset    = paste(input$daterange, collapse = "::"),
                log.scale = input$log_y,
                theme = chartTheme('black',up.col='red',dn.col='gold'))
                           
         addBBands(n = 20, sd = 2, ma= "SMA", draw = input$BBAND, on = -1)
        }

  # Returning dat ready to output
  
  output$plot_imax <- renderPlot({ make_chart("IMAX") })
  output$plot_anet <- renderPlot({ make_chart("ANET") })
  output$plot_nov  <- renderPlot({ make_chart("NOV")  })
  output$plot_goog <- renderPlot({ make_chart("GOOG") })
  output$plot_nflx <- renderPlot({ make_chart("NFLX") })
  output$plot_yhoo <- renderPlot({ make_chart("YHOO") })
  
})