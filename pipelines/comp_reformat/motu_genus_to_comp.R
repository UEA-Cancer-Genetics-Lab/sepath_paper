# This script will convert a given motu output file (at genus level) to COMP 

#Notes: only genus level classification obtained, classifications > 0 kept, classificaitons = 0 dropped
# REMOVE FIRST TWO LINES OF MOTU OUTPUT FIRST SO IT CAN BE READ AS TSV
#call - script.R inputfile outputfile
# will automatically set NCBI ID to 999999 (only relevant for species performance) and number of reads to 1

library(tidyverse)

input_files <- commandArgs(trailingOnly = TRUE)
#debugging
#input_files <- c('/Users/agihawi/Desktop/tool_comparison/motu/genus_output/001_genus.motus', '001.comp')

inputfile <- read_tsv(file = input_files[1], col_names=TRUE)
outputfile <- input_files[2]

colnames(inputfile) <- c('Genus','Abundance')

inputfile_filt <- inputfile %>% filter(Abundance > 0)

#genus name '-1' was found -- remove this and 'genus'
inputfile_filt <- inputfile_filt %>% filter(Genus != '-1')
inputfile_filt <- inputfile_filt %>% filter(Genus != 'Genus')

out_df <- data.frame("NCBI-TaxID" = c(rep('999999', nrow(inputfile_filt))), "Kingdom" = c(rep('<not present>', nrow(inputfile_filt))), 
                     "Phylum" = c(rep('<not present>', nrow(inputfile_filt))), "Class" = c(rep('<not present>', nrow(inputfile_filt))), 
                     "Order" = c(rep('<not present>', nrow(inputfile_filt))), "Family" = c(rep('<not present>', nrow(inputfile_filt))), 
                     "Genus" = inputfile_filt$Genus, "Species" = c(rep('<not present>', nrow(inputfile_filt))), 
                     "Number_of_Reads" = c(rep('1', nrow(inputfile_filt))), "Relative_Abundance" = inputfile_filt$Abundance)

#added rename column names as ncbi id was being produced as 'NCBI.TaxID' preventing accurate performance estimation
colnames(out_df) <- c("NCBI-TaxID", "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species", "Number_of_Reads", "Relative_Abundance")

write.table(out_df, file = outputfile, sep = '\t', col.names=TRUE, row.names=FALSE, quote=FALSE)
