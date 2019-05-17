# Reformat Kaiju output to comp - file must be kaiju report with taxon names added that has undergone unique and counts
# cat kaiju_with_taxon_paths.txt | cut -f 3,4 | sort | uniq -c > rscript_input.file

# call Rscript inputfile outputfile

library(dplyr)
library(readr)
library(tidyr)

# load input
cmdargs = commandArgs(trailingOnly=TRUE)

#check file exists
if (file.exists(cmdargs[1])){
  print(paste0("Transforming File: ", cmdargs[1]))
} else {
  stop(paste0(cmdargs[1], "<-- File not Found."))
}
if (file.exists(cmdargs[2])){
  stop(paste0(cmdargs[2], " already exists, don't overwrite it. That would be silly."))
}


kaiju_file <- read_tsv(file=cmdargs[1], col_names=c('reads_ncbi_ID', 'Taxon_info'))

#Do some splitting and formatting
kaiju_sep <- separate(data= kaiju_file, col=reads_ncbi_ID, into=c('Reads', 'NCBI_ID'), sep=' ')
kaiju_fix <- separate(data=kaiju_sep, col=Taxon_info, into=c('Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'), sep='; ')
kaiju_spp_fix <- separate(data=kaiju_fix, col=Species, into=c('Species', 'unwanted'), sep=';')

#form comp file format
comp_file <- kaiju_spp_fix %>% select('NCBI_ID', 'Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species', 'Reads')

#set relative abundance column - to be altered later
comp_file$Relative_Abundance = 0

colnames(comp_file) <- c("NCBI-TaxID", "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species", "Number_of_Reads", "Relative_Abundance")


# write new comp file
write.table(comp_file, file = cmdargs[2], sep = '\t', col.names=TRUE, row.names=FALSE, quote=FALSE)



