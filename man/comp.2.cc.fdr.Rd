\name{comp.2.cc.fdr}
\alias{comp.2.cc.fdr}
\title{Export differential correlations between two conditions}
\usage{
  comp.2.cc.fdr(output.file = "res.txt", data1, data2,
    method = "pearson", threshold = 0.05)
}
\arguments{
  \item{output.file}{can specify file name of the results
  exported}

  \item{data1}{data matrix under condition 1}

  \item{data2}{data matrix under condition 2}

  \item{method}{c("pearson", "spearman", "kendall")}

  \item{r}{a vector of correlation coefficient under
  condition}

  \item{threshold}{a threshold of significance levels of
  differential correlation}
}
\value{
  a text file
}
\description{
  Export differential correlations of comparison of two
  correlation matrices
}
\examples{
library(fdrtool)
data(golub, package = "multtest")
comp.2.cc.fdr(output.file="res.txt", golub[,1:27], golub[,28:38])
}
\author{
  Atsushi Fukushima
}
\references{
  Strimmer, K. Bioinformatics (2008) 24, 1461-1462
}

