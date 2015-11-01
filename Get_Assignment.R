#Get Assignment Results.
<<<<<<< HEAD
 
=======

>>>>>>> fa807a15928ebdd53a3feb9f8b4f80196a0ea7eb
# getting assignments detail of First HIT
review = GetAssignments(hit=template_Value_HITID[1], return.all=T);

#Writing the assignment details into file
#col.names is kept true to fecth the column names 
write.table(review, file = "GetAssignments.csv", sep = ",", append = T, 
            col.names = T, row.names = F);

#creating a loop to fetch all the assignments through HIT Id.
#col.names is kept false becasue column name is fecthed previously.
for(loop_getAssignment in seq(2,length(template_Value_HITID))){
  review = GetAssignments(hit=template_Value_HITID[loop_getAssignment], return.all=T)
  write.table(review, file = "GetAssignments.csv", sep = ",", append = T, 
              col.names = F, row.names = F);
}