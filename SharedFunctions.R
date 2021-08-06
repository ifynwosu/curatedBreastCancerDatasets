parseGSE <- function(gseID) {
  # Read in data TSV file
  metadata <-  read_tsv(paste0("C:/Users/DrPanks/Desktop/PhD_Project/Metaanalysis/data/trim_", gseID, ".tsv"))
  
  # Read in data TSV file
  df<- read_tsv(paste0("C:/Users/DrPanks/Desktop/Datasets/RefineBio/New_Data/", gseID, "/", gseID, ".tsv")) %>%
    tibble::column_to_rownames("Gene")
  
  # Make the data in the order of the metadata
  df <- df %>%  dplyr::select(metadata$SampleID)
  
  # Check if this is in the same order
  all.equal(colnames(df), metadata$SampleID)
  
  #create vector of minimum row values
  df_min <- apply(df, 1, min)
  
  #subtract minimum value from each element in row
  df <- sweep(df, 1, df_min,"-")
  
  #add "1" to each value in matrix
  df <- sweep(df, 1, 1, "+")
  
  #log transform values
  df = log2(df)
  
  #filter out NA values as well as other races
  metadata <- metadata %>% 
    dplyr::filter(Race %in% c("Black", "White")) %>%
    dplyr::filter(!is.na(Race))
  
  #get sample IDs
  common_SampleID <- pull(metadata, SampleID)
  
  #make new dataframe with commom sampleIDs
  df = df[, common_SampleID] #%>%
    #rownames_to_column(var = "Gene")
  
  #select only samples in metadata file (black and white patients)
  df <- df %>% dplyr::select(metadata$SampleID)

  #fit limma model
  design <- model.matrix(~ metadata$Race)
  fit <- lmFit(df, design)
  fit <- eBayes(fit)
  stats <- topTable(fit, number = nrow(df), confint=TRUE) %>% tibble::rownames_to_column("Gene") %>% 
    cbind(gseID)
  
  rm(common_SampleID, df_min)

  return (list(df = df, metadata = metadata, stats = stats))
  
}

