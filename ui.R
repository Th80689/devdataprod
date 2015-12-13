#setwd("C:/Users/Thomas/Documents/Coursera_9_createdataproducts/shiny")

library(shiny)
shinyUI(pageWithSidebar(
    # application title
    headerPanel("The fair coin check"
),
        
    sidebarPanel(
        h3('Instructions'),
        p("Do you wonder if the coin you are tossing is a fair one?
           This little program shows you, if the reached number of heads in a given number of tosses confirms the H0-hypothesis 'fair coin'. In this case, the Number of heads line turns BLUE. 
           If the number is not within the given range, the fairness cannot be confirmed and the line turns RED.
           "),
        numericInput('noOfTosses', 'Number of Tosses', 10, min = 1, max = 100, step = 1),
        numericInput('noOfHeads', 'Number of Heads', 5, min = 0, max = 100, step = 1),
        sliderInput('confInt', 'Confidence interval',value = 0.95, min = 0.8, max = 0.999, step = 0.001)
        ),
    mainPanel(
        plotOutput('ct')        
    )
))
#https://th80689.shinyapps.io/shiny