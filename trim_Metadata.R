source("LoadLibraries.R")

conflict_prefer("filter", "dplyr")

data_dir <- "data"

# Create the data folder if it doesn't exist
if (!dir.exists("data")) {
  dir.create("data")
}

# Define the file path to the plots directory
plots_dir <- "plots" 

# Create the plots folder if it doesn't exist
if (!dir.exists(plots_dir)) {
  dir.create(plots_dir)
}

# Define the file path to the results directory
results_dir <- "results" 

# Create the results folder if it doesn't exist
if (!dir.exists(results_dir)) {
  dir.create(results_dir)
}

#check if the metadata columns are equal across all metadata files
#all.equal(names(metadata1), names(metadata2))

#use this to extract columns, and then look through to decide which columns to keep
#write.table(names(metadata), "metadata1_names.tsv", sep = "\t")

metadata1 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE6434/metadata_GSE6434.tsv")
trim_Metadata1 <- metadata1 %>% select (refinebio_accession_code, experiment_accession, age, er, her2, pr, race, `triple-negative status`)%>%
  rename (SampleID = refinebio_accession_code,
        DatasetID = experiment_accession,
        Age = age,
        Race = race,
        `Estrogen Receptor Status` = er,
        `HER2/Neu Status` = her2,
        `Progesterone Receptor Status` = pr)

trim_Metadata1$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata1$`Estrogen Receptor Status`, "Positive", "Estrogen Receptor Positive")
trim_Metadata1$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata1$`Progesterone Receptor Status`, "Positive", "Progesterone Receptor Positive")
trim_Metadata1$`HER2/Neu Status` <- str_replace_all(trim_Metadata1$`HER2/Neu Status`, "Positive", "HER2/Neu Positive")

trim_Metadata1$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata1$`Estrogen Receptor Status`, "Negative", "Estrogen Receptor Negative")
trim_Metadata1$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata1$`Progesterone Receptor Status`, "Negative", "Progesterone Receptor Negative")
trim_Metadata1$`HER2/Neu Status` <- str_replace_all(trim_Metadata1$`HER2/Neu Status`, "Negative", "HER2/Neu Negative")

write_tsv(trim_Metadata1, file.path(data_dir, "trim_GSE6434.tsv"))

metadata2 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE24185/metadata_GSE24185.tsv")
trim_Metadata2 <- metadata2 %>% select (refinebio_accession_code, experiment_accession, age, er, her2, pr, race, `triple-negative status`) %>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = age,
          Race = race,
          `Estrogen Receptor Status` = er,
          `HER2/Neu Status` = her2,
          `Progesterone Receptor Status` = pr)

trim_Metadata2$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata2$`Estrogen Receptor Status`, "P", "Estrogen Receptor Positive")
trim_Metadata2$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata2$`Progesterone Receptor Status`, "P", "Progesterone Receptor Positive")
trim_Metadata2$`HER2/Neu Status` <- str_replace_all(trim_Metadata2$`HER2/Neu Status`, "P", "HER2/Neu Positive")

trim_Metadata2$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata2$`Estrogen Receptor Status`, "N", "Estrogen Receptor Negative")
trim_Metadata2$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata2$`Progesterone Receptor Status`, "N", "Progesterone Receptor Negative")
trim_Metadata2$`HER2/Neu Status` <- str_replace_all(trim_Metadata2$`HER2/Neu Status`, "^N$", "HER2/Neu Negative")

trim_Metadata2$Race <- str_replace_all(trim_Metadata2$Race, "a", "Asian")
trim_Metadata2$Race <- str_replace_all(trim_Metadata2$Race, "b", "Black")
trim_Metadata2$Race <- str_replace_all(trim_Metadata2$Race, "w", "White")

trim_Metadata2 = filter(trim_Metadata2, Race %in% c("Black", "White"))
write_tsv(trim_Metadata2, file.path(data_dir, "trim_GSE24185.tsv"))

metadata3 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE19697/metadata_GSE19697.tsv")
trim_Metadata3 <- metadata3 %>% select (refinebio_accession_code, experiment_accession, age, er, her2, pr, race, `triple-negative status`) %>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = age,
          Race = race,
          `Estrogen Receptor Status` = er,
          `HER2/Neu Status` = her2,
          `Progesterone Receptor Status` = pr)

trim_Metadata3$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata3$`Estrogen Receptor Status`, "1", "Estrogen Receptor Positive")
trim_Metadata3$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata3$`Progesterone Receptor Status`, "1", "Progesterone Receptor Positive")
trim_Metadata3$`HER2/Neu Status` <- str_replace_all(trim_Metadata3$`HER2/Neu Status`, "1", "HER2/Neu Positive")

