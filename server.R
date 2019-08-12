library(shiny)
library(tidyr)
library(dplyr)
library(ggplot2)


shinyServer(function(input, output) {
    
    output$plot1 <- renderPlot({
        data("EuStockMarkets")
        stocks <- as.data.frame(EuStockMarkets) %>%
            gather(index, price) %>%
            mutate(time = rep(time(EuStockMarkets), 4))
        
        if (input$showDAX) {
            stocks <- stocks
        } else {
            stocks <- stocks[stocks$index != "DAX",]
        }
        
        
        if (input$showSMI) {
            stocks <- stocks
        } else {
            stocks <- stocks[stocks$index != "SMI",]
        }
        
        if (input$showCAC) {
            stocks <- stocks
        } else {
            stocks <- stocks[stocks$index != "CAC",]
        }
        
        
        if (input$showFTSE) {
            stocks <- stocks
        } else {
            stocks <- stocks[stocks$index != "FTSE",]
        }
        
        ggplot(data = stocks, aes(x = time, y = price, col = index)) +
            geom_line() +
            xlab("Time") +
            ylab("Index Value")
            })
    
    
    output$date1  <- renderText({
        as.character(input$date)
    })
    
    numDays <- reactive({
        Sys.Date() - input$date
    })
    
    output$ndays <- renderText({
        paste(as.character(numDays()), "days")
    })
    
})
