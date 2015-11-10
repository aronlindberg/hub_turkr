
#main file consisiting of all the file to execute
#remove all the variable from the environment.
rm(list =ls()) 

script_list <- list("working_directory.R", "initialization.R", "credential.R", 
                    "qualification.R", "Bulk_HIT_Creation.R", "HIT_Status.R",
                     "Get_Assignment.R")

for (loop_variable in 1:length(script_list)){
  try(source(script_list[[loop_variable]]))
}