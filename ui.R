
library(data.table)

library(shiny)

quipus <- fread("quipus_matrix.csv")


tabsetPanel(type = "tabs",
            tabPanel("About our project",
            
            
            mainPanel(
              h2("CAN ARTIFICIAL INTELLIGENCE HELP US TO DECIPHER THE QUIPUS? "),
              br(),
              h3("Context"),
              br(),
              h4("The quipus were information storage instruments consisting of wool or cotton ropes of various colors, 
              provided with knots, used by Andean and coastal civilizations in Peruvian and Ecuadorian territories mainly. 
              Although it is known that it was used as an accounting and storage system for epic stories of the deceased Incas,
              certain authors have proposed that it could also have been used as a graphic writing system. These instruments were
              in the possession of quipucamayoc specialists, who were the only ones trained to decipher these enigmatic tools and
              authorized to enunciate their content. (Wikipedia, 2021)"),
              br(),
              img(src='poma.jpg', align = "right"),
              br(),
              h4("Due to the material with which the quipus were made, it is hypothesized that most have not survived in time. 
              Thus, today we only have about 700 individuals, most of whom are protected with the highest security in private collections 
              around the world. This condition makes the study of quipus by specialists almost impossible.
              In this context, Professor Gary Urton from Harvard University coordinated the visit and data collection of the discovered
                 quipus. These could be freely downloaded for his study until 2020, when Professor Urton had problems with his reputation 
                 and decided to hide the base. Incidentally, due to its cultural value and from the point of view of Data Science, it is one 
                 of the most beautiful bases that exists, being its processing complexity really high."),
              br(),
              h4("Each Quipu has its own base, formed by a main table where the information on the mother string and the location of the secondary
                 strings are stored. A second table stores information about the characteristics of each secondary string and of sub-secondary 
                 strings if they exist. finally, a third table stores information on other observed details."),
              br(),
              h3("Reconstruction and Visualization"),
              br(),
              h4("The code includes an intensive engineering that tries to read every detail of the mother ropes, the secondary ropes and the 
              knots and converts them into a two-dimensional matrix, from which images are obtained, from which a visualizer was created in Shiny. 
              This was reviewed by Dr. Clindaniel, who rated it as an excellent tool. Since 2019, and due to lack of resources,
              he is in charge of its study and improvements."),
              br(),
              br(),
              
              img(src='shiny1.png', align = "center"),
           
              br(),
              br(),
              br(),
              h3("Can Artificial Intelligence help us to decipher the Quipus?"),
              br(),
              h3("Hypothesis raised and next steps "),
              br(),
              h4("It is known that 14% of the quipus have been discovered in Pachakamac, a pre-Inca and Inca administrative and religious center. 
              Having the matrices completed in detail, it is hypothesized that an image recognition deep learning model with a binary target variable, 
              where 1 = Pachakamac, and 0 = No Pachakamac, has the ability to recognize with an accepted probability quipus of Pachakamac from the 
              Test data set, and can also tell us which set of details of the object indicates the word Pachakamac. In this way we would have the first
              non-numerical decipherment with certainty."),
              br(),
              h4("If you are interested in collaborating with this work, which could have an incalculable cultural and historical impact, 
                 please do not hesitate to contact me. "),
              br(),
              br(),
              h5("Source in spanish: https://www.cienciascondatos.com/2021/06/16/podremos-usar-ia-para-descifrar-los-quipus/")
              
              
            )
            ),
                     
            tabPanel("Quipus Viewer",
  
bootstrapPage(
  
  
  selectInput("sel_quipus", "Select a Quipu", choices = unique(quipus$ID), width = NULL, size = NULL, selected = "UR001"),
  
  column(2, numericInput("corte1A", "Cut 1 A", value = 0, min = 0, max = NA, step = NA,
               width = 120)),
  
  column(2, numericInput("corte1B", "Cut 1 B", value = 0, min = 0, max = NA, step = NA,
                         width = 120)),
  
  column(2, numericInput("corte2A", "Cut 2 A", value = 0, min = 0, max = NA, step = NA,
                         width = 120)),
  
  column(2, numericInput("corte2B", "Cut 2 B", value = 0, min = 0, max = NA, step = NA,
                         width = 120)),
  
  column(2, numericInput("corte3A", "Cut 3 A", value = 0, min = 0, max = NA, step = NA,
                         width = 120)),
  
  column(2, numericInput("corte3B", "Cut 3 B", value = 0, min = 0, max = NA, step = NA,
                         width = 120)),

  
  plotOutput(outputId = "quipu", height = "600px"),
  
  h5("."),
  h5("."),
  h5("."),
  h5("This quipu has the following colors and knots:"),
  
  verbatimTextOutput("colores"),
  
  column(2, numericInput("simbolo", "Simbol:", 19, min = 1, max = 100)),
  column(2, sliderInput("tam_simbolo", "Symbol Size :", width = 100,  1, min = 1, max = 5, value = 1)),
  
  column(2, sliderInput("nudo", "Knot size:", 1, min = 1, max = 10, step = 0.1)),
  column(2, sliderInput("font", "Knot Font:", 1, min = 1, max = 10, step = 1)),
  
  plotOutput(outputId = "quipu_zoom", height = "700px")
  
  
  
)



)
)



#####################################################################################################################
###### End of the server.R###########################################################################################
#####################################################################################################################


###MIT License

### Copyright (c) 2019 Roberto Ruiz Icochea 

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.


##############################################################################################################
############################################################################################################