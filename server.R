library(shiny)
library(rsconnect)
# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
        output$plot1 <- renderPlot({
                data("mtcars")
                plot(mtcars$mpg)
                if(input$predictor == "cylinders"){
                        points(lm(mpg~hp+wt+am, data = mtcars)$fit, col = "red", pch = 2, cex = 1)
                }
                else if(input$predictor == "horsepower"){
                        points(lm(mpg~cyl+wt+am, data = mtcars)$fit, col = "darkorange",pch = 2, cex = 1)
                }
                else if(input$predictor == "weight"){
                        points(lm(mpg~cyl+hp+am, data = mtcars)$fit, col = "deepskyblue",pch = 2, cex = 1)
                }
                else if(input$predictor == "automatic or manual"){
                        points(lm(mpg~cyl+hp+wt, data = mtcars)$fit, col = "deeppink",pch = 2, cex = 1)
                }
        })
        output$txt1 <- renderPrint({
                if(input$predictor == "cylinders"){
                        summary(lm(mpg~hp+wt+am, data = mtcars))
                }
                else if(input$predictor == "horsepower"){
                        summary(lm(mpg~cyl+wt+am, data = mtcars))
                }
                else if(input$predictor == "weight"){
                        summary(lm(mpg~cyl+hp+am, data = mtcars))
                }
                else if(input$predictor == "automatic or manual"){
                        summary(lm(mpg~cyl+hp+wt, data = mtcars))
                }
        })
        output$data <- renderDataTable({
                mtcars
        })
        output$image1 <-renderImage({
                filename <- normalizePath(file.path('img1.jpg'))
                list(src = filename)
        }, deleteFile = FALSE)
})
