#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# Load the  packages
library(shiny)
library(shinythemes)
library(plotly)
library(ggplot2)
library(stats)
library(graphics)
library(colourpicker)
library(devtools)
library(gapminder)
library(stringr)
library(dplyr)
library(DT)
library(tools)

fluidPage(theme = shinytheme("cosmo"),
                sidebarLayout(
                  sidebarPanel(
                    textInput("title", "Title Of the Plot", "GDP vs Life Exp"),
                    numericInput("size", "Point size", 2, 1),
                    checkboxInput("fit", "Add line of best fit", TRUE),
                    
                    # colour input
                    colourInput("colour", "Point colour", value = "red"),
                    selectInput("continents", "Continents",
                                choices = levels(gapminder$continent),
                                multiple = TRUE,
                                selected = "Americas"),
                    sliderInput("years", "Years",
                                min(gapminder$year), max(gapminder$year),
                                value = c(1980, 2005)),
                    # Built with Shiny by RStudio
                    br(), br(),
                    h5("Built with",
                       img(src = "https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png", height = "30px"),
                       "by",
                       img(src = "https://www.rstudio.com/wp-content/uploads/2014/07/RStudio-Logo-Blue-Gray.png", height = "30px"),
                       ".")
                    
                  ),
                  mainPanel(
                    tabsetPanel(type = "tabs",
                                tabPanel("Plot", plotlyOutput("plot")),
                                tabPanel("Data",
                                         br(),
                                         DT::dataTableOutput(outputId = "data1")),
                                tabPanel(title = "Description", tags$b("Data Analysis with Gapminder dataset.Gapminder dataset contains few socioeconomic data for 142 countries
                                                                       between the year 1952 and 2007. Each row in the dataset records the life expectancy, population 
                                                                       and GDP per capita of one country in a given year. The countries are divide into 5 continents and 
                                                                       data is recorded in 5 years of intervals  A plot is created to show the relationship between Life Expectancy
                                                                       and Per Capita GDP. Also a Linear Model is built to predict the life expectancyfor a given per capita GDP"))         
                                )
                                )
                  
                                )
                                )

