riskCalc <- function(age, history,chol, sys) {
  risk <- 1
  if (age > 55) {risk <- risk * 2^((age-55)/10)}
  if (history) {risk <- risk*5}
  if (chol>200) {risk <- risk * (1+(chol-200)/10)}
  if (sys>120) {risk <- risk * 2^((sys-120)/20)}
  return(risk)
}

shinyServer(
  function(input, output) {
    output$age <- renderPrint({paste('Your age is ',input$age)})
    output$history <- renderPrint({if (input$history) {'There is a history of heart disease in your family'}
                                   else {'There is no history of heart disease in your family'}})
    output$chol <- renderPrint({paste('Your cholesterol level is ',input$chol)})
    output$sys <- renderPrint({paste('Your systolic blood pressure is ',input$sys)})
    output$risk <- renderPrint({
      ris <- riskCalc(input$age, input$history, input$chol, input$sys)
      if (ris==1) {'Your heart disease risk is not higher than average'}
      else {paste('You have a ', ris,' times higher than average of developing heart disease')}})
  }
)
