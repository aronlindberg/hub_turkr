# Qualification of Workers.

# Look for a pre-existing qualification.
git_qualification_type <- SearchQualificationTypes(query = 'Git knowledge')

if (length(git_qualification_type) && git_qualification_type[1, ]$Name == 'Git knowledge') {
  gitqual <- git_qualification_type[1, ]
} else {
  # If no suiting qualification exists, create a new one.
  
  question_file <- paste(data_directory, 'qualification_questions.xml', sep = '')
  answer_file <- paste(data_directory, 'answer_key.xml', sep = '')
  
  # Load the XML files.
  question_form <- paste(readLines(question_file), collapse = '')
  answer_key <- paste(readLines(answer_file), collapse = '')
  
  # Create the QualificationType.
  gitqual <- CreateQualificationType(name = 'Git knowledge',
                                     description = 'A qualification for our HITs',
                                     status = 'Active', test.duration = seconds(hours = 1),
                                     test = QuestionForm, answerkey = AnswerKey)
}

# Create Qualification requirement (Location is set to US only).
score_moder <- GenerateQualificationRequirement(c(gitqual$QualificationTypeId, 'Locale'), c('>=', '=='), c('50', 'US')) 

# Clean up.
rm(git_qualification_type, gitqual)

if (exists('question_file'))
  rm(question_file, answer_file, question_form, answer_key)
