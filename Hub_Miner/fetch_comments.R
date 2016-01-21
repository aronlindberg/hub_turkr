owner = "rubinius"
repo = "rubinius"
message <- "Error Message"

# fetching issue numbers from the file
issues_number <- read.csv("issue_number.csv", header = F)
issues <- issues_number$V1

data_fetched <- data.frame(  "ID" = integer(), "WEBLINK" = character(),"COMMENTS" = character(),stringsAsFactors=FALSE)
for (issues_no in issues){
  tryCatch({
    first_comment <- get.repository.issues(owner, repo,issue.number = issues_no,ctx = get.github.context())
    count_comments<-as.numeric(first_comment$content$comments)
    if((count_comments <= 100)){
      data_fetched[nrow(data_fetched) + 1, ] <- c( issues_no,first_comment$content$html_url,gsub("[\r\n\t]"," ",first_comment$content$body))
      other_comment<- get.all.repository.issues.comments(owner, repo,issue.number = issues_no, ctx = get.github.context(), per_page=100)
      for (w in seq(1:count_comments)){
        data_fetched[nrow(data_fetched) + 1, ] <- c( issues_no,other_comment$content[[w]]$html_url,gsub("[\r\n\t]"," ",other_comment$content[[w]]$body))
      }
    }else if(count_comments > 100){
      no_pages<- count_comments/100
      remain_count <- count_comments%%100
      for (q in seq(1:no_pages)){
        other_comment<- get.all.repository.issues.comments(owner, repo,issue.number = issues_no, ctx = get.github.context(), per_page=100, page=q)
        for (r in seq(1:100)){
          data_fetched[nrow(data_fetched) + 1, ] <- c( issues_no,other_comment$content[[r]]$html_url,gsub("[\r\n\t]"," ",other_comment$content[[r]]$body))
        }
      }
      other_comment<- get.all.repository.issues.comments(owner, repo,issue.number = issues_no, ctx = get.github.context(), per_page=100, page=(q+1))
      for (e in seq(1:remain_count)){
        data_fetched[nrow(data_fetched) + 1, ] <- c( issues_no,other_comment$content[[e]]$html_url,gsub("[\r\n\t]"," ",other_comment$content[[e]]$body))
      }
    }
  }, error = function(err) {
    # error handler picks up where error was generated
    error_message <-paste("MY_ERROR:  ",err,"for id",issues_no)
    message <- rbind(message, error_message)
  }) 
}

write.csv(data_fetched,"comments_final.csv",row.names = F)

