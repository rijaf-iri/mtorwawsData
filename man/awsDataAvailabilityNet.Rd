% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aws_data_availability.R
\name{awsDataAvailabilityNet}
\alias{awsDataAvailabilityNet}
\title{AWS data availability.}
\usage{
awsDataAvailabilityNet(start_time, end_time, aws_net, url)
}
\arguments{
\item{start_time}{start time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-08 13:00"}

\item{end_time}{end time, format "YYYY-mm-dd HH:MM". Ex: "2020-11-10 21:55"}

\item{aws_net}{aws network, 'LSI-XLOG', 'LSI-ELOG' or 'REMA'}

\item{url}{the URL of the server. Ex: "http://192.168.1.10:8080"}
}
\value{
a list object
}
\description{
Get AWS data availability for one AWS network.
}