trim_Metadata3$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata3$`Estrogen Receptor Status`, "0", "Estrogen Receptor Negative")
trim_Metadata3$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata3$`Progesterone Receptor Status`, "0", "Progesterone Receptor Negative")
trim_Metadata3$`HER2/Neu Status` <- str_replace_all(trim_Metadata3$`HER2/Neu Status`, "0", "HER2/Neu Negative")

trim_Metadata3$Race <- str_replace_all(trim_Metadata3$Race, "Caucasian", "White")
trim_Metadata3$Race <- str_replace_all(trim_Metadata3$Race, "African American", "Black")

write_tsv(trim_Metadata3, file.path(data_dir, "trim_GSE19697.tsv"))

metadata4 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE20194/metadata_GSE20194.tsv")
trim_Metadata4 <- metadata4 %>% select (refinebio_accession_code, experiment_accession, age, er_status, `her2 status`, pr_status, race, `triple-negative status`) %>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = age,
          Race = race,
          `Estrogen Receptor Status` = er_status,
          `HER2/Neu Status` = `her2 status`,
          `Progesterone Receptor Status` = `pr_status`)

trim_Metadata4$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata4$`Estrogen Receptor Status`, "P", "Estrogen Receptor Positive")
trim_Metadata4$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata4$`Progesterone Receptor Status`, "P", "Progesterone Receptor Positive")
trim_Metadata4$`HER2/Neu Status` <- str_replace_all(trim_Metadata4$`HER2/Neu Status`, "P", "HER2/Neu Positive")

trim_Metadata4$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata4$`Estrogen Receptor Status`, "N", "Estrogen Receptor Negative")
trim_Metadata4$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata4$`Progesterone Receptor Status`, "N", "Progesterone Receptor Negative")
trim_Metadata4$`HER2/Neu Status` <- str_replace_all(trim_Metadata4$`HER2/Neu Status`, "^N", "HER2/Neu Negative")

trim_Metadata4$Race <- str_replace_all(trim_Metadata4$Race, "asian", "Asian")
trim_Metadata4$Race <- str_replace_all(trim_Metadata4$Race, "black", "Black")
trim_Metadata4$Race <- str_replace_all(trim_Metadata4$Race, "hispanic", "Hispanic or Latino")
trim_Metadata4$Race <- str_replace_all(trim_Metadata4$Race, "mixed", "Multiracial")
trim_Metadata4$Race <- str_replace_all(trim_Metadata4$Race, "white", "White")

trim_Metadata4 = filter(trim_Metadata4, Race %in% c("Black", "White"))
write_tsv(trim_Metadata4, file.path(data_dir, "trim_GSE20194.tsv"))

metadata5 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE1456/metadata_GSE1456.tsv")
trim_Metadata5 <- metadata5 %>% select (refinebio_accession_code, experiment_accession, age, er, her2, pr, race, `triple-negative status`) %>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = age,
          Race = race,
          `Estrogen Receptor Status` = er,
          `HER2/Neu Status` = her2,
          `Progesterone Receptor Status` = pr)

trim_Metadata5$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata5$`Estrogen Receptor Status`, "Positive", "Estrogen Receptor Positive")
trim_Metadata5$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata5$`Progesterone Receptor Status`, "Positive", "Progesterone Receptor Positive")
trim_Metadata5$`HER2/Neu Status` <- str_replace_all(trim_Metadata5$`HER2/Neu Status`, "Positive", "HER2/Neu Positive")

trim_Metadata5$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata5$`Estrogen Receptor Status`, "Negative", "Estrogen Receptor Negative")
trim_Metadata5$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata5$`Progesterone Receptor Status`, "Negative", "Progesterone Receptor Negative")
trim_Metadata5$`HER2/Neu Status` <- str_replace_all(trim_Metadata5$`HER2/Neu Status`, "Negative", "HER2/Neu Negative")

write_tsv(trim_Metadata5, file.path(data_dir, "trim_GSE1456.tsv"))

metadata6 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE20271/metadata_GSE20271.tsv")
trim_Metadata6 <- metadata6 %>% select(refinebio_accession_code, experiment_accession, age, `er status`, `her 2 status`, `pr status`, race, `triple-negative status`) %>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = age,
          Race = race,
          `Estrogen Receptor Status` = `er status`,
          `HER2/Neu Status` = `her 2 status`,
          `Progesterone Receptor Status` = `pr status`)

