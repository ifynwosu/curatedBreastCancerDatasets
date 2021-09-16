testFunc <- function(Dataset) {
  
  myMatrix <- remove_empty(Dataset$metadata, which = "cols") %>%
    mutate(refinebio_accession_code = factor(refinebio_accession_code)) %>%
    mutate(experiment_accession = factor(experiment_accession)) #%>%
    #select_if(negate(is.character))
  

  
  #.col = is.numeric,
  
  return(myMatrix)
}
