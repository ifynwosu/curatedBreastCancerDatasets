
source("LoadLibraries.R")
source("filterVariables.R")
source("attributeList.R")
source("attributeCharacter.R")
#head_names <- as.data.frame(names(GSE7390))
#write_tsv(head_names, "name_List")

#To remove columns with all NA's(Method 1)
#data_new <- data[ , colSums(is.na(data)) < nrow(data)]  # Remove cols with NA only

#To remove columns with all NA's run the following 2 lines (Method 2)
#all_na <- function(x) any(!is.na(x))
#df %>% select_if(all_na)


GSE11121 <- filterVariables("GSE11121") %>% attribute()
GSE7390 <- filterVariables("GSE7390") %>% attributeList()
GSE19697 <- filterVariables("GSE19697") %>% attributeList()

big_list <- GSE11121 %>% rbind(GSE7390) %>% rbind(GSE19697)

#RefineBio New Datasets
GSE1561 <- filterVariables("GSE1561")#
GSE2109 <- filterVariables("GSE2109")#
GSE2603 <- filterVariables("GSE2603")#
GSE2990 <- filterVariables("GSE2990")#
GSE3494 <- filterVariables("GSE3494")#
GSE7390 <- filterVariables("GSE7390")#
GSE7904 <- filterVariables("GSE7904")#
GSE11121 <- filterVariables("GSE11121")#
GSE20181 <- filterVariables("GSE20181")#
GSE22513 <- filterVariables("GSE22513")#
GSE28796 <- filterVariables("GSE28796")#
GSE28821 <- filterVariables("GSE28821")#
GSE86374 <- filterVariables("GSE86374")#


#find no of unique values for each col and if no of unique < 10% num of rows, convert to character

GSE7390 <- filterVariables("GSE7390") #%>% attributeList()


GSE7390_mat <- remove_empty(GSE7390$metadata, which = "cols") %>%
  mutate(refinebio_accession_code = factor(refinebio_accession_code)) %>%
  mutate(experiment_accession = factor(experiment_accession)) %>%
  #mutate(refinebio_disease_stage = as.character(refinebio_disease_stage)) %>%
  select_if(negate(is.character)) 

GSE7390_mat <-GSE7390_mat %>%
  pivot_longer(
  cols = 3:ncol(GSE7390_mat),
  names_to = "Variable",
  values_to = "Value") %>% 
  group_by(experiment_accession, Variable) %>%
  summarise(
    Min = min(Value, na.rm = T), 
    Mean = mean(Value, na.rm = T), 
    Max = max(Value, na.rm = T),
    Num_unique = length(unique(Value))) %>% 
  dplyr::filter(Num_unique > 10) %>%
  dplyr::select(-Num_unique)

#RefineBio Old Datasets
GSE1456 <- filterVariables("GSE1456")
GSE5460 <- filterVariables("GSE5460")
GSE6434 <- filterVariables("GSE6434")
GSE19697 <- filterVariables("GSE19697")
GSE20194 <- filterVariables("GSE20194")
GSE20271 <- filterVariables("GSE20271")
GSE24185 <- filterVariables("GSE24185")
GSE32646 <- filterVariables("GSE32646")
GSE48391 <- filterVariables("GSE48391")
GSE50948 <- filterVariables("GSE50948")
GSE76275 <- filterVariables("GSE76275")

#ArrayExpress
ArrExp <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/ArrayExpress/E-TABM-158.sdrf.txt") %>%  
  clean_names() %>% 
  dplyr::select(c(`source_name`, `characteristics_distal_recurrence_time`,`characteristics_recurrence_time`, 
                  `characteristics_dead_of_disease`, `characteristics_followup_time`, `characteristics_node_positive`,
                  `characteristics_hormonal_therapy`, `characteristics_alive_at_endpoint`,
                  `characteristics_erb_b2_positive_ihc`, `characteristics_p53_positive_ihc`,
                  `characteristics_chemotherapy_treatment`, `characteristics_ethnicity`, `characteristics_tumor_size_mm`,
                  `characteristics_radiation_treatment`, `characteristics_recurrence`,
                  `characteristics_progesterone_receptor_status`, `characteristics_distal_recurrence`,
                  `characteristics_age_at_diagnosis`, `characteristics_estrogen_receptor_status`,
                  `factor_value_tumor_stage`, `factor_value_tumor_grading`,
                  `factor_value_family_history`))

colnames(ArrExp) <- stri_replace_all_fixed(colnames(ArrExp), c("characteristics_","factor_value_"), c("", ""), vectorize=F)
#use cel files.
#a <- as.data.frame(names(ArrExp))

#Metabric
Metabric_clinical_sample <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Metabric/data_clinical_sample.txt")
Metabric_clinical_patient <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Metabric/data_clinical_patient.txt")
Expr_Data <- read_tsv("C:/Users/DrPanks/Desktop/Datasets/Metabric/data_expression_median.txt")

#GEO

#pData(X) ## print the sample information
#fData(X) ## print the gene annotation
#exprs(X) ## print the expression data

GSE7390 <- getGEO('GSE2990')

#GSE6532
GSE6532 <- getGEO('GSE6532')
#Selected GPL96 becaust in the journal article the authors state that they used was U133A chips
GSE6532_GPL96_pData <- pData(GSE6532[[2]])
GSE6532_GPL96_exprData <- exprs(GSE6532[[2]])


