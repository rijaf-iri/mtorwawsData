
#' Get AWS Status data.
#'
#' Get AWS last 24 hour data availability.
#' 
#' @param url the URL of the server. Ex: "http://192.168.1.10:8080"
#' 
#' @return a list object
#' 
#' @export

aws24HourDataStatus <- function(url){
    url <- paste0(url, "/aws24HourDataStatus")
    req <- curl::curl_fetch_memory(url)

    out <- jsonlite::fromJSON(rawToChar(req$content))
    class(out) <- append(class(out), "awsDataStatus")
    return(out)
}

#' AWS data availability.
#'
#' Get AWS data availability for a list of AWS.
#' 
#' @param start_time start time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-08 13:00"
#' @param end_time end time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-10 21:55"
#' @param aws_ids aws IDs, a vector of aws ID. Ex: c("301", "306", "10050037", "000003")
#' @param url the URL of the server. Ex: "http://192.168.1.10:8080"
#' 
#' @return a list object
#' 
#' @export

awsDataAvailabilityIDs <- function(start_time, end_time, aws_ids, url){
    on.exit(curl::handle_reset(handle))

    data <- list(start_time = start_time, end_time = end_time, aws_ids = aws_ids)
    data <- jsonlite::toJSON(data)

    handle <- curl::new_handle()
    curl::handle_setopt(handle, copypostfields = data)
    curl::handle_setheaders(handle, "Content-Type" = "application/json")

    url <- paste0(url, "/awsDataAvailabilityIDs")
    req <- curl::curl_fetch_memory(url, handle = handle)

    out <- jsonlite::fromJSON(rawToChar(req$content))
    class(out) <- append(class(out), "awsDataAvailabilityByID")
    return(out)
}

#' AWS data availability.
#'
#' Get AWS data availability for one AWS network.
#' 
#' @param start_time start time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-08 13:00"
#' @param end_time end time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-10 21:55"
#' @param aws_net aws network, 'LSI-XLOG', 'LSI-ELOG' or 'REMA'
#' @param url the URL of the server. Ex: "http://192.168.1.10:8080"
#' 
#' @return a list object
#' 
#' @export

awsDataAvailabilityNet <- function(start_time, end_time, aws_net, url){
    url <- paste0(url, "/awsDataAvailabilityNet")
    url <- urltools::param_set(url, key = "start_time", value = start_time)
    url <- urltools::param_set(url, key = "end_time", value = end_time)
    url <- urltools::param_set(url, key = "aws_net", value = aws_net)
    url <- utils::URLencode(url)
    req <- curl::curl_fetch_memory(url)

    out <- jsonlite::fromJSON(rawToChar(req$content))
    class(out) <- append(class(out), "awsDataAvailabilityByID")
    return(out)
}

#' AWS data availability.
#'
#' Get AWS data availability for all networks 'LSI-XLOG', 'LSI-ELOG' and 'REMA'.
#' 
#' @param start_time start time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-08 13:00"
#' @param end_time end time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-10 21:55"
#' @param url the URL of the server. Ex: "http://192.168.1.10:8080"
#' 
#' @return a list object
#' 
#' @export

awsDataAvailabilityAll <- function(start_time, end_time, url){
    url <- paste0(url, "/awsDataAvailabilityAll")
    url <- urltools::param_set(url, key = "start_time", value = start_time)
    url <- urltools::param_set(url, key = "end_time", value = end_time)
    url <- utils::URLencode(url)
    req <- curl::curl_fetch_memory(url)

    out <- jsonlite::fromJSON(rawToChar(req$content))
    class(out) <- append(class(out), "awsDataAvailabilityByNET")
    return(out)
}
