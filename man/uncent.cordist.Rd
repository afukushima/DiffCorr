\name{uncent.cordist}
\alias{uncent.cordist}
\title{Calculating all pairwise distances using correlation distance}
\usage{
  uncent.cordist(data, absolute = FALSE)
}
\arguments{
  \item{data}{a data matrix ([data.frame object] row:
  metabolites, col: samples or replicates)}

  \item{absolute}{TRUE means that absolute value of the
  correlation coefficient is used (Default: FALSE).}
}
\value{
  the resulting correlation matrix
}
\description{
  Calculating all pairwise distances using correlation
  distance
}
\details{
  These functions were originally from 'hybridHclust'
  package. We modified the functions slightly. See also the
  reference manual in detail.
}
\examples{
uncent.cordist(as.matrix(t(iris[,1:4]))) ## NOT RUN!
}
\author{
  Atsushi Fukushima
}

