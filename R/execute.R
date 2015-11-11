
# main file consisiting of all the file to execute
# remove all the variable from the environment

# Note that for this to work your working directory has to be stored in `working_directory.R` in the following format:
# relative_path <- "~/Users/git/hub_turkr/"
# working_directory <- paste(relative_path, "R/", sep = "")
# setwd(working_directory)

# credentials from AWS in `credential.R`
#keep the rootkey file extracted from Amazon Web service in R folder. 


rm(list =ls()) 

script_list <- list("working_directory.R", "initialization.R", "credential.R", 
                    "qualification.R", "Bulk_HIT_Creation.R", "HIT_Status.R",
                     "Get_Assignment.R")

for (loop_variable in 1:length(script_list)){
  try(source(script_list[[loop_variable]]))
}
