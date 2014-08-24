library(shiny)

# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

all_team_history_salary <- read.csv("lahman-csv_2014-02-14/Salaries.csv")

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("MLB Team Salary Report"),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4, 
             selectInput("yearID", 
                         "Year:", 
                         sort(unique(as.character(all_team_history_salary$yearID)),decreasing = TRUE))
      ),
      column(4, 
             selectInput("order", 
                         "Order By:", 
                         c("ASC","DES"))
      ) 
    ),
    # Create a new row for the Plot
    fluidRow(
      plotOutput("plot")
    )    
  )  
)