#Get Assignment Results.

Assignments_File <- paste(ouput_directory, "Get-Assignments.csv", sep = "")

# getting assignments detail of First HIT
review = GetAssignments(hit = HITID_value[1], return.all = T);

#Writing the assignment details into file
#col.names is kept true to fecth the column names 
write.table(review, file = Assignments_File, sep = ",", append = T, 
            col.names = T, row.names = F);

#creating a loop to fetch all the assignments through HIT Id.
#col.names is kept false becasue column name is fecthed previously.
for(loop_getAssignment in seq(2,length(HITID_value))){
  review = GetAssignments(hit = HITID_value[loop_getAssignment], return.all = T)
  write.table(review, file = Assignments_File, sep = ",", append = T, 
              col.names = F, row.names = F);
}