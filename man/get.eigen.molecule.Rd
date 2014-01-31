\name{get.eigen.molecule}
\alias{get.eigen.molecule}
\title{Get eigen molecule}
\usage{
  get.eigen.molecule(data, groups, whichgroups = NULL,
    methods = "svd", n = 10)
}
\arguments{
  \item{data}{a data matrix ([data.frame object] row:
  molecules, col: samples or replicates)}

  \item{whichgroups}{}

  \item{sc}{See 'scalingMethods()'.}
}
\value{
  the resulting vector.
}
\description{
  Get eigen molecule
}
\examples{
library(pcaMethods)
data(golub, package = "multtest")
hc.mol1 <- cluster.molecule(golub[, 1:27], "pearson", "average")
g1 <- cutree(hc.mol1, h=0.6)
res1 <- get.eigen.molecule(golub, g1)
}
\author{
  Atsushi Fukushima
}

