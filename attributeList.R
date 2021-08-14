attributeList <- function(Dataset) {
  
  myMatrix <- remove_empty(Dataset$metadata, which = "cols") %>%
    group_by(experiment_accession) %>%
    summarise(across(
      .col = is.numeric, 
      .fns = list(Min = min, Mean = mean, Max = max), 
      .names = "{col}.{fn}")) %>%
    pivot_longer(
      cols = !experiment_accession,
      names_to = "Attribute",
      values_to = "Value")

   return(myMatrix)
}