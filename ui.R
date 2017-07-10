
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(navbarPage(

  # Application title
  "Data Explorer",

  # Sidebar with a slider input for number of bins
    tabPanel("Summary of Files",
             verbatimTextOutput("summaryTable")),
    tabPanel("Crosstab Explorer",
             selectInput(inputId = "crossTab1", "Select Crosstab Variable (x)", choices=categoricalVars, selected=categoricalVars[1]),
             selectInput(inputId = "crossTab2", "Select Crosstab Variable (y)", choices=categoricalVars, selected=categoricalVars[1]),
             tableOutput("crossTab")),
    tabPanel("Histogram Explorer",
              fluidRow(
                column(width = 4,selectInput(inputId = "numericVarHist", "Select Numeric Variable", 
                  choices = numericVars, selected=numericVars[1])),
              column(width=4,selectInput(input="catVarHist", "Select Category to Condition On", 
                  choices = c("none",categoricalVars), selected = "none")),
              column(width=4, sliderInput("bins", "Number of bins:", min = 1, max = 50,value = 30))),
              plotOutput("distPlot")
             # fluidRow(column(width=3, sliderInput("filterValues", "Filter Out Values", min=0, max=9999, value=9999)),
             #          column(width=3, textInput("textFilter", "Remove Values", value="")),
             #          column(width=3, numericInput("scaleValues", "Scale Values", value=1))
             #          )
             
             ),
      tabPanel("Boxplot Explorer",
               fluidRow(column(width = 4, selectInput(inputId = "numericVarBox", "Select Numeric Variable", 
                           choices = numericVars, selected=numericVars[1])),
               column(width=4,selectInput(inputId = "catVarBox", "Select Category to Condition on", 
                           choices = categoricalVars, selected=categoricalVars[1]))),
               plotOutput("boxPlot")
               # 
               # fluidRow(column(width=3, sliderInput("filterValues", "Filter Out Values", min=0, max=9999, value=9999)),
               #          column(width=3, textInput("textFilter", "Remove Values", value="")),
               #          column(width=3, numericInput("scaleValues", "Scale Values", value=1))
               # )
               ),
     tabPanel("Correlation Explorer",
              selectInput(inputId = "numericVarCor1", "Select X variable", 
                          choices = numericVars,
                          selected = numericVars[1]),
              selectInput(inputId = "numericVarCor2", "Select Y variable", 
                          choices = numericVars,
                          selected = numericVars[1]),
              selectInput(inputId = "corrPlotCatVar", "Select Categorical Color Variable", 
                          choices = categoricalVars,
                          selected = NULL),
              plotOutput("correlationPlot")
              )
))
