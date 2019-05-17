if(!require(readr)){install.packages("readr")}
if(!require(dplyr)){install.packages("dplyr")}

#this script will return shared consensus genera between comp files
#call script.R input_comp1 input_comp2 output_comp 

#obtain command line arguments
cmdargs = commandArgs(trailingOnly=TRUE)
final_filename = cmdargs[3]

#check files exist
if (file.exists(cmdargs[1])){
  print(paste0("File one : ", cmdargs[1]))
} else {
  stop(paste0(cmdargs[1], "<-- File not Found."))
}
if (file.exists(cmdargs[2])){
  print(paste0("File one : ", cmdargs[2]))
} else {
  stop(paste0(cmdargs[2], "<-- File not Found."))
}


#load comp files
comp_1 <- read_tsv(file=cmdargs[1], col_names=TRUE)
comp_2 <- read_tsv(file=cmdargs[2], col_names=TRUE)

#script development and debugging purposes
#comp_1 <- read_tsv(file='~/Desktop/sepath_paper/pathseq/consensus_approach/spades_kraken/4_thresh/001_4thresh.comp', col_names=TRUE)
#comp_2 <- read_tsv(file='~/Desktop/sepath_paper/pathseq/consensus_approach/pathseq_1filt/001_filt.comp', col_names=TRUE)
#comp_3  <- read_tsv(file='~/Desktop/sepath_paper/pathseq/consensus_approach/motu_genus/001.comp', col_names=TRUE)

#store one later dataframe for easy column renaming
comp_names <- colnames(comp_1)

#select only genus
comp_1 <- comp_1 %>% select(Genus)
comp_2 <- comp_2 %>% select(Genus)

#filter out NA results
comp_1 <- comp_1 %>% filter(!is.na(Genus))
comp_2 <- comp_2 %>% filter(!is.na(Genus))

#ensure each approach only mentions each genera present once
Genera_1 <- unique(comp_1$Genus)
Genera_2 <- unique(comp_2$Genus)

#this line obtains consensus taxa as the intersect between two datasets
consensus_taxa <- data.frame(Genus = unique(intersect(Genera_1, Genera_2)))

#set length of shared taxa for data frame creation
taxa <- length(consensus_taxa$Genus)
not_present = rep('<not present>', taxa)
ones <- rep(1,taxa)

#create dataframe of shared taxa
shared_df <- data.frame('NCBI' = ones,
                        'Kingdom' = not_present,
                        'Phylum' = not_present,
                        'Class' = not_present,
                        'Order' = not_present,
                        'Family' = not_present,
                        'Genus' = consensus_taxa,
                        'Species' = not_present,
                        'Number_of_Reads' = ones,
                        'Relative_Abundance' = ones)

#reset column names to original df just in case
colnames(shared_df) <- comp_names

#save the new formed file
write.table(shared_df, file=final_filename, col.names=TRUE, row.names=FALSE, quote=FALSE, sep='\t')




