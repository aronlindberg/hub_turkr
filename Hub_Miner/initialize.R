#credential use for the requester consist of Client Id and Client Secret Id.
#https://aws.amazon.com/
#checking whether the key pair file exists or not.

#checking for the keys file having credentials in it.
# format of the file :
# first row: Client Id
#Second Row : Client Secret Id

if (file.exists("key.csv")) {
  key_pair <- read.csv("key.csv", header = F)
} else{
  print("File consisting of credentials does not exist")
}

#converting the values fetched from dataframe into vetor form  
ClientId <- as.vector(key_pair$V1[1])
ClientSecretId <- as.vector(key_pair$V1[2])

#initializing credentials
ctx = interactive.login(ClientId, ClientSecretId)

