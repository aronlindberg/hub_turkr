# Logs in to Github using the API keys found in 'data/github/credentials.csv'
# and fetches, from the github repository described in
# 'data/github/repository_info.csv', all comments on issues whose numbers are
# located in 'data/github/issue_numbers.csv' and writes them to
# 'data/github/comments.csv'

# The only remaining variable after the execution of this script
# is 'output_file', containing the path to the csv file to which
# the retrieved comments were written.

# Setting up directory path variables.
relative_path <- '/mnt/'
working_directory <- paste(relative_path, 'R/github_miner/', sep = '')
data_directory <- paste(relative_path, 'data/github/', sep = '')
setwd(working_directory)

# Error message title.
error_header <- 'Error Message'

# Create array of scripts to execute.
scripts <- list('requirements.R', 'github/github.R', 'github/issues.R',
                'authenticate.R', 'fetch_comments.R')

# Execute the scripts.
tryCatch({
  for (script in scripts)
    source(script)
}, error = function(err) {
  # Error handler picks up where the error was generated.
  error_msg <- rbind(error_header, paste('MY_ERROR:', err, 'in script', script))
})

2
# Answer to the interactive.login prompt in 'authenticate.R':
# Do not cache credentials (This script will be executed again anyway).

# I HAVE NO IDEA WHY THIS ABOVE LINE WORKS. Inserting '2' in the
# 'authenticate.R' script would not work, but for some reason not
# only does it work here, but the script RESUMES execution back,
# AND onto the next script. This... Should not be.
# I'll be having nightmares from now on.

# Clean up.
rm(relative_path, working_directory, data_directory, error_header, scripts, script)

if (exists('error_msg'))
  rm(error_msg)
