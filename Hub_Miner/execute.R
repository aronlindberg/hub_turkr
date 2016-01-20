setwd("C:/Users/Ricky/Desktop/Hub_Miner/")

required_packages <- c('github','roxygen2', 'plyr','httpuv','httr')

new_packages <- required_packages[!(required_packages %in% installed.packages()[,'Package'])]
if(length(new_packages)) install.packages(new_packages)
lapply(required_packages, library, character.only = TRUE)

if(required_packages == c('github'))
{
  install.packages("devtools")
  require(devtools)
  install_github("cscheid/rgithub")
}

library(github)
library(httpuv)
library(httr)