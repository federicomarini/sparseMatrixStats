% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R, R/methods_row.R
\docType{methods}
\name{colAnyNAs}
\alias{colAnyNAs}
\alias{colAnyNAs,dgCMatrix-method}
\alias{rowAnyNAs}
\alias{rowAnyNAs,dgCMatrix-method}
\title{Checks if there are any missing values in an object or not}
\usage{
colAnyNAs(x, rows = NULL, cols = NULL, ...)

\S4method{colAnyNAs}{dgCMatrix}(x, rows = NULL, cols = NULL, ...)

rowAnyNAs(x, rows = NULL, cols = NULL, ...)

\S4method{rowAnyNAs}{dgCMatrix}(x, rows = NULL, cols = NULL, ...)
}
\arguments{
\item{x}{A \code{\link[base]{vector}}, a \code{\link[base]{list}}, a
\code{\link[base]{matrix}}, a \code{\link[base]{data.frame}}, or
\code{\link[base]{NULL}}.}

\item{rows}{A \code{\link[base]{vector}} indicating subset of
elements (or rows and/or columns) to operate over. If
\code{\link[base]{NULL}}, no subsetting is done.}

\item{cols}{A \code{\link[base]{vector}} indicating subset of
elements (or rows and/or columns) to operate over. If
\code{\link[base]{NULL}}, no subsetting is done.}

\item{...}{Not used.}
}
\value{
Returns \code{\link[base:logical]{TRUE}} if a missing value was
detected, otherwise \code{\link[base:logical]{FALSE}}.
}
\description{
Checks if there are any missing values in an object or not.
\emph{Please use \code{base::anyNA()} instead of \code{anyMissing()},
\code{colAnyNAs()} instead of \code{colAnyMissings()}, and
\code{rowAnyNAs()} instead of \code{rowAnyMissings()}.}
}
\details{
The implementation of this method is optimized for both speed and memory.
The method will return \code{\link[base:logical]{TRUE}} as soon as a missing
value is detected.
}
\examples{
  mat <- matrix(0, nrow=10, ncol=5)
  mat[sample(seq_len(5 *10), 5)] <- NA
  sp_mat <- as(mat, "dgCMatrix")
  colAnyNAs(sp_mat)

}
\seealso{
Starting with R v3.1.0, there is \code{anyNA()} in the \pkg{base},
which provides the same functionality as \code{anyMissing()}.
}
