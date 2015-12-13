library(shiny)
shinyServer(
    function(input, output) {
        output$ct <- renderPlot({
            # link input
            noOfTosses <- input$noOfTosses
            noOfHeads <- input$noOfHeads
            confInt <- input$confInt
            # calculate needed variables
            probHeads <- 0.5 # binomial probability
            v <- 0:noOfTosses # vector of possible outcomes
            mu <- round(mean(v),0) # expected value for noOfHeads
            startCI <- round((binom.test(mu, noOfTosses, p = probHeads, conf.level = confInt)$conf.int[1] * noOfTosses), 0)
            endCI <-  round((binom.test(mu, noOfTosses, p = probHeads, conf.level = confInt)$conf.int[2] * noOfTosses), 0)    
            colNOH <- ifelse((noOfHeads <= endCI & noOfHeads >= startCI), "blue" , "red")
            out <- cbind(v, choose(noOfTosses,v[])/sum(choose(noOfTosses,v[])))
            
                plot(out, type = "h" , 
                     main = "Head distribution",
                     xlab = "Number of heads (n)",
                     ylab = "Probability of n heads"
                     )
                #entered noOfHeads
                lines(c(noOfHeads,noOfHeads), c(0, 1),col= colNOH ,lwd=5)
                #acceptance zone
                lines(c(startCI,endCI), c(0, 0),col="green",lwd=5)
                #legend
                leg.txt <- c("acceptance zone","fair coin","unfair coin")
                legend("topright",legend = leg.txt, fill = c("green","blue","red"))
                
            })
    }
)