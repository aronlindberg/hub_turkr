#Status of HIT.

# getting Status detail of First HIT
HIT_Status<-HITStatus(hit=template_Value_HITID[1]);

#Writing the HIT Status details into file
#col.names is kept true to fecth the column names 
write.table(HIT_Status, file = "HIT_Status.csv", sep = ",", append = T, 
             col.names = T, row.names = F);


#creating a loop to fetch all the HIT Status through HIT Id.
#col.names is kept false becasue column name is fecthed previously.
for(loop_status in seq(2,length(template_Value_HITID))){
  HIT_Status<-HITStatus(hit=template_Value_HITID[loop_status])
  write.table(HIT_Status, file = "HIT_Status.csv", sep = ",", append = T, 
              col.names = F, row.names = F)
}