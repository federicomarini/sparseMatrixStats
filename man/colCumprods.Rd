% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R, R/methods_row.R
\docType{methods}
\name{colCumprods}
\alias{colCumprods}
\alias{colCumprods,dgCMatrix-method}
\alias{rowCumprods}
\alias{rowCumprods,dgCMatrix-method}
\title{Cumulative sums, products, minima and maxima for each row (column) in a
matrix}
\usage{
colCumprods(x, rows = NULL, cols = NULL, ...)

\S4method{colCumprods}{dgCMatrix}(x, rows = NULL, cols = NULL, ...)

rowCumprods(x, rows = NULL, cols = NULL, ...)

\S4method{rowCumprods}{dgCMatrix}(x, rows = NULL, cols = NULL, ...)
}
\arguments{
\item{x}{A \code{\link[base]{numeric}} NxK \code{\link[base]{matrix}}.}

\item{rows}{A \code{\link[base]{vector}} indicating subset of elements
(or rows and/or columns) to operate over. If \code{\link[base]{NULL}}, no
subsetting is done.}

\item{cols}{A \code{\link[base]{vector}} indicating subset of elements
(or rows and/or columns) to operate over. If \code{\link[base]{NULL}}, no
subsetting is done.}

\item{...}{Not used.}
}
\value{
Returns a \code{\link[base]{numeric}} NxK \code{\link[base]{matrix}}
of the same mode as \code{x}.
}
\description{
Cumulative sums, products, minima and maxima for each row (column) in a
matrix.
}
\examples{
x <- matrix(1:12, nrow = 4, ncol = 3)
print(x)

yr <- rowCumsums(x)
print(yr)

yc <- colCumsums(x)
print(yc)

yr <- rowCumprods(x)
print(yr)

yc <- colCumprods(x)
print(yc)

yr <- rowCummaxs(x)
print(yr)

yc <- colCummaxs(x)
print(yc)

yr <- rowCummins(x)
print(yr)

yc <- colCummins(x)
print(yc)
}
\seealso{
See \code{\link[base]{cumsum}}(), \code{\link[base]{cumprod}}(),
\code{\link[base]{cummin}}(), and \code{\link[base]{cummax}}().
}
