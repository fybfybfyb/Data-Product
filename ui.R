library(shiny)
library(markdown)
library(rsconnect)
navbarPage("Navbar",
  tabPanel("Plot",
     sidebarLayout(
        sidebarPanel(
                        selectInput("predictor",'Select removed predictor',
                                    choices = c("cylinders","horsepower","weight","automatic or manual"))
     ),
     mainPanel(
             h4("Graph of different predictions based on combination of best predictors"),
            plotOutput("plot1")
     )
  )
 ),
tabPanel("summary",
         verbatimTextOutput("txt1")
         ),
 navbarMenu("More",
   tabPanel("Data",
            dataTableOutput("data")),
   tabPanel("brief introduction",
            fluidRow(
            column(width = 4,
                   includeMarkdown("detail.Rmd")),
            column(5,
            imageOutput("image1", height = 300))
      )
     )
   )
)


