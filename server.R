
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  #dataOut is a "reactive" dataset - you can add live filtering criteria here
  #to use this reactive, notice you have to use dataOut() rather than just dataOut
  #in this expression
  dataOut <- reactive({
    dataset
  })
  
  output$summaryTable <- renderPrint({
    summary(dataOut())
  })
  
  output$crossTab <- renderTable({
    #ggplot()
    out <- dataOut()[,c(input$crossTab1, input$crossTab2)]
    tab <- table(out)
    tab
  })
  
  output$distPlot <- renderPlot({
    
    outPlot <- ggplot(dataOut(), aes_string(x=input$numericVarHist)) + geom_histogram(bins=input$bins)

    if(input$catVarHist!="none"){
      outPlot <- outPlot + facet_wrap(c(input$catVarHist))
    }
    
    outPlot
  })

  output$boxPlot <- renderPlot({
    outPlot <- ggplot(dataOut(), aes_string(input$catVarBox, input$numericVarBox)) + geom_boxplot()
    outPlot
  })
  
  output$correlationPlot <- renderPlot({
    outPlot <- ggplot(dataOut(), aes_string(input$numericVarCor1, input$numericVarCor2,colour=input$corrPlotCatVar)) +geom_point()
    outPlot
  })
  
})
