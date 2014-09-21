library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Risk of heart disease"),
    sidebarPanel(
      h2('Your risk factors'),
      h3('Non-modifiable risk factors'),
      sliderInput("age","Your age",min = 1,max = 120,value = 30),
      h4('If some of your ascendents developed heart disease before 55, your risk increases'),
      checkboxInput('history', "History of heart disease in your family", value=FALSE),
      h3('Modifiable risk factors'),
      h4('High cholesterol levels increase heart disease risk'),
      numericInput('chol', 'Cholesterol(mg/dL)', 200, min = 100, max = 500, step = 5),
      h4('Hypertension also significantly increases risks of heart disease'),
      numericInput('sys', "Systolic blood pressure(mmHg)", 120, min =80, max=200, step = 2),
      submitButton('Submit')
    ),
    mainPanel(
      h2('Your heart disease risk'),
      h3('Your information'),
      textOutput("age"),
      textOutput("history"),
      textOutput("chol"),
      textOutput("sys"),
      h3('Your heart disease risk (don\'t believe this formula, talk to a real doctor!)'),
      textOutput("risk")
    )
  )
)
