% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R, R/methods_row.R
\docType{methods}
\name{colSds}
\alias{colSds}
\alias{colSds,dgCMatrix-method}
\alias{rowSds}
\alias{rowSds,dgCMatrix-method}
\title{Standard deviation estimates for each row (column) in a matrix}
\usage{
colSds(x, rows = NULL, cols = NULL, na.rm = FALSE, ...)

\S4method{colSds}{dgCMatrix}(x, rows = NULL, cols = NULL,
  na.rm = FALSE, ...)

rowSds(x, rows = NULL, cols = NULL, na.rm = FALSE, ...)

\S4method{rowSds}{dgCMatrix}(x, rows = NULL, cols = NULL,
  na.rm = FALSE, ...)
}
\arguments{
\item{x}{A \code{\link[base]{numeric}} NxK \code{\link[base]{matrix}}.}

\item{rows}{A \code{\link[base]{vector}} indicating subset of rows
(and/or columns) to operate over. If \code{\link[base]{NULL}}, no subsetting
is done.}

\item{cols}{A \code{\link[base]{vector}} indicating subset of rows
(and/or columns) to operate over. If \code{\link[base]{NULL}}, no subsetting
is done.}

\item{na.rm}{If \code{\link[base:logical]{TRUE}}, \code{\link[base]{NA}}s
are excluded first, otherwise not.}

\item{...}{Additional arguments passed to \code{rowMeans()} and
\code{rowSums()}.}
}
\value{
Returns a \code{\link[base]{numeric}} \code{\link[base]{vector}} of
length N (K).
}
\description{
Standard deviation estimates for each row (column) in a matrix.
}
\seealso{
\code{\link[stats]{sd}}, \code{\link[stats]{mad}} and
\code{\link[stats:cor]{var}}.  \code{\link{rowIQRs}}().
}