trim_Metadata6$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata6$`Estrogen Receptor Status`, "P", "Estrogen Receptor Positive")
trim_Metadata6$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata6$`Progesterone Receptor Status`, "P", "Progesterone Receptor Positive")
trim_Metadata6$`HER2/Neu Status` <- str_replace_all(trim_Metadata6$`HER2/Neu Status`, "P", "HER2/Neu Positive")

trim_Metadata6$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata6$`Estrogen Receptor Status`, "N", "Estrogen Receptor Negative")
trim_Metadata6$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata6$`Progesterone Receptor Status`, "N", "Progesterone Receptor Negative")
trim_Metadata6$`HER2/Neu Status` <- str_replace_all(trim_Metadata6$`HER2/Neu Status`, "^N", "HER2/Neu Negative")

trim_Metadata6$Race <- str_replace_all(trim_Metadata6$Race, "A", "Asian")
trim_Metadata6$Race <- str_replace_all(trim_Metadata6$Race, "B", "Black")
trim_Metadata6$Race <- str_replace_all(trim_Metadata6$Race, "H", "Hispanic or Latino")
trim_Metadata6$Race <- str_replace_all(trim_Metadata6$Race, "W", "White")

trim_Metadata6 = filter(trim_Metadata6, Race %in% c("Black", "White"))

write_tsv(trim_Metadata6, file.path(data_dir, "trim_GSE20271.tsv"))

metadata7 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE32646/metadata_GSE32646.tsv")
trim_Metadata7 <- metadata7 %>% select(refinebio_accession_code, experiment_accession, age, `er status ihc`, `her2 status fish`, `pr status ihc`, race, `triple-negative status`) %>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = age,
          Race = race,
          `Estrogen Receptor Status` = `er status ihc`,
          `HER2/Neu Status` = `her2 status fish`,
          `Progesterone Receptor Status` = `pr status ihc`)

trim_Metadata7$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata7$`Estrogen Receptor Status`, "positive", "Estrogen Receptor Positive")
trim_Metadata7$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata7$`Progesterone Receptor Status`, "positive", "Progesterone Receptor Positive")
trim_Metadata7$`HER2/Neu Status` <- str_replace_all(trim_Metadata7$`HER2/Neu Status`, "positive", "HER2/Neu positive")

trim_Metadata7$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata7$`Estrogen Receptor Status`, "negative", "Estrogen Receptor Negative")
trim_Metadata7$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata7$`Progesterone Receptor Status`, "negative", "Progesterone Receptor Negative")
trim_Metadata7$`HER2/Neu Status` <- str_replace_all(trim_Metadata7$`HER2/Neu Status`, "negative", "HER2/Neu negative")

write_tsv(trim_Metadata7, file.path(data_dir, "trim_GSE32646.tsv"))

metadata8 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE48391/metadata_GSE48391.tsv")
trim_Metadata8 <- metadata8 %>% select(refinebio_accession_code, experiment_accession, age, er, `her2`, pr, race, `triple-negative status`) %>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = age,
          Race = race,
          `Estrogen Receptor Status` = er,
          `HER2/Neu Status` = her2,
          `Progesterone Receptor Status` = pr)

trim_Metadata8$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata8$`Estrogen Receptor Status`, "positive", "Estrogen Receptor Positive")
trim_Metadata8$`HER2/Neu Status` <- str_replace_all(trim_Metadata8$`HER2/Neu Status`, "over-expression", "HER2/Neu Positive")

trim_Metadata8$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata8$`Estrogen Receptor Status`, "negative", "Estrogen Receptor Negative")
trim_Metadata8$`HER2/Neu Status` <- str_replace_all(trim_Metadata8$`HER2/Neu Status`, "normal", "HER2/Neu Negative")

write_tsv(trim_Metadata8, file.path(data_dir, "trim_GSE48391.tsv"))

metadata9 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE50948/metadata_GSE50948.tsv")
trim_Metadata9 <- metadata9 %>% select(refinebio_accession_code, experiment_accession, age, er, her2, pr, race, `triple-negative status`)%>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = age,
          Race = race,
          `Estrogen Receptor Status` = er,
          `HER2/Neu Status` = her2,
          `Progesterone Receptor Status` = pr)

