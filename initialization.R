working_directory<-getwd()
setwd(working_directory)

#install the required packages needed. MTurkR is used for Mechanical Turk. 
#data.table is used for row bind list function used later in the program

required_packages <- c('MTurkR','data.table')
new_packages <- required_packages[!(required_packages %in% installed.packages()[,'Package'])]
if(length(new_packages)) install.packages(new_packages)
lapply(required_packages, library, character.only = TRUE)

#use of packages which are installed 
library(MTurkR)
library(data.table)
#library("devtools")

#use of github package for one function(GenerateQualificationRequirement()) 
#install_github("leeper/MTurkR")

#sandox testing environment
options(MTurkR.sandbox = TRUE)


