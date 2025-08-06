# Leonardo C.J. Corvalan
# lcjcorvalan@gmail.com
# 05/08/2025

### plotando figuras com Chloroplot

#instal packages

install.packages("devtools")
library(devtools)

devtools::install_github("gschofl/reutils")
if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("gmbecker/genbankr")
devtools::install_github("shuyuzheng/Chloroplot",force = TRUE)


# load library

library(chloroplot)
citation(package= "chloroplot")
# how to use de packege https://github.com/shuyuzheng/Chloroplot

# Plot mitochondrion genome.
?PlotTab
# 1. Parsing the GenBank file
# "NC_012920.1" is the GenBank accession for Homo sapiens mitochondrion
t <- PlotTab(gbfile = "NC_012920.1")
# 2. Generate plot
PlotMitGenome(t) # The plot will be saved in a pdf file under your work directory.
PlotMitGenome(t, save = FALSE) # The plot will be shown in the "plot" panel if you are using Rstudio.


# run with local data
t <- PlotTab(gbfile = "Mfa.gb",T)

PlotMitGenome(t,file.type = "tiff", gc.per.gene = FALSE, genome.length = TRUE, organelle_type = FALSE, cu.bia = FALSE, gc.color = "#da7f0e", gc.background = "#ffbb69", info.background = "#ffe8ce", text.size = 1.2)

######### R version ######################################
# platform       x86_64-w64-mingw32               
# arch           x86_64                           
# os             mingw32                          
# crt            ucrt                             
# system         x86_64, mingw32                  
# status                                          
# major          4                                
# minor          4.1                              
# year           2024                             
# month          06                               
# day            14                               
# svn rev        86737                            
# language       R                                
# version.string R version 4.4.1 (2024-06-14 ucrt)
# nickname       Race for Your Life 
#######################################################################
