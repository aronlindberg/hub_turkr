#Pre-Qualification of Workers.

ouput_directory <- paste(relative_path, "data/", sep = "")
Question_File <- paste(ouput_directory, "Questions.xml", sep = "")
answer_File <- paste(ouput_directory, "AnswerKey.xml", sep = "")

# Load the XML files
QuestionForm <- paste(readLines(Question_File), collapse='')
AnswerKey <- paste(readLines(answer_File), collapse='')


# Created the QualificationType
newqual <- CreateQualificationType(name="Qualification",
                                   description="A qualification for our HITs",
                                   status="Active", test.duration=seconds(hours=1),
                                   test=QuestionForm, answerkey = AnswerKey)

score_moder <- GenerateQualificationRequirement(newqual$QualificationTypeId,">=","50") 
