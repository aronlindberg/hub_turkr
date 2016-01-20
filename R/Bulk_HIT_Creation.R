#BulkCreateFromTemplate. template is html file in directory

data_directory <- paste(relative_path, "data/", sep = "")

input_File <- paste(data_directory, "input.csv", sep = "")

template_File <- paste(data_directory, "template.html", sep = "")

#Parameters used are: 
#hitlayoutid sepcifying the layout id number of the project created in sandbox.
#annotation is the name of the HIT not seen by worker
#assignments created in the HIT
#title is the name of the HIT which is seen by workers
#description description of the HIT
#reward is the payment worker gets on completing HIT
#duration is time in which worker has to compelete the assignment.
#expiration is the period after which HIT gets expired
#keywords is words to define HIT
#auto.approval.delay is period to approve the HIT
#qual.req is qualification for taking the HIT


variable_bulkTemplate <- read_file<- read.csv(input_File, header = T);
template_Value<-BulkCreateFromTemplate(template = template_File,
                                       input = variable_bulkTemplate,
                                       annotation = paste("Bulk From Template", Sys.Date()),
                                       title = paste("Categorize comments", Sys.Date(), Sys.time()),
                                       description = "Categorize comments",
                                       reward = ".05",
                                       expiration = seconds(days = 4),
                                       duration = seconds(minutes = 5),
                                       auto.approval.delay = seconds(days = 1),
                                       keywords = "categorization, image, moderation, category",
                                       qual.req=score_moder)

#HITID of Bulk Template
HITID_value <- (rbindlist(template_Value)$HITId)
#HITTypeID of Bulk Template
HITTypeID_value <- (rbindlist(template_Value)$HITTypeId)
