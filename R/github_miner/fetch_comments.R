# Format of the repository information file :
# - First row: Owner name.
# - Second row : Repository name.

repo_info_file <- paste(data_directory, 'repository_info.csv', sep = '')
issue_numbers_file <- paste(data_directory, 'issue_numbers.csv', sep = '')
output_file <- paste(data_directory, 'comments.csv', sep = '')

# Check whether the repository information file exists.
if (!file.exists(repo_info_file))
  stop('File containing the repository information does not exist.')

# Read the repository information file.
repo_info <- as.character(read.csv(repo_info_file, header = F)$V1)

# Create variables for the repository information.
owner <- repo_info[1]
repo <- repo_info[2]

# Check whether the issues numbers file exists.
# The file should contain one issue number per line.
if (!file.exists(issue_numbers_file))
  stop('File containing the issue numbers does not exist')

# Read the repository information file.
issue_numbers <- read.csv(issue_numbers_file, header = F)$V1

# Initialize comments data frame.
data_fetched <- data.frame('ID' = integer(), 'WEBLINK' = character(),
                           'COMMENT' = character(), stringsAsFactors = FALSE)

# Retrieve all comments for every issue listed in the file.
for (issue_number in issue_numbers) {
  tryCatch({
    # Retrieve the issue.
    issue <- get.repository.issue(owner, repo, number = issue_number, ctx = get.github.context())$content
    
    # Replace line breaks with html line break codes and remove tabs in the issue description.
    comment <- gsub('\r\n', '<br />', gsub('\t', ' ', issue$body))
    
    # Replace angle brackets with UTF-8 special character codes.
    comment <- gsub('>', '&gt;', gsub('<', '&lt;', comment))
    
    # Store the trimmed description.
    data_fetched[nrow(data_fetched) + 1, ] <- c(issue$number, issue$html_url, comment)
    
    # Determine the max number of 100-comments pages.
    max_page <- issue$comments / 100 + 1
    current_page <- 0
    
    # Retrieve and store comments page per page.
    while (current_page < max_page) {
      current_page <- current_page + 1
      comments <- get.issue.comments(owner, repo, number = issue$number,
                                     per_page = 100, page = current_page,
                                     ctx = get.github.context())$content
      
      # Process every retrieved comment.
      for (i in seq(1:length(comments))) {
        # Replace line breaks with html line break codes.
        comment <- gsub('\r\n', '<br />', gsub('\t', ' ', comments[[i]]$body))
        
        # Replace angle brackets with UTF-8 special characters.
        comment <- gsub('>', '&gt;', gsub('<', '&lt;', comment))
        
        # Store the comment in the comments data frame.
        data_fetched[nrow(data_fetched) + 1, ] <- c(issue$number, comments[[i]]$html_url, comment)
      }
    }
  }, error = function(err) {
    # Error handler picks up where the error was generated.
    error_msg <- rbind(error_header, paste('MY_ERROR:', err, 'for issue', issue_number))
  })
}

# Write the comments to a file.
write.csv(data_fetched, output_file, row.names = F)

# Clean up.
rm(repo_info_file, issue_numbers_file, repo_info, owner, repo, issue_numbers,
   data_fetched, issue_number, issue, comment, max_page, current_page, comments, i)

if (exists('error_msg'))
  rm(error_msg)
