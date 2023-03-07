############################################
# Sejyoti Chakraborty#
# https://github.com/sejyoti #
# https://twitter.com/Sejyotiarna#
# https://www.linkedin.com/in/sejyoti-chakraborty-2124b519b/ #
############################################

library(shiny)
library(shinythemes)


####################################
# User Interface                   #
####################################
ui <- fluidPage(theme = shinytheme("united"),
                navbarPage("BMI Calculator:",
                           
                           tabPanel("Home",
                                    # Input values
                                    sidebarPanel(
                                      HTML("<h3>Input parameters</h3>"),
                                      sliderInput("height", 
                                                  label = "Height", 
                                                  value = 175, 
                                                  min = 40, 
                                                  max = 250),
                                      sliderInput("weight", 
                                                  label = "Weight", 
                                                  value = 70, 
                                                  min = 20, 
                                                  max = 100),
                                      
                                      actionButton("submitbutton", 
                                                   "Submit", 
                                                   class = "btn btn-primary")
                                    ),
                                    
                                    mainPanel(
                                      tags$label(h3('Status/Output')), # Status/Output Text Box
                                      verbatimTextOutput('contents'),
                                      tableOutput('tabledata') # Results table
                                    ) # mainPanel()
                                    
                           ), #tabPanel(), Home
                           
                           tabPanel("About", 
                                    titlePanel("About"), 
                                    div(includeMarkdown("about.md"), 
                                        align="justify")
                           ) #tabPanel(), About
                           
                ) # navbarPage()
) # fluidPage()


####################################
# Server                           #
####################################

  
  # Input Data
  datasetInput <- reactive({  
    
    bmi <- input$weight/( (input$height/100) * (input$height/100) )
    bmi <- data.frame(bmi)
    names(bmi) <- "BMI"
    print(bmi)
    
  })
  
  # Status/Output Text Box
  output$contents <- renderPrint({
    if (input$submitbutton>0) { 
      isolate("Calculation complete.") 
    } else {
      return("Server is ready for calculation.")
    }
  
  })
  
  # Prediction results table
  output$tabledata <- renderTable({
    if (input$submitbutton>0) { 
      isolate(datasetInput()) 
    } 
  })
  
}


####################################
# Create Shiny App                 #
####################################
shinyApp(ui = ui, server = server)
