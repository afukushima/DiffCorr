\name{cor.dist}
\alias{cor.dist}
\title{Additional distance functions correlation distance (1-r)}
\usage{
  cor.dist(data, methods = "pearson", absolute = FALSE)
}
\arguments{
  \item{data}{a data matrix ([data.frame object] row:
  metabolites, col: samples or replicates)}

  \item{methods}{a character string indicating which
  correlation coefficient is to be calculated. One of
  "pearson" (default), "spearman", or "kendall" can be
  abbreviated.}

  \item{absolute}{TRUE means that absolute value of the
  correlation coefficient is used (Default: FALSE).}
}
\value{
  the resulting correlation matrix
}
\description{
  Additional distance functions Correlation distance (1-r)
}
\details{
  These functions were originally from 'hybridHclust'
  package. We modified the functions slightly. See also the
  reference manual in detail.
}
\examples{
cor.dist(as.matrix(t(iris[,1:4])))
}
\author{
  Atsushi Fukushima
}

