# Install and/or load the required packages. MTurkR is used for Mechanical Turk. 
# data.table is used for row bind list function used later in the program.

required_packages <- c('MTurkR', 'data.table')
new_packages <- required_packages[!(required_packages %in% installed.packages()[, 'Package'])]

# Install the required packages.
if (length(new_packages))
  install.packages(new_packages)

# Load the packages.
lapply(required_packages, library, character.only = TRUE)

## Legacy, is this still required?
#library("devtools")
# Use of github package for one function: GenerateQualificationRequirement()
#install_github("leeper/MTurkR")

# Clean up.
rm(required_packages, new_packages)
