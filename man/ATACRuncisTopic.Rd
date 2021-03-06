% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ATACRuncisTopic.R
\docType{methods}
\name{ATACRuncisTopic}
\alias{ATACRuncisTopic}
\title{Clustering analysis for scATAC-seq data using cisTopic}
\usage{
ATACRuncisTopic(
  inputMat,
  project = "MAESTRO.scATAC.cisTopic",
  min.c = 50,
  min.p = 500,
  topics.number = c(5, 10, 20, 30),
  topic.select = 30
)
}
\arguments{
\item{inputMat}{Input unnormalized count matrix, with peaks as rows and cells as columns. Rownames should be like "chromosome_peakstart_peakend",
for example "chr10_100020591_100020841".}

\item{project}{Output project name for the cisTopic object. Default is "MAESTRO.scATAC.cisTopic".}

\item{min.c}{Minimum number of cells required for a peak. Will exclude the peaks from input matrix if they only identified in 
less than \code{min.c} cells. Default is 50.}

\item{min.p}{Minimum number of peaks required for a cell. Will exclude the cells from input matrix if less than \code{min.p}
peaks are deteced in one cell. Default is 500.}

\item{topics.number}{List number of topics to calculate. Default is 5,10,20,30.}

\item{topics.select}{Seleted number of topics. Default is 30.}
}
\value{
A list contains a cisTopic object for ATAC clusters and a list with clustering informations.
}
\description{
Clustering analysis for scATAC-seq dataset using cisTopic(version >= 0.2.0). Including topic modeling, clustering based on cisTopics and UMAP visualization. To run UMAP analysis, you must first install the umap-learn python package (e.g. via \code{pip install umap-learn}).
}
\examples{
data(pbmc.ATAC)
pbmc.ATAC.res <- ATACRuncisTopic(inputMat = pbmc.ATAC, project = "PBMC.scATAC.cisTopic")
str(pbmc.ATAC.res$ATAC)
head(pbmc.ATAC.res$cluster)

}
\author{
Chenfei Wang
}
