\name{cluster.molecule}
\alias{cluster.molecule}
\title{Hierarchical clustering of molecules}
\usage{
  cluster.molecule(data, methods = "pearson",
    linkage = "average", abs = FALSE)
}
\arguments{
  \item{data}{matrix or data frame}

  \item{method}{c("pearson", "spearman", "kendall",
  "euclidean", "maximum", "manhattan", "canberra",
  "binary", or "minkowski")}

  \item{linkage}{c("average", "ward", "single", "complete",
  "mcquitty", "median", "centroid")}
}
\value{
  an object of class 'hclust'
}
\description{
  Cluster molecules
}
\examples{
cluster.molecule(as.matrix(t(iris[,1:4])), "pearson", "average")
}
\author{
  Atsushi Fukushima
}