trim_Metadata9$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata9$`Estrogen Receptor Status`, "ER\\+$", "Estrogen Receptor Positive")
trim_Metadata9$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata9$`Progesterone Receptor Status`, "PR\\+$", "Progesterone Receptor Positive")
trim_Metadata9$`HER2/Neu Status` <- str_replace_all(trim_Metadata9$`HER2/Neu Status`, "HER2\\+$", "HER2/Neu Positive")

trim_Metadata9$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata9$`Estrogen Receptor Status`, "ER-", "Estrogen Receptor Negative")
trim_Metadata9$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata9$`Progesterone Receptor Status`, "PR-", "Progesterone Receptor Negative")
trim_Metadata9$`HER2/Neu Status` <- str_replace_all(trim_Metadata9$`HER2/Neu Status`, "HER2\\-$", "HER2/Neu Negative")

trim_Metadata9$Race <- str_replace_all(trim_Metadata9$Race, "A", "Asian")
trim_Metadata9$Race <- str_replace_all(trim_Metadata9$Race, "Caucasian", "White")

trim_Metadata9 = filter(trim_Metadata9, Race %in% c("White"))

write_tsv(trim_Metadata9, file.path(data_dir, "trim_GSE50948.tsv"))

metadata10 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE5460/metadata_GSE5460.tsv")
trim_Metadata10 <- metadata10 %>% select(refinebio_accession_code, experiment_accession, age, ER, HER2, pr, race, `triple-negative status`)%>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = age,
          Race = race,
          `Estrogen Receptor Status` = ER,
          `HER2/Neu Status` = HER2,
          `Progesterone Receptor Status` = pr)


trim_Metadata10$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata10$`Estrogen Receptor Status`, "pos", "Estrogen Receptor Positive")
trim_Metadata10$`HER2/Neu Status` <- str_replace_all(trim_Metadata10$`HER2/Neu Status`, "pos", "HER2/Neu Positive")

trim_Metadata10$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata10$`Estrogen Receptor Status`, "neg", "Estrogen Receptor Negative")
trim_Metadata10$`HER2/Neu Status` <- str_replace_all(trim_Metadata10$`HER2/Neu Status`, "neg", "HER2/Neu Negative")

write_tsv(trim_Metadata10, file.path(data_dir, "trim_GSE5460.tsv"))

metadata11 <- read_tsv("C:/Users/DrPanks/Google Drive/PhD_Project/Metaanalysis/data/GSE76275/metadata_GSE76275.tsv")
trim_Metadata11 <- metadata11 %>% select(refinebio_accession_code, experiment_accession, `age (years)`, er, her2, pr, race, `triple-negative status`)%>%
  rename (SampleID = refinebio_accession_code,
          DatasetID = experiment_accession,
          Age = `age (years)`,
          Race = race,
          `Estrogen Receptor Status` = er,
          `HER2/Neu Status` = her2,
          `Progesterone Receptor Status` = pr) 

trim_Metadata11$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata11$`Estrogen Receptor Status`, "Positive", "Estrogen Receptor Positive")
trim_Metadata11$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata11$`Progesterone Receptor Status`, "Positive", "Progesterone Receptor Positive")
trim_Metadata11$`HER2/Neu Status` <- str_replace_all(trim_Metadata11$`HER2/Neu Status`, "Positive", "HER2/Neu Positive")

trim_Metadata11$`Estrogen Receptor Status` <- str_replace_all(trim_Metadata11$`Estrogen Receptor Status`, "Negative", "Estrogen Receptor Negative")
trim_Metadata11$`Progesterone Receptor Status` <- str_replace_all(trim_Metadata11$`Progesterone Receptor Status`, "Negative", "Progesterone Receptor Negative")
trim_Metadata11$`HER2/Neu Status` <- str_replace_all(trim_Metadata11$`HER2/Neu Status`, "Negative", "HER2/Neu Negative")
trim_Metadata11$Race <- str_replace_all(trim_Metadata11$Race, "Caucasian", "White")

trim_Metadata11 = filter(trim_Metadata11, Race %in% c("White"))

write_tsv(trim_Metadata11, file.path(data_dir, "trim_GSE76275.tsv"))


#trim_Metadata11$Race %>% unique()
#refinebio_accession_code, experiment_accession, ER, HER2, age, 
#`age (years)`, er, `er status`, `er status ihc`, `er.ct`, er_status, gender, `her 2 fish`, 
#`her 2 ihc`, `her 2 status`,  her2,  `her2 fish`, `her2 ihc`, `her2 status`,  `her2 status fish`, 
#`her2.ct`, pr, `pr status`, `pr status ihc`, `pr.ct`, pr_status, race, status, `triple-negative status`)
