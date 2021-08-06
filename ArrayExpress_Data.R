library(ArrayExpress)

SDRF <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/ArrayExpress/E-TABM-158.sdrf.txt")
head_names <- as.data.frame(names(SDRF))

SDRF <- dplyr::select(SDRF, 
            -c(`Characteristics [BioSourceType]`, `Characteristics [DiseaseState]`, `Characteristics [OrganismPart]`, 
               `Term Source REF`, `Term Accession Number`, `Term Source REF_1`, `Term Accession Number_1`, 
               `Term Source REF_2`, `Term Accession Number_1`, `Characteristics [Organism]`, 
               `Term Accession Number_2`, `Term Source REF_3`, `Term Accession Number_3`, `Protocol REF`, 
               `Extract Name`, `Material Type`, `Protocol REF_1`, `Labeled Extract Name`, `Label`,
               `Material Type_1`, `Protocol REF_2`, `Protocol REF_3`, `Hybridization Name`, 
               `Array Design REF`, `Comment [Array Design URI]`, `Protocol REF_4`, `Term Source REF_4`, 
               `Term Accession Number_4`, `Factor Value [tumor size (mm)]`, `Scan Name`, `Array Data File`,
               `Comment [ArrayExpress FTP file]`, `Protocol REF_5`, `Derived Array Data Matrix File`, 
               `Comment [Derived ArrayExpress FTP file]`))


anno_AE <- getAE("E-TABM-158", type = "full", local = TRUE, sourcedir = "C:/Users/DrPanks/Desktop/Datasets/ArrayExpress/E-TABM-158")


