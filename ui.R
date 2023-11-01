library(shiny)
library(shinydashboard)
library(shinydashboardPlus)

# Define your CSS code
CSS <- "
P {
  line-height: 1.6;
  font-family: Helvetica;
  text-align: justify;
  margin: 0;
  font-size: 19px;
}

h1 {
  line-height: 1.6;
  font-family: Helvetica;
  color: green;
  text-align: center;
  margin: 0;
  font-size: 24px;
}

.Rlogo {
  float: left;
  width: 300px;
  shape-outside: url('www/Jacaranda_Health18.jpg');
  shape-margin: 20px;
  margin-right: 20px;
  margin-bottom: 20px;
}

.Hlogo {
  float: right;
  width: 400px;
  shape-outside: url('www/Jacaranda_Health67.jpg');
  shape-margin: 20px;
  margin-right: 20px;
  margin-bottom: 20px;
}

h2 {
  line-height: 1.6;
  font-family: Helvetica;
  color: green;
  text-align: center;
  margin: 0;
  font-size: 24px;
}
"

Df <- readxl::read_excel("H:\\Jacaranda_Health\\FQA\\Dashboards\\Facility_Quality_Assessment\\Facility_Quality_Assessment_Tool.xlsx")

# Define the UI
ui <- dashboardPage(
  skin = "purple",
  dashboardHeader(
    title = "FQA Dashboard",
    tags$li(class = "dropdown",
            tags$style(".main-header {max-height: 70px}"),
            tags$style(".main-header .logo {height = 70px;}"),
            tags$style(".sidebar-toggle {height: 70px; padding-top: 1px !important;}"),
            tags$style(".navbar {min-height:70px !important}"),
            tags$style(".left-side, .sidebar {margin-top: 20px !important;}")
    ),
    tags$li(class = "dropdown",
            tags$a(href = "https://www.jacarandahealth.org",
                   tags$img(src = "Jacaranda_logo.png", height = "50px", alt = "Jacaranda Health"))
    )
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Analysis", tabName = "Analysis"),
      menuItem("Map", tabName = "Map")
    )
  ),
  dashboardBody(
    tags$head(
      tags$style(HTML(CSS))  # Inject your CSS code here
    ),
    tabItems(
      tabItem(
        tabName = "Analysis",
        tabBox(
          id = "t1",
          width = 12,
          tabPanel("About", icon = icon("address-card"),
                   fluidRow(
                     column(
                       width = 12,
                       h1(strong("About the Project"), align = "justify"),
                       img(class = "Rlogo", src = 'Jacaranda_Health18.jpg'),
                       p(
                         style = "text-align: justify;",
                         "In Kenya, demand and supply-side delays impact a mother's journey through the health system. Compounded by a lack of integrated data to help counties target investments towards priority areas and limited resources and autonomy for managers to improve the quality of services across a mother's journey."
                       )
                     )
                   )
          ),
          tabPanel("Goals and Objectives", icon = icon("tasks"),
                   fluidRow(
                     column(width = 4,
                            infoBox(
                              title = tags$div(
                                style = "font-size: 18px; font-family: Helvetica; font-weight: bold; color: blue; text-align: justify;",
                                tags$img(src = "PROMPTS-07.png", height = "80px", width = "80px"),
                                "01 Resource Gaps"
                              ),
                              subtitle = tags$div(
                                style = "font-size: 14px; font-family: Helvetica; text-align: justify;",
                                "Identify gaps in staffing, essential commodities, facility infrastructure, equipment & service delivery"
                              ),
                              width = 12
                            )
                     ),
                     column(width = 4,
                            infoBox(
                              title = tags$div(
                                style = "font-size: 14px; font-family: Helvetica; font-weight: bold; color: purple;",
                                "02 Ecosystem"
                              ),
                              subtitle = tags$div(
                                style = "font-size: 13px; font-family: Helvetica;",
                                "Integrate the Quality gap data with health system"
                              ),
                              width = 12
                            )
                     ),
                     column(width = 4,
                            infoBox(
                              title = tags$div(
                                style = "font-size: 18px; font-family: Helvetica; font-weight: bold; color: blue; text-align: justify;",
                                tags$img(src = "PROMPTS-07.png", height = "80px", width = "80px"),
                                "03 Decision Making "
                              ),
                              subtitle = "Inform the county of areas they need to prioritize resources in order to improve MNCH",
                              width = 12
                            )
                     )
                   )
          ),
          tabPanel("Visualization", icon = icon("table"))
        )
      ),
      tabItem(tabName = "Map",
              h2("Map Tab Content")
              # Add more content specific to the Map tab
      )
    )
  )
)

