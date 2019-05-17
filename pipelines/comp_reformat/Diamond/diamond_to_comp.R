#This script is designed to get from diamond pre-comps to a comp file format
#To obtain the precomp ---
# 1) Form diamond classification - ie diamond blastx --more-sensitive --db ~/data/diamond/database.dmnd -q  001_contigs.fasta -o 001.dmnd --threads 14 -f102
# 2) Isolate NCBI ID's -- cat 001.dmnd | cut -f 2 > 001_ncbi.dmnd
# 3) launch script locally to find taxon information: taxid.py 001_ncbi.dmnd > 001.dmnd.preprecomp
# 4) find unique values with some counts cat 001.dmnd.preprecomp | sort | uniq -c > 001.dmnd.precomp
# 4) call this script with the filename Rscript script.R 001.dmnd.precomp

library(dplyr)
library(readr)
library(tidyr)

cmdargs = commandArgs(trailingOnly=TRUE) 

#Load precomp file
precomp <- read_tsv(file=cmdargs[1], col_names=FALSE)

#Filter out some useless values
precomp <- precomp %>% filter(X1 != '1 NCBI-TaxID')

#sub <not found> with NA
precomp <- data.frame(lapply(precomp, function(x){
  gsub("<not present>", "NA", x)
}))

colnames(precomp) <- c('reads_ncbi_ID', 'Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species')

#split column 1 into reads / and ncbi id
pre_comp_sep <- separate(data=precomp, col=reads_ncbi_ID, into=c('Reads', 'NCBI_ID'), sep=' ')

#Add in relative abundance
pre_comp_sep$Relative_Abundance = 0

#adjust order
comp_file <- pre_comp_sep %>% select('NCBI_ID', 'Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species', 'Reads', 'Relative_Abundance')

#filter out ncbi id = 1
comp_file <- comp_file %>% filter(NCBI_ID != 1)

#readjust column names
colnames(comp_file) <- c("NCBI-TaxID", "Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species", "Number_of_Reads", "Relative_Abundance")

# write new comp file
write.table(comp_file, file = cmdargs[2], sep = '\t', col.names=TRUE, row.names=FALSE, quote=FALSE)


