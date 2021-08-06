source("LoadLibraries.R")

#RefineBio New_Data
metadata_1561 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE1561/metadata_GSE1561.tsv")

metadata_2109 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE2109/metadata_GSE2109.tsv")

metadata_2603 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE2603/metadata_GSE2603.tsv")

metadata_2990 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE2990/metadata_GSE2990.tsv")

metadata_3494 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE3494/metadata_GSE3494.tsv")

metadata_7390 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE7390/metadata_GSE7390.tsv")

metadata_7904 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE7904/metadata_GSE7904.tsv")

metadata_9086 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE9086/metadata_GSE9086.tsv")

metadata_9090 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE9090/metadata_GSE9090.tsv")

metadata_9091 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE9091/metadata_GSE9091.tsv")

metadata_11121 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE11121/metadata_GSE11121.tsv")

metadata_20181 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE20181/metadata_GSE20181.tsv")

metadata_22513 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE22513/metadata_GSE22513.tsv")

metadata_28796 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE28796/metadata_GSE28796.tsv")

metadata_28821 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE28821/metadata_GSE28821.tsv")

metadata_86374 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE86374/metadata_GSE86374.tsv")

#RefineBio Old_Data
#metadata1 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE9090/metadata_GSE9090.tsv")

#metadata1 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE9090/metadata_GSE9090.tsv")

#metadata1 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE9090/metadata_GSE9090.tsv")

#metadata1 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE9090/metadata_GSE9090.tsv")

#metadata1 <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Refinebio/New_Data/GSE9090/metadata_GSE9090.tsv")

                     
# trim_Metadata1 <- metadata1 %>% select (refinebio_accession_code, experiment_accession, age, er, her2, pr, race, `triple-negative status`)%>%
#   rename (SampleID = refinebio_accession_code,
#           DatasetID = experiment_accession,
#           Age = age,
#           Race = race,
#           `Estrogen Receptor Status` = er,
#           `HER2/Neu Status` = her2,
#           `Progesterone Receptor Status` = pr)
# 
# trim_Metadata1$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata1$`Estrogen Receptor Status`, "Positive", "Estrogen Receptor Positive")
# trim_Metadata1$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata1$`Progesterone Receptor Status`, "Positive", "Progesterone Receptor Positive")
# trim_Metadata1$`HER2/Neu Status` <- str_replace_all(trim_Metadata1$`HER2/Neu Status`, "Positive", "HER2/Neu Positive")
# 
# trim_Metadata1$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata1$`Estrogen Receptor Status`, "Negative", "Estrogen Receptor Negative")
# trim_Metadata1$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata1$`Progesterone Receptor Status`, "Negative", "Progesterone Receptor Negative")
# trim_Metadata1$`HER2/Neu Status` <- str_replace_all(trim_Metadata1$`HER2/Neu Status`, "Negative", "HER2/Neu Negative")
# 
# write_tsv(trim_Metadata1, file.path(data_dir, "trim_GSE6434.tsv"))