#GSE35629
#Paper states that there are 83 samples and the total number across all platforms is 83 as well
GSE35629 <- getGEO('GSE35629')
#treat eachPlatform and GES ID combination as separate
GSE6532_GPL1390_pData <- pData(GSE35629[[1]])
GSE6532_GPL5325_pData <- pData(GSE35629[[2]])
GSE6532_GPL887_pData <- pData(GSE35629[[3]])

GSE6532_GPL1390_exprData <- exprs(GSE35629[[1]])
GSE6532_GPL5325_exprData <- exprs(GSE35629[[2]])
GSE6532_GPL887_exprData <- exprs(GSE35629[[3]])

#GSE41400
GSE41400 <- getGEO('GSE41400')
GSE41400_pData <- pData(GSE41400[[1]])
GSE41400_exprData <- exprs(GSE41400[[1]])

#GSE46581
GSE46581 <- getGEO('GSE46581')
GSE46581_pData <- pData(GSE46581[[1]])
GSE46581_exprData <- exprs(GSE46581[[1]])

#GSE81540 consists of 2 SubSeries GSE81538 & GSE96058
GSE81538 <- getGEO('GSE81538')
GSE81538_pData <- pData(GSE81538[[1]])
#expression data empty
GSE81538_exprData <- exprs(GSE81538[[1]])

#GSE96058
GSE96058 <- getGEO('GSE96058')
#treat eachPlatform and GES ID combination as separate
GSE96058_GPL11154_pData <- pData(GSE96058[[1]])
GSE96058_GPL18573_pData <- pData(GSE96058[[2]])
#expression data empty
GSE96058_GPL11154_exprData <- exprs(GSE96058[[1]])
GSE96058_GPL18573_exprData <- exprs(GSE96058[[2]])


#GSE118646
GSE118646 <- getGEO('GSE118646')
GSE118646_pData <- pData(GSE118646[[1]])
GSE118646_exprData <- exprs(GSE118646[[1]])

#GSE5364
GSE5364 <- getGEO('GSE5364')
GSE5364_pData <- pData(GSE5364[[1]])
GSE5364_exprData <- exprs(GSE5364[[1]])

#GSE18229
#treat eachPlatform and GES ID combination as separate
GSE18229 <- getGEO('GSE18229')
GSE18229_GPL1390_pData <- pData(GSE18229[[1]])
#GSE18229_GPL1708_pData <- pData(GSE18229[[2]])
GSE18229_GPL5325_pData <- pData(GSE18229[[3]])
GSE18229_GPL6607_pData <- pData(GSE18229[[4]])
#GSE18229_GPL7504_pData <- pData(GSE18229[[5]])
GSE18229_GPL885_pData <- pData(GSE18229[[6]])
GSE18229_GPL887_pData <- pData(GSE18229[[7]])

GSE18229_GPL1390_exprData <- exprs(GSE18229[[1]])
GSE18229_GPL5325_exprData <- exprs(GSE18229[[2]])
GSE18229_GPL887_exprData <- exprs(GSE18229[[3]])
GSE18229_GPL887_exprData <- exprs(GSE18229[[4]])
GSE18229_GPL887_exprData <- exprs(GSE18229[[5]])
GSE18229_GPL887_exprData <- exprs(GSE18229[[6]])
GSE18229_GPL887_exprData <- exprs(GSE18229[[7]])


#GSE62944
GSE62944 <- read_tsv("GSE62944_06_01_15_TCGA_24_548_Clinical_Variables_9264_Samples.txt", col_names = F)
CancerTypes <- read_tsv("C:/Users/DrPanks/Desktop/Normalization/data/GSE62944/GSE62944_06_01_15_TCGA_24_CancerType_Samples.txt", col_names = F)
colnames(CancerTypes) <- c("Sampleid", "cancertype")
BRCA <- CancerTypes %>% dplyr::filter(CancerTypes$cancertype == "BRCA")
BRCA_list <- BRCA$Sampleid

GSE62944 <- read_tsv("C:/Users/DrPanks/Desktop/Normalization/data/GSE62944/GSM1536837_06_01_15_TCGA_24.tumor_Rsubread_TPM.txt")
GSE62944 <- column_to_rownames(GSE62944, "X1")
GSE62944_filt <- dplyr::select(GSE62944, all_of(BRCA_list))


GSE81540_11154 <- read_tsv("GSE81540_11154_Annotations.tsv")
GSE81540_18573 <- read_tsv("GSE81540_18573_Annotations.tsv")



# big_list <- GSE11121 %>% rbind(GSE1561) %>% rbind(GSE20181) %>% rbind(GSE2109) %>% 
#    rbind(GSE22513) %>% rbind(GSE2603) %>% rbind(GSE28796) %>% rbind(GSE28821) %>% 
#    rbind(GSE2990) %>% rbind(GSE3494) %>% rbind(GSE7390) %>% rbind(GSE7904) %>% 
#    rbind(GSE86374)

install.packages("readxl")
library("readxl")
unified <- read_excel("unified.xlsx")
single <- as.data.frame(dplyr::coalesce(unified$`Variable name...1`, unified$`Variable name...3`))
write_tsv(single, "single.tsv")





