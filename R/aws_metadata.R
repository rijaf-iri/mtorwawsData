
#' Get AWS metadata.
#'
#' Get AWS metadata.
#' 
#' @param url the URL of the server. Ex: "http://192.168.1.10:8080"
#' 
#' @return a list object
#' 
#' @export

awsGetMetadata <- function(url){
    url <- paste0(url, "/awsGetMetadata")
    req <- curl::curl_fetch_memory(url)

    if(req$status_code != 200){
        cat("An error has occurred\n")
        return(rawToChar(req$content))
    }

    out <- jsonlite::fromJSON(rawToChar(req$content))
    class(out) <- append(class(out), "awsMetaData")
    return(out)
}
