# BulkCreateFromTemplate. Template is the html file in data directory.

input_file <- paste(data_directory, '../github/comments.csv', sep = '')
template_file <- paste(data_directory, 'template.html', sep = '')

# Parameters used are:
# title is the name of the HIT which is seen by workers.
# description is the description of the HIT.
# reward is the payment worker gets on completing the HIT.
# duration is the time in which workers have to complete the assignment.
# keywords are words to define and categorize the HIT.
# auto.approval.delay is the period after which a HIT completion is automatically validated.
# qual.req is the required qualification for taking the HIT.

# template is the html template file for the HIT.
# input is the file containing the different questions.
# expiration is the period after which the HIT gets expired.
# annotation is the description of the HIT not seen by workers.

# Check whether the required files exist.
if (!(file.exists(input_file) && file.exists(template_file)))
  stop('File containing the template or the input values does not exist.')

# Read the input file
input_values <- read.csv(input_file, header = T);

# Create or retrieve the HIT type.
git_hit_type <- RegisterHITType(title = 'Categorize comments',
                                description = 'Categorize comments',
                                reward = '.05',
                                duration = seconds(minutes = 5),
                                keywords = 'categorization, coding, moderation, category',
                                auto.approval.delay = seconds(days = 1),
                                qual.req = score_moder)

# Create the HITs and store their data.
created_hits <- BulkCreateFromTemplate(hit.type = git_hit_type$HITTypeId,
                                       template = template_file,
                                       input = input_values,
                                       expiration = seconds(days = 4),
                                       annotation = paste('Comment coding project', Sys.Date()))

# HITIDs of created HITs.
HITID_value <- rbindlist(created_hits)$HITId

# Clean up.
rm(input_file, template_file, input_values, created_hits)
