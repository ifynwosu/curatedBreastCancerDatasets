attributeList <- function(Dataset) {
  
  myMatrix <- remove_empty(Dataset$metadata, which = "cols") 
  
  myMatrix <- myMatrix %>% 
    pivot_longer(3:ncol(myMatrix),
      names_to = "Variable",
      values_to = "Value") %>%
    group_by(experiment_accession, Variable) %>%
    summarise(Min = min(Value), Mean = mean(Value), Max = max(Value))
  
  #.col = is.numeric,

   return(myMatrix)
}