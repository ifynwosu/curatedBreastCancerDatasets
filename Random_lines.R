library(tidyverse)
library(rjson)

E_TABM_158 <- read_tsv("E-TABM-158.sdrf.txt")

GSE2603 <- read_tsv("GSE2603_Annotations.tsv")

GSE2990 <- read_tsv("GSE2990_Annotations.tsv")

GSE7390 <- read_tsv("GSE7390_Annotations.tsv")

GSE2109 <- read_tsv("GSE2109_Breast_Clinical.txt")

GSE20181_ER <- read_tsv("Analysis/MolecularMarker__Estrogen_Receptor_Status_Analysis.txt")
GSE20181_HER <- read_tsv("Analysis/MolecularMarker__HER2_Neu_Status_Analysis.txt")


metadata_list <- fromJSON(file = "C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE1561/GSE1561.tsv")


#read_tsv("C:/Users/DrPanks/Documents/Metaanalysis/data/GSE1456/GSE1456.tsv")

expression_df <- read.delim("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE1561/GSE1561.tsv", header = TRUE,
                            row.names = 1, stringsAsFactors = FALSE)

expression_df1 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE1561/GSE1561.tsv") %>%
                             tibble::column_to_rownames("Gene")
