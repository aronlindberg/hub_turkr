
#Setting Qualification Type for the workers.

qualReqs = paste(
  # Set Location to US New Jersey only
  GenerateQualificationRequirement("Locale","==","US"),
   sep="" )