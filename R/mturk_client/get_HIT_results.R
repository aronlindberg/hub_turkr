# Get assignment results and writes them to results_file.

results_file <- paste(data_directory, 'HIT-results.csv', sep = '')

# Getting assignment details of HITs.
review <- GetAssignments(hit.type = git_hit_type$HITTypeId, return.all = T)
appending <- file.exists(results_file)

# Writing the assignment details to a file.
# If the file is created, col.names is set to true to add column names.
write.table(review, file = results_file, append = appending, 
            sep = ',', col.names = !appending, row.names = F)

# Clean up.
rm(results_file, review, appending)
