#This will convert .gottcha.tsv files to comp file format

#NOTE, DATA IN EACH COLUMN DOES NOT ALIGN WITH ONE ANOTHER DUE TO OUTPUT FORMAT OF GOTTCHA


library(dplyr)
library(readr)

input_files <- commandArgs(trailingOnly = TRUE)
inputfile <- read_tsv(file = input_files[1], col_names=TRUE)
outputfile <- input_files[2]
 
#for debugging 
#inputfile <- read_tsv(file = '~/Desktop/tool_comparison/gottcha/raw_data/001_bear_unmapped.gottcha.tsv', col_names=TRUE)

inphylum <- inputfile %>% filter(LEVEL == 'phylum')
inclass <- inputfile %>% filter(LEVEL == 'class')
inorder <- inputfile %>% filter(LEVEL == 'order')
infamily <- inputfile %>% filter(LEVEL == 'family')
ingenus <- inputfile %>% filter(LEVEL == 'genus')
inspecies <- inputfile %>% filter(LEVEL == 'species')

#do some length checks
if(nrow(inphylum) == 0) {
  inphylum <- data.frame("LEVEL"=NA,"TAXA"=NA)
}
if(nrow(inclass) == 0) {
  inclass <- data.frame("LEVEL"=NA,"TAXA"=NA)
}
if(nrow(inorder) == 0) {
  inorder <- data.frame("LEVEL"=NA,"TAXA"=NA)
}
if(nrow(infamily) == 0) {
  infamily <- data.frame("LEVEL"=NA,"TAXA"=NA)
}
if(nrow(ingenus) == 0) {
  ingenus <- data.frame("LEVEL"=NA,"TAXA"=NA)
}
if(nrow(inspecies) == 0) {
  inspecies <- data.frame("LEVEL"=NA,"TAXA"=NA)
}

ncbi <- data.frame("NCBI-TaxID" = 0, "Kingdom" = NA)
reads_abund <- data.frame("Number_of_Reads" = 0, "Relative_Abundance" = 0)

merged_precomp <- cbind(ncbi$NCBI.TaxID, ncbi$Kingdom, inphylum$TAXA, inclass$TAXA, inorder$TAXA, infamily$TAXA, ingenus$TAXA, inspecies$TAXA, reads_abund$Number_of_Reads, reads_abund$Relative_Abundance)
merged_precomp <- as.data.frame(merged_precomp)

colnames(merged_precomp) <- c("NCBI-TaxID", "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species", "Number_of_Reads", "Relative_Abundance")

merged_precomp$Species <- '<not present>'

write.table(merged_precomp, file = outputfile, sep = '\t', col.names=TRUE, row.names=FALSE, quote=FALSE)

