library(shiny)

# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)
options("scipen" = 20)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$plot <- renderPlot({
    all_team_history_salary <- read.csv("lahman-csv_2014-02-14/Salaries.csv")
    all_team_history_salary <- all_team_history_salary[all_team_history_salary$yearID == input$yearID, c("yearID", "teamID", "salary")]
    team_salary <- aggregate(salary ~ teamID, all_team_history_salary,sum)
    if(input$order =="ASC"){
      team_salary<-with(team_salary, team_salary[order(salary),])
    }
    else{
      team_salary<-with(team_salary, team_salary[order(-salary),])
    }
    labels <- team_salary$teamID
    team_salary$teamID <- factor(team_salary$teamID, levels=labels)
    ggplot(data=team_salary, aes(teamID, salary)) + geom_point() + theme(panel.background = element_rect(fill = 'skyblue'))
  })
  
})