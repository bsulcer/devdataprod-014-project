library(shiny)

lambda <- 0.2

generateSamples <- function(sampleSize, numSamples) {
    means = NULL
    for (i in 1:numSamples) {
        x <- rexp(sampleSize, lambda)
        means = c(means, mean(x))
    }
    means
}

shinyServer(
    function(input, output) {
        means <- reactive({generateSamples(input$sampleSize,
                                           input$numSamples)})
        output$theoreticalMean <- renderText({1 / lambda})
        output$sampleMean <- renderText({mean(means())})
        output$sampleMeanHist <- renderPlot({
            hist(means(), xlab='sample mean',
                 main='Distribution of sample means')
        })
    })