library(shiny)

shinyUI(pageWithSidebar(

headerPanel("ITHIM"),
## we should also think about how to allow for all the results of selected scenario to be downloaded as CSV
## I think users will be interested in seeing a scenario against baseline or a scenario against another so may think about duplicating 
## the current display to show the results of two runs side by side or atop one another


sidebarPanel(
    sliderInput("muwt", "Mean Walking Time (min per week):",
                min=57.8, max=120, value=57.8),
    sliderInput("muct", "Mean Cycling Time (min per week):",
                min=3.0, max=300, value=200.5),
    radioButtons("region", "Region:",
                 c("Bay Area"="SFBayArea", "National"="national"),
                 inline = TRUE, selected = "SFBayArea", width = '100%'),
    width = 2),

mainPanel(
    tabsetPanel(
        tabPanel("Deaths", plotOutput("DeathsPlot",height="400px")),
        tabPanel("DALY", plotOutput("DALYPlot",height="400px")),
        tabPanel("YLD", plotOutput("YLDPlot",height="400px")),
        tabPanel("YLL", plotOutput("YLLPlot",height="400px")),
        tabPanel("Deaths Summary", tableOutput("DeathsTable")),
        tabPanel("DALY Summary", tableOutput("DALYTable")),
        tabPanel("YLD Summary", tableOutput("YLDTable")),
        tabPanel("YLL Summary", tableOutput("YLLTable")),
        type = "pills"
    )
)

))

## selectInput("variable", "Variable:",
##             list("Depression" = "Depression",
##                  "Dementia" = "Dementia",
##                  "BreastCancer" = "BreastCancer",
##                  "ColonCancer" = "ColonCancer",
##                  "CVD" = "CVD",
##                  "Diabetes" = "Diabetes")),
