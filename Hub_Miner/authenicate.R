# autheniticating the USER 

oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = ClientId,
                   secret = ClientSecretId)
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)
req$url
req$status_code
splitted_str<-strsplit(req$url,"=")[[1]]
splitted_str[2]
create.github.context(api_url = "https://api.github.com", client_id = ClientId,
                      client_secret = ClientSecretId, 
                      access_token = splitted_str[2], 
                      max_etags = 10000, verbose = FALSE)