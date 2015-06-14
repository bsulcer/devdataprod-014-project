library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Exploring the central limit theorem"),
    sidebarPanel(
        h3('Simulation parameters'),
        selectInput("sampleSize", "Sample size",
                    choices = c(10, 100, 500)),
        selectInput("numSamples", "Number of samples",
                    choices = c(10, 100, 1000))
        ),
        
    mainPanel(
        p('This application allows exploration of the distribution
          of sample means for the lambda distribution (lambda=0.2).
          You can select sample size and the number of samples to
          simulate on the left.  Samples will be simulated and the
          distribution of samples means will be visualized below.
          By increasing the number of samples, you should be able
          to see how the mean of sample means converges to the
          theoretical distribution of the mean, as the central limit
          theorem predicts.  You should also notice how the distribution
          of sample means gets closer to a normal-shaped distribution.'),
        h3('Simulation results'),
        h4('Theoretical mean of the distribution:'),
        textOutput('theoreticalMean'),
        h4('Mean of sample means:'),
        textOutput('sampleMean'),
        h4('Histogram of distribution of sample means'),
        plotOutput('sampleMeanHist')
        )
    ))