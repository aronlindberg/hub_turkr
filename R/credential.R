#credential use for the requester consist of AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
#https://aws.amazon.com/
#checking whether the key pair file exists or not. if yes, then login to the AWS Mechanical Turk.

#checking for the rootkey file having credentials in it.
#do not change anything in the file or format of the file

if (file.exists("rootkey.csv")) {
  key_pair <- read.csv("rootkey.csv", header = F, sep = "=")
} else if (file.exists("rootkey.csv.txt")){
  key_pair <- read.delim( "rootkey.csv.txt", header = F, sep="=" )
} else{
  print("File consisting of credentials does not exist")
}

#converting the values fetched from dataframe into vetor form  
AWSAccessKeyId <- as.vector(key_pair$V2[1])
AWSSecretKey <- as.vector(key_pair$V2[2])

#initializing credentials
credentials( keypair=c(AWSAccessKeyId, AWSSecretKey))

#checking the balance for the account
balance <- AccountBalance()

while (balance$balance == "0"){
  print("Check out your key file or Recharge your Account")
}


