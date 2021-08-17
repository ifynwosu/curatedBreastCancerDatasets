source("LoadLibraries.R")
source("filterVariables.R")
source("attributeList.R")

GSE11121 <- filterVariables("GSE11121") %>% attributeList()
GSE7390 <- filterVariables("GSE7390") %>% attributeList()
GSE19697 <- filterVariables("GSE19697") %>% attributeList()

combinedList <- GSE11121 %>% rbind(GSE7390) %>% rbind(GSE19697)

write_tsv(combinedList, "combinedList.tsv")
