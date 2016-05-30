# Credentials for the Github API consist of Client Id and Client Secret Id.

# Format of the credentials file :
# - First row: Client Id.
# - Second row : Client Secret Id.
credentials_file <- paste(data_directory, 'credentials.csv', sep = '')

# Check whether the key pair file exists.
if (!file.exists(credentials_file))
  stop('File containing the credentials does not exist.')

# Read the credentials from the file.
key_pair <- read.csv(credentials_file, header = F)$V1

# Authenticate and create github context.
interactive.login(key_pair[1], key_pair[2])

# Clean up.
rm(credentials_file, key_pair)
