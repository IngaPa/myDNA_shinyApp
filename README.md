# myDNA_shinyApp

Here are version 1.0 of Shiny App written for myDNA R package.

## Import file with genotypes
Minimal app allows you to import subset of your genome (I currently imported 10K rows ).


## Analysis
1) It overlaps your genome with GWAS Catalog.
2) It returns positions in your genome that overlap GWASCatalog entries, and provide additional information.

For example,


3) You can download the results of an overlap with GWAS Catalog as a .csv file.


## How-to-run
Currently, shiny app can be used only locally on your computer.

__Step 1__ Download and save ui.R and server.R scripts on your computer
__Step 2__ Open R and set the working directory to correspond to the folder where ui.R and server.R scripts are stored (absolute filepath) 
__Step 3__ Run shiny::runApp()


*For example, I runned following lines:

setwd("D:/Projects_Helping/myDNA/myDNAS/myDNA_shinyApp/myDNA_shinyApp/")
shiny::runApp()

