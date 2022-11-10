library(data.table)
library(DT)
library(shiny)
library(dplyr)

quipus <- fread("quipus_matrix.csv")
nudos <- fread("nudos.csv")

quipus <- left_join(quipus, nudos)


shinyServer(function(input, output) {
   
  output$quipu<- renderPlot({
    
    quipu <- subset(quipus, quipus$ID == input$sel_quipus)
    
   plot_quipu_entero <- function(x,y,z){
    plot(x, y, col = as.factor(z), xlab = "Position (cm)", ylab = "Length (cm)", pch =16, cex =0.6, ylim = c(max(y), min(y))) 
    abline(h = -1, col = "saddlebrown", lwd = 14.25)
    abline(v = input$corte1A, col = "black", lwd=8, lty = 4)
    abline(v = input$corte1B, col = "black", lwd =8, lty =4)
    abline(v = input$corte2A, col = "black", lwd=8, lty = 5)
    abline(v = input$corte2B, col = "black", lwd =8, lty = 5)
    abline(v = input$corte3A, col = "black", lwd=8, lty = 6)
    abline(v = input$corte3B, col = "black", lwd =8, lty = 6)
    #abline(v = input$corte4[1], col = "black", lwd=8, lty = 3)
    #abline(v = input$corte4[2], col = "black", lwd =8, lty = 3)
    
   }
   
   plot_quipu_entero(quipu$lugar, quipu$posi, as.character(quipu$color)) 
   
  })
  
  output$quipu_zoom<- renderPlot({
    
    quipu <- subset(quipus, quipus$ID == input$sel_quipus)
    
    
    plot_quipu_zoom <- function(x,y,z){
      
      par(mfrow = c(1,3))
      plot(x, y, col = z, xlab = "Position (cm)", ylab = "Length (cm)", pch =input$simbolo, cex = input$tam_simbolo, xlim = c(input$corte1A, input$corte1B), main = "Cut 1", ylim = c(max(quipu$posi), min(quipu$posi))) 
      abline(h = -1.85, col = "saddlebrown", lwd = 65)
     text(quipu$lugar, quipu$posi, labels = quipu$nudo, adj=0.5, srt = 90, cex = input$nudo, font = input$font)
      
      plot(x, y, col = as.factor(z), xlab = "Position (cm)", ylab = "Length (cm)", pch =input$simbolo, cex = input$tam_simbolo, xlim = c(input$corte2A, input$corte2B), main = "Cut 2", ylim = c(max(quipu$posi), min(quipu$posi)))
      abline(h = -1.85, col = "saddlebrown", lwd = 65)
      text(quipu$lugar, quipu$posi, labels = quipu$nudo, adj=0.5, srt = 90, cex = 1.25, font = input$font)
      
      plot(x, y, col = as.factor(z), xlab = "Position (cm)", ylab = "Length (cm)", pch =input$simbolo, cex = input$tam_simbolo, xlim = c(input$corte3A, input$corte3B), main = "Cut 3", ylim = c(max(quipu$posi), min(quipu$posi)))
      abline(h = -1.85, col = "saddlebrown", lwd = 65)
      text(quipu$lugar, quipu$posi, labels = quipu$nudo, adj=0.5, srt = 90, cex = 1.25, font = input$font)
      
      
      }
    
    plot_quipu_zoom(quipu$lugar, quipu$posi, quipu$color) 
    
  })
  
  output$colores <- renderText({
    
    quipu <- subset(quipus, quipus$ID == input$sel_quipus)
    paste(unique(quipu$valor))

    
  })
  
 
  
})


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
