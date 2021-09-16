testFunc <- function(gseID) {
  #Read in gene expression data TSV file
  df<- read_tsv(paste0("C:/Users/DrPanks/Desktop/Datasets/Refinebio/Data/", gseID, "/", gseID, ".tsv"))
  
  #Read in metadata TSV file
  meta <-  read_tsv(paste0("C:/Users/DrPanks/Desktop/Datasets/Refinebio/Data/", gseID, "/metadata_",  gseID, ".tsv"), na = c("", "NA", "na")) %>% 
    clean_names() %>% 
    remove_empty()
  
  #create vector to store column names that should be ignored
  excludeColumn = c("experiment_accession", "refinebio_accession_code", "sex")

  #create empty vector to store column names that should be removed
  cols_to_remove = NULL

  print(paste0("Here are the automatic results for ", gseID))

  for(i in seq_along(meta)) {
    columnName = colnames(meta)[i]
    aCol <- pull(meta, i)
    aCol <- aCol[!is.na(aCol)]

    #check numeric values (this is because some datasets might have different values in a variable e.g age, and will be removed in the second loop)
    if (is.numeric(meta[, i])) {
      next
    }

    if (!(columnName %in% excludeColumn)) {
       if (length(unique(aCol)) == 1){
         print(paste0("All of the values in the ", columnName, " column are the same: ", aCol[1]))
         cols_to_remove = c(cols_to_remove, columnName)
       }
       else{
         if (length(aCol) == length(unique(aCol))){
           print(paste0("All of the values in the ", columnName, " column are different. Examples: ", aCol[1], ", ", aCol[2]))
           cols_to_remove = c(cols_to_remove, columnName)
         }
         else {
           print(paste0("Some of the values in the ", columnName, " column are the same. Examples: ", unique(aCol)[1], ", ", unique(aCol)[2]))
         }
       }
     }
   }

  #Remove unwanted columns
  meta <- meta %>% dplyr::select(-all_of(cols_to_remove))

  #summarize Min, Mean, Max
  myMatrix <- meta %>%
    mutate(refinebio_accession_code = factor(refinebio_accession_code)) %>%
    mutate(experiment_accession = factor(experiment_accession)) %>%
    select_if(negate(is.character))

  myMatrix <- myMatrix %>%
    pivot_longer(3:ncol(myMatrix),
                 names_to = "Variable",
                 values_to = "Value") %>%
    group_by(experiment_accession, Variable) %>%
    summarise(
      Min = min(Value, na.rm = T),
      Mean = mean(Value, na.rm = T),
      Max = max(Value, na.rm = T),
      Num_unique = length(unique(Value))
    ) %>%
    dplyr::filter(Num_unique > 1) %>%
    dplyr::select(-Num_unique)
  
  #summarize unique character values
  summary_Char <- meta %>% dplyr::select(c("experiment_accession", "refinebio_accession_code"))
  charMatrix <- meta %>%
    mutate(refinebio_accession_code = factor(refinebio_accession_code)) %>%
    mutate(experiment_accession = factor(experiment_accession)) %>%
    select_if(negate(is.numeric))

  data2 <- charMatrix %>%
    pivot_longer(3:ncol(charMatrix)) %>%
     group_by(experiment_accession, name) %>%
     summarize(unique_summary = paste(unique(sort(value)), collapse=","))

  return (list(df = df, metadata = meta, numSummary = myMatrix, charSummary = data2))#, charSummary = newChar))
    
}
































# data = tribble(~datasetid, ~sampleid, ~mycol1, ~mycol2,
#                "GSE123", "GSM1", "abc",   "def",
#                "GSE123", "GSM2", "ghi",   "abc",
#                "GSE123", "GSM3", "abc",   "ghi")
# 
# data2 = pivot_longer(data, mycol1:mycol2) %>%
#   group_by(datasetid, name) %>%
#   summarize(unique_summary = paste(value, collapse=","))
# 
# View(data2)


# testFunc <- function(Dataset) {
#   
#   myMatrix <- remove_empty(Dataset$metadata, which = "cols") %>%
#     mutate(refinebio_accession_code = factor(refinebio_accession_code)) %>%
#     mutate(experiment_accession = factor(experiment_accession)) #%>%
#     #select_if(negate(is.character))
#   
#    
#   #.col = is.numeric,
#   
#   return(myMatrix)
# }

