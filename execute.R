
#remove all the variable from the environment.
#rm(list =ls()) 

script_list <- list("initialization.R","credential.R","qualification.R",
                    "Bulk_HIT_Creation.R","HIT_Status.R","Get_Assignment.R")

for (i in 1:length(script_list)){
  try(source(script_list[[i]]))
}