DiffCorr
========
An R package to analyze and visualize differential correlations in biological networks.

Large-scale "omics" data can be used to infer underlying cellular regulatory networks in organisms, enabling us to better understand the molecular basis of disease and important traits. Correlation approaches, such as a hierarchical cluster analysis, have been widely used to analyze omics data. In addition to the changes in the mean levels of molecules in the omics data, it is important to know about the changes in the correlation relationship among molecules between 2 experimental conditions. The development of a tool to identify differential correlation patterns in omics data in an efficient and unbiased manner is therefore desirable.

We developed the DiffCorr package, a simple method for identifying pattern changes between 2 experimental conditions in correlation networks, which builds on a commonly used association measure, such as Pearson's correlation coefficient. DiffCorr calculates correlation matrices for each dataset, identifies the first principal component-based "eigen-molecules" in the correlation networks, and tests differential correlation between the 2 groups based on Fisher's z-test.

DiffCorr can explore differential correlations between 2 conditions in the context of post-genomics data types, namely transcriptomics and metabolomics. DiffCorr is simple to use in calculating differential correlations and is suitable for the first step towards inferring causal relationships and detecting biomarker candidates.

Installation
------------
```R
install.packages("devtools")
source("http://bioconductor.org/biocLite.R")
biocLite("pcaMethods")

library(devtools)
install_github("afukushima/DiffCorr")
```
