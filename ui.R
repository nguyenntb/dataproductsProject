library(shiny)

shinyUI(fluidPage(

    titlePanel("Major European Stock Indices Data"),

    sidebarLayout(
        sidebarPanel(
            dateInput("date",
                        "Choose a date:",
                        value = "1995-01-01",
                      format = "mm/dd/yyyy",
                      min = "1991-01-01",
                      max = "1998-12-31"),
            checkboxInput("showDAX", "Show/Hide DAX Index", value = TRUE),
            checkboxInput("showSMI", "Show/Hide SMI Index", value = TRUE),
            checkboxInput("showCAC", "Show/Hide CAC Index", value = TRUE),
            checkboxInput("showFTSE", "Show/Hide FTSE Index", value = TRUE),
            submitButton("Submit")
        ),

        mainPanel(
            h3("A time-series plot of major European Stock Market Indices"),
            plotOutput("plot1"),
            h3("The chosen date is:"),
            textOutput("date1"),
            h3("Number of days from the chosen date to today is:"),
            textOutput("ndays")

        )
    )
))
