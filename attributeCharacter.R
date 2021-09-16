attributeCharacter <- function(Dataset) {
  
  myMatrix <- remove_empty(Dataset$metadata, which = "cols") %>%
    mutate(refinebio_accession_code = factor(refinebio_accession_code)) %>%
    mutate(experiment_accession = factor(experiment_accession)) %>%
    select_if(negate(is.numeric))
  
  
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
    dplyr::filter(Num_unique > 10) %>%
    dplyr::select(-Num_unique)
  
  #.col = is.numeric,
  
  return(myMatrix)
}
