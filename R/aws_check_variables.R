
#' AWS data availability.
#'
#' Get AWS data availability for a list of AWS.
#' 
#' @param start_time start time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-08 13:00"
#' @param end_time end time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-10 21:55"
#' @param aws_ids aws IDs, a vector of aws ID. Ex: c("301", "306", "10050037", "000003")
#' @param variables a vector of aws variables. Ex: c("RR", "TT", "PRES")
#' @param url the URL of the server. Ex: "http://192.168.1.10:8080"
#' 
#' @return a list object
#' 
#' @export

awsCheckVariablesIDs <- function(start_time, end_time, aws_ids, variables, url){
    on.exit(curl::handle_reset(handle))

    data <- list(start_time = start_time, end_time = end_time,
                 aws_ids = aws_ids, variables = variables)
    data <- jsonlite::toJSON(data, auto_unbox = FALSE)

    handle <- curl::new_handle()
    curl::handle_setopt(handle, copypostfields = data)
    curl::handle_setheaders(handle, "Content-Type" = "application/json")

    url <- paste0(url, "/awsCheckVariablesIDs")
    req <- curl::curl_fetch_memory(url, handle = handle)

    out <- jsonlite::fromJSON(rawToChar(req$content))
    class(out) <- append(class(out), "awsCheckVariables")
    return(out)
}
