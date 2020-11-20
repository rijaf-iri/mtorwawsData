
#' Get aggregated data.
#'
#' Get aggregated data for multiple AWS.
#' 
#' @param timestep time step of the data, "hourly", "daily", "pentad", "dekadal" or "monthly"
#' @param start_time start time, format "YYYY-mm-dd HH:00"
#' @param end_time end time, format "YYYY-mm-dd HH:00"
#' @param aws_ids aws ids, a vector of aws id
#'                 Example: c("301", "306", "10050037", "000003")
#' @param url the URL of the server. Ex: "http://192.168.1.10:8080"
#' 
#' @return a list object
#' 
#' @export

awsGetDataAggregateIDs <- function(timestep, start_time, end_time, aws_ids, url){
    on.exit(curl::handle_reset(handle))

    data <- list(timestep = timestep, start_time = start_time,
                 end_time = end_time, aws_ids = aws_ids)
    data <- jsonlite::toJSON(data, auto_unbox = FALSE)

    handle <- curl::new_handle()
    curl::handle_setopt(handle, copypostfields = data)
    curl::handle_setheaders(handle, "Content-Type" = "application/json")

    url <- paste0(url, "/awsGetDataAggregateIDs")
    req <- curl::curl_fetch_memory(url, handle = handle)

    out <- jsonlite::fromJSON(rawToChar(req$content))
    class(out) <- append(class(out), "awsDataAggregate")
    return(out)
}

#' Get AWS minutes data.
#'
#' Get AWS variables for a list of AWS.
#' 
#' @param start_time start time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-08 13:00"
#' @param end_time end time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-10 21:55"
#' @param variables a vector of aws variables. Ex: c("RR", "TT", "PRES")
#' @param aws_ids aws IDs, a vector of aws ID. Ex: c("301", "306", "10050037", "000003")
#' @param url the URL of the server. Ex: "http://192.168.1.10:8080"
#' 
#' @return a list object
#' 
#' @export

awsGetDataMinVarsIDs <- function(start_time, end_time, variables, aws_ids, url){
    on.exit(curl::handle_reset(handle))

    data <- list(start_time = start_time, end_time = end_time,
                 variables = variables, aws_ids = aws_ids)
    data <- jsonlite::toJSON(data, auto_unbox = FALSE)

    handle <- curl::new_handle()
    curl::handle_setopt(handle, copypostfields = data)
    curl::handle_setheaders(handle, "Content-Type" = "application/json")

    url <- paste0(url, "/awsGetDataMinVarsIDs")
    req <- curl::curl_fetch_memory(url, handle = handle)

    out <- jsonlite::fromJSON(rawToChar(req$content))
    class(out) <- append(class(out), "awsDataMinVars")
    return(out)
}
