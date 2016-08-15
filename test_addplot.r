xlsx.addPlot<-function( wb, sheet, plotFunction, startRow=NULL,startCol=2,
               width=480, height=480,... ) {
  library("xlsx")
  png(filename = "plot.png", width = width, height = height,...)
  plotFunction()
  dev.off() 
  #Append plot to the sheet
  if(is.null(startRow)){
    rows<- getRows(sheet) #list of row object
    startRow=length(rows)+1
  } 
  # Add the file created previously
  addPicture("plot.png", sheet=sheet,  startRow = startRow, startColumn = startCol) 
  xlsx.addLineBreak(sheet, round(width/20)+1)
  res<-file.remove("plot.png")
}
