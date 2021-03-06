% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ATACAnnotateChromatinAccessibility.R
\docType{methods}
\name{ATACAnnotateChromatinAccessibility}
\alias{ATACAnnotateChromatinAccessibility}
\title{Automatic cell-type annotation for scATAC-seq clusters using Cistrome Chromatin Accessibilities}
\usage{
ATACAnnotateChromatinAccessibility(
  ATAC,
  peaks,
  project = ATAC@project.name,
  giggle.path,
  organism = "GRCh38",
  top.ca = 10,
  min.peaks = 10
)
}
\arguments{
\item{ATAC}{Seurat object of ATAC RPscore clustering  generated by \code{\link{ATACAnnotateCelltype}} function.}

\item{peaks}{Data frame of differential peaks, generated by \code{\link{ATACRunSeurat}}, \code{\link{FindMarkersMAESTRO}} or \code{\link{FindAllMarkersMAESTRO}} function.}

\item{project}{Output project name for the giggle analysis result. Default is the project name of the ATAC Seurat object}

\item{giggle.path}{Path of the giggle annotation files. The giggle annoation for CistromeDB is available at https://github.com/liulab-dfci/MAESTRO.
Download and unzip the annotation, supply the path of the annotations to \code{giggle.anno.path}.}

\item{organism}{Organism for the dataset. Only support "GRCh38" and "GRCm38". Default is "GRCh38".}

\item{top.ca}{Generate barplot for the top enriched chromatin accessibility data. Default is 10, for each cluster, only the top 10 enriched chromatin accessibility data are used to generate the barplot.}

\item{min.peaks}{Minimum number of peaks requires to run giggle, default is 10.}
}
\value{
A list of top enriched transcription factors and their target genes for each cluster.
}
\description{
Automatic cell-type annotation for scATAC-seq clusters based on ATAC-seq peaks or DNase-seq peaks from CistromeDB. To run this function, you must first install the giggle package (see from https://github.com/ryanlayer/giggle).
}
\examples{
data(pbmc.ATAC)
data(pbmc.RP)
data(human.immune.CIBERSORT)
pbmc.ATAC.res <- ATACRunSeurat(inputMat = pbmc.ATAC, project = "PBMC.scATAC.Seurat", method = "LSI")
pbmc.ATAC.res$ATAC <- ATACAttachGenescore(pbmc.ATAC.res$ATAC, pbmc.RP)
pbmc.ATAC.res$ATAC <- ATACAnnotateChromatinAccessibility(ATAC = pbmc.ATAC.res$ATAC, peaks = pbmc.ATAC.res$peaks, project = "PBMC.scATAC.CA", giggle.path = "/home/annotations/giggle")
pbmc.ATAC.res$ATAC@meta.data

}
\author{
Dongqing Sun, Changxin Wan, Chenfei Wang
}
