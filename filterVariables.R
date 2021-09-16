filterVariables <- function(gseID) {
  #Read in metadata TSV file
   metadata <-  read_tsv(paste0("C:/Users/DrPanks/Desktop/Datasets/Refinebio/Data/", gseID, "/metadata_",  gseID, ".tsv"), na = c("", "NA", "na")) %>% 
     clean_names() %>% 
      dplyr::select(c(`refinebio_accession_code`, `experiment_accession`, `refinebio_age`, `refinebio_disease_stage`,
                    `refinebio_race`, `refinebio_sex`, `refinebio_treatment`, `aol_os_10y`,
                    `angioinv`, `histtype`, `lymp_infil`, `npi`, `surgery_type`, `administration`,
                    `age_at_dx`, `agent`, `all_lymph_nodes`, `binary_5y_met_event`,
                    `biomaterial_provider_ch1`, `bm_event`, `bmfs_yr`, `disease_state`,
                    `distant_rfs`, `dose`, `e_dmfs`, `e_os`, `e_rfs`, `e_tdm`, `er`, `ggi`, `grade`,
                    `her2_status`, `lm_event`, `lmfs_yr`, `met_event`, `mfs_yr`,
                    `molecular_subtype`, `node`, `path_er_status`, `path_pr_status`,
                    `pathological_complete_response`, `population`, `pos_lymph_nodes`, `risk_aol`,
                    `risknpi`, `risksg`, `sample`, `size`, `size_in_cm`, `t_dmfs`, `t_os`, `t_rfs`,
                    `t_tdm`, `theraoy`, `time`, `time_rfs`, `tissue`, `tissue_type`,
                    `tumor_size_cm`, `vant_veer_signature`, `veridex_risk`))
   
   #metadata <- as.data.frame(colSums(!is.na(metadata)))
   #The code below may give a similar output
   #df %>% summarise_all(funs(sum(!is.na(.)))

  # Read in data TSV file
  df<- read_tsv(paste0("C:/Users/DrPanks/Desktop/Datasets/Refinebio/Data/", gseID, "/", gseID, ".tsv")) #%>%
  #   tibble::column_to_rownames("Gene")
  
  return (list(df = df, metadata = metadata))
  
}

