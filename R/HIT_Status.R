#Status of HIT.

ouput_directory <- paste(relative_path, "data/", sep = "")

HIT_File <- paste(ouput_directory, "HIT-status.csv", sep = "")
# getting Status detail of First HIT
HIT_Status <- HITStatus(hit = HITID_value[1]);

#Writing the HIT Status details into file
#col.names is kept true to fecth the column names 
write.table(HIT_Status, file = HIT_File, sep = ",", append = T, 
             col.names = T, row.names = F);


#creating a loop to fetch all the HIT Status through HIT Id.
#col.names is kept false becasue column name is fecthed previously.
for(loop_status in seq(2,length(HITID_value))){
  HIT_Status <- HITStatus(hit = HITID_value[loop_status])
  write.table(HIT_Status, file = HIT_File, sep = ",", append = T, 
              col.names = F, row.names= F)
}