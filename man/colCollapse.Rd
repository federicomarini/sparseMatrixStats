% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R, R/methods_row.R
\docType{methods}
\name{colCollapse}
\alias{colCollapse}
\alias{colCollapse,dgCMatrix-method}
\alias{rowCollapse}
\alias{rowCollapse,dgCMatrix-method}
\title{Extracts one cell per row (column) from a matrix}
\usage{
colCollapse(x, idxs, rows = NULL, cols = NULL, ...)

\S4method{colCollapse}{dgCMatrix}(x, idxs, rows = NULL, cols = NULL,
  ...)

rowCollapse(x, idxs, rows = NULL, cols = NULL, ...)

\S4method{rowCollapse}{dgCMatrix}(x, idxs, rows = NULL, cols = NULL,
  ...)
}
\arguments{
\item{x}{An NxK \code{\link[base]{matrix}}.}

\item{idxs}{An index \code{\link[base]{vector}} of (maximum) length N (K)
specifying the columns (rows) to be extracted.}

\item{rows}{A \code{\link[base]{vector}} indicating subset of rows
(and/or columns) to operate over. If \code{\link[base]{NULL}}, no subsetting
is done.}

\item{cols}{A \code{\link[base]{vector}} indicating subset of rows
(and/or columns) to operate over. If \code{\link[base]{NULL}}, no subsetting
is done.}

\item{...}{Not used.}
}
\value{
Returns a \code{\link[base]{vector}} of length N (K).
}
\description{
Extracts one cell per row (column) from a matrix.  The implementation is
optimized for memory and speed.
}
\examples{
x <- matrix(1:27, ncol = 3)

y <- rowCollapse(x, 1)
stopifnot(identical(y, x[, 1]))

y <- rowCollapse(x, 2)
stopifnot(identical(y, x[, 2]))

y <- rowCollapse(x, c(1, 1, 1, 1, 1, 3, 3, 3, 3))
stopifnot(identical(y, c(x[1:5, 1], x[6:9, 3])))

y <- rowCollapse(x, 1:3)
print(y)
y_truth <- c(x[1, 1], x[2, 2], x[3, 3], x[4, 1], x[5, 2],
             x[6, 3], x[7, 1], x[8, 2], x[9, 3])
stopifnot(identical(y, y_truth))
}
\seealso{
\emph{Matrix indexing} to index elements in matrices and arrays,
cf. \code{\link[base]{[}}().
}
