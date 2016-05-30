# Credentials for the requester consist of AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.
# Credentials file can be downloaded from https://aws.amazon.com/.
# Do not change anything in the file or format of the rootkey.csv file.

rootkey_file <- paste(data_directory, 'rootkey.csv', sep = '')

# Check whether the key pair file exists.
if (file.exists(rootkey_file)) {
  key_pair <- read.csv(rootkey_file, header = F, sep = '=')
} else if (file.exists(paste(rootkey_file, '.txt', sep = ''))) {
  key_pair <- read.delim(paste(rootkey_file, '.txt', sep = ''), header = F, sep = '=' )
} else {
  stop('File containing credentials does not exist.')
}

# If yes, then initialize credentials from fetched values.
Sys.setenv(AWS_ACCESS_KEY_ID = key_pair$V2[1],
           AWS_SECRET_ACCESS_KEY = key_pair$V2[2])

# Enable sandbox testing environment.
options(MTurkR.sandbox = TRUE)

# Fetch the account balance.
balance <- AccountBalance()

# Check the account balance value from the list of fetched values.
if (as.numeric(balance$balance) <= 0)
  stop('Check out your key file or recharge your account.')

# Clean up.
rm(rootkey_file, key_pair, balance)
