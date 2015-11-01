#credential use for the requester consist of AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
<<<<<<< HEAD
#interactive code
=======
>>>>>>> fa807a15928ebdd53a3feb9f8b4f80196a0ea7eb
#https://aws.amazon.com/
AWS_ACCESS_KEY_ID <- readline("Enter your AWS_ACCESS_KEY_ID:")
AWS_SECRET_ACCESS_KEY <- readline("Enter your AWS_SECRET_ACCESS_KEY:")
credentials(keypair=c(AWS_ACCESS_KEY_ID,AWS_SECRET_ACCESS_KEY))

#checking the balance for the account
AccountBalance()
