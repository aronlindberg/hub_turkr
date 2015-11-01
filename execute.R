<<<<<<< HEAD
#main file consisiting of all the file to execute
#remove all the variable from the environment.
rm(list =ls()) 
=======

#remove all the variable from the environment.
#rm(list =ls()) 
>>>>>>> fa807a15928ebdd53a3feb9f8b4f80196a0ea7eb

script_list <- list("initialization.R","credential.R","qualification.R",
                    "Bulk_HIT_Creation.R","HIT_Status.R","Get_Assignment.R")

for (i in 1:length(script_list)){
  try(source(script_list[[i]]))
}