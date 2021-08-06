if (!("maEndToEnd" %in% installed.packages())) {
  BiocManager::install("maEndToEnd", version = "devel")
}

install.packages("devtools")
library(devtools)

devtools::install_github("r-lib/remotes")
library(remotes)

remotes::install_github("b-klaus/maEndToEnd", ref="master")

suppressPackageStartupMessages({library("maEndToEnd")})

library("tidyverse")
raw_data_dir <- tempdir()

if (!dir.exists(raw_data_dir)) {
  dir.create(raw_data_dir)
}

anno_AE <- getAE("E-TABM-158", path = raw_data_dir, type = "raw")

sdrf_location <- file.path(raw_data_dir, "E-TABM-158.sdrf.txt")
SDRF <- read.delim(sdrf_location)

rownames(SDRF) <- SDRF$Array.Data.File
SDRF <- AnnotatedDataFrame(SDRF)

# The read.celfiles command below fails with the following "The annotation package, pd.u133aaofav2, could not be loaded"
# work around is to run this line first
BiocManager::install("pd.ht.hg.u133a")
library("pd.ht.hg.u133a")

raw_data <- oligo::read.celfiles(filenames = file.path(raw_data_dir, SDRF$Array.Data.File), 
    pkgname = "pd.ht.hg.u133a", verbose = FALSE, phenoData = SDRF)

stopifnot(validObject(raw_data))

nameFile <- names(Biobase::pData(raw_data))

Biobase::pData(raw_data) <- Biobase::pData(raw_data)[, c("Source.Name",
  #"Characteristics.individual.",
  "Characteristics.ethnicity.",
  #"Characteristics.Progesterone.Receptor.status",
  #"Characteristics..EstrogenReceptorStatus.",
  "Factor.Value.ethnicty."
  #"Factor.Value.phenotype."
  )]

