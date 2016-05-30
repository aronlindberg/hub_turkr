# Get HIT status.

status_file <- paste(data_directory, 'HIT-status.csv', sep = '')

# Getting status details of HITs.
HIT_status <- HITStatus(hit.type = git_hit_type$HITTypeId)
appending <- file.exists(status_file)

# Writing the HIT status details to a file.
# If the file is created, col.names is set to true to add column names.
write.table(HIT_status, file = status_file, append = appending, 
            sep = ',', col.names = !appending, row.names = F)

# Clean up.
rm(status_file, HIT_status, appending)
