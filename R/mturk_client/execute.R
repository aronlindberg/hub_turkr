# Logs in to AWS using the API keys found in 'data/mturk/rootkey.csv'
# and creates HITs based on the comments previously downloaded by the
# github_miner using the html template located at 'data/mturk/template.html.
# Qualifications are created based on the qualification_questions / answer_key
# XML files located in folder 'data/mturk/'. Status information for all the
# Created HITs is written to 'data/mturk/HIT-status.csv'. It can be
# rechecked by using the script 'get_HIT_status.R'. Results can be downloaded
# to 'data/mturk/HIT-results.csv' using the script 'get_HIT_results.R'.
# For these two scripts to work, the git_hit_type variable must be initialized
# (simply run the corresponding call in 'create_HITs.R while authenticated).
# Data file location to read comments from can be changed in 'create_HITs.R'.

# The only remaining variable after the execution of this script is
# 'HITID_value', containing the IDs of all the HITs that have been created
# and git_hit_type, containing the HITTypeId that can be used to query
# for all the comment coding HITs.

# Set up directory path variables.
relative_path <- '/mnt/'
working_directory <- paste(relative_path, 'R/mturk_client/', sep = '')
data_directory <- paste(relative_path, 'data/mturk/', sep = '')
setwd(working_directory)

# Error message title.
error_header <- 'Error Message'

# Create array of scripts to execute.
scripts <- list('requirements.R', 'authenticate.R', 'qualification.R',
                'create_HITs.R', 'get_HIT_status.R')

# Execute the scripts.
tryCatch({
  for (script in scripts)
    source(script)
}, error = function(err) {
  # Error handler picks up where the error was generated.
  error_msg <- rbind(error_header, paste('MY_ERROR:', err, 'in script', script))
})

# Clean up.
rm(relative_path, working_directory, data_directory, error_header, scripts, script)

if (exists('score_moder'))
  rm(score_moder)

if (exists('error_msg'))
  rm(error_msg)
