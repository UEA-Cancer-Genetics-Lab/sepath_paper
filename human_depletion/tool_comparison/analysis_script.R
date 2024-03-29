library(tidyverse)
library(ggpubr)
#script to compare human vs bacterial reads following human read depletion
#warning, quick and dirty script, not pretty


#### read in true files ####
true_001 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/001_seq_counts', col_names=c('filename', 'reads'))
true_003 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/003_seq_counts', col_names=c('filename', 'reads'))
true_011 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/011_seq_counts', col_names=c('filename', 'reads'))
true_014 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/014_seq_counts', col_names=c('filename', 'reads'))
true_022 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/022_seq_counts', col_names=c('filename', 'reads'))
true_025 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/025_seq_counts', col_names=c('filename', 'reads'))
true_002 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/002_seq_counts', col_names=c('filename', 'reads'))
true_004 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/004_seq_counts', col_names=c('filename', 'reads'))
true_012 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/012_seq_counts', col_names=c('filename', 'reads'))
true_015 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/015_seq_counts', col_names=c('filename', 'reads'))
true_024 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/true_counts/024_seq_counts', col_names=c('filename', 'reads'))


#form bacteria vs human for true reads
human001 <- true_001 %>% filter(filename == 'GRCh38.fasta')
true_001 <- true_001 %>% filter(filename != 'GRCh38.fasta')
true_001 <- data.frame( human_reads = sum(human001$reads), 
                        bacterial_reads = sum(true_001$reads),
                        dataset='001',
                        condition='truth')

human003 <- true_003 %>% filter(filename == 'GRCh38.fasta')
true_003 <- true_003 %>% filter(filename != 'GRCh38.fasta')
true_003 <- data.frame( human_reads = sum(human003$reads), 
                        bacterial_reads = sum(true_003$reads),
                        dataset='003',
                        condition='truth')

human011 <- true_011 %>% filter(filename == 'GRCh38.fasta')
true_011 <- true_011 %>% filter(filename != 'GRCh38.fasta')
true_011 <- data.frame( human_reads = sum(human011$reads), 
                        bacterial_reads = sum(true_011$reads),
                        dataset='011',
                        condition='truth')

human014 <- true_014 %>% filter(filename == 'GRCh38.fasta')
true_014 <- true_014 %>% filter(filename != 'GRCh38.fasta')
true_014 <- data.frame( human_reads = sum(human014$reads), 
                        bacterial_reads = sum(true_014$reads),
                        dataset='014',
                        condition='truth')

human022 <- true_022 %>% filter(filename == 'GRCh38.fasta')
true_022 <- true_022 %>% filter(filename != 'GRCh38.fasta')
true_022 <- data.frame( human_reads = sum(human022$reads), 
                        bacterial_reads = sum(true_022$reads),
                        dataset='022',
                        condition='truth')

human025 <- true_025 %>% filter(filename == 'GRCh38.fasta')
true_025 <- true_025 %>% filter(filename != 'GRCh38.fasta')
true_025 <- data.frame( human_reads = sum(human025$reads), 
                        bacterial_reads = sum(true_025$reads),
                        dataset='025',
                        condition='truth')

human002 <- true_002 %>% filter(filename == 'GRCh38.fasta')
true_002 <- true_002 %>% filter(filename != 'GRCh38.fasta')
true_002 <- data.frame( human_reads = sum(human002$reads), 
                        bacterial_reads = sum(true_002$reads),
                        dataset='002',
                        condition='truth')

human004 <- true_004 %>% filter(filename == 'GRCh38.fasta')
true_004 <- true_004 %>% filter(filename != 'GRCh38.fasta')
true_004 <- data.frame( human_reads = sum(human004$reads), 
                        bacterial_reads = sum(true_004$reads),
                        dataset='004',
                        condition='truth')

human012 <- true_012 %>% filter(filename == 'GRCh38.fasta')
true_012 <- true_012 %>% filter(filename != 'GRCh38.fasta')
true_012 <- data.frame( human_reads = sum(human012$reads), 
                        bacterial_reads = sum(true_012$reads),
                        dataset='012',
                        condition='truth')

human015 <- true_015 %>% filter(filename == 'GRCh38.fasta')
true_015 <- true_015 %>% filter(filename != 'GRCh38.fasta')
true_015 <- data.frame( human_reads = sum(human015$reads), 
                        bacterial_reads = sum(true_015$reads),
                        dataset='015',
                        condition='truth')  

human024 <- true_024 %>% filter(filename == 'GRCh38.fasta')
true_024 <- true_024 %>% filter(filename != 'GRCh38.fasta')
true_024 <- data.frame( human_reads = sum(human024$reads), 
                        bacterial_reads = sum(true_024$reads),
                        dataset='024',
                        condition='truth')

#merge all truth results
truth <- rbind(true_001, true_002, true_003, true_004, true_011, true_012, true_014, true_015, true_022, true_024, true_025)

rm(true_001, true_002, true_003, true_004, true_011, true_012, true_014, true_015, true_022, true_024, true_025)
rm(human001, human002, human003, human004, human011, human012, human014, human015, human022, human025, human024)



#### load in bbduk files in same fashion ####
bbduk_001 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/001_seq_counts', col_names=c('filename', 'reads'))
bbduk_003 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/003_seq_counts', col_names=c('filename', 'reads'))
bbduk_011 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/011_seq_counts', col_names=c('filename', 'reads'))
bbduk_014 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/014_seq_counts', col_names=c('filename', 'reads'))
bbduk_022 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/022_seq_counts', col_names=c('filename', 'reads'))
bbduk_025 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/025_seq_counts', col_names=c('filename', 'reads'))
bbduk_002 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/002_seq_counts', col_names=c('filename', 'reads'))
bbduk_004 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/004_seq_counts', col_names=c('filename', 'reads'))
bbduk_012 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/012_seq_counts', col_names=c('filename', 'reads'))
bbduk_015 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/015_seq_counts', col_names=c('filename', 'reads'))
bbduk_024 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk/024_seq_counts', col_names=c('filename', 'reads'))

#form bacteria vs human for bbduk reads
human001 <- bbduk_001 %>% filter(filename == 'GRCh38.fasta')
bbduk_001 <- bbduk_001 %>% filter(filename != 'GRCh38.fasta')
bbduk_001 <- data.frame( human_reads = sum(human001$reads),
                         bacterial_reads = sum(bbduk_001$reads),
                         dataset='001',
                         condition='bbduk')

human003 <- bbduk_003 %>% filter(filename == 'GRCh38.fasta')
bbduk_003 <- bbduk_003 %>% filter(filename != 'GRCh38.fasta')
bbduk_003 <- data.frame( human_reads = sum(human003$reads),
                         bacterial_reads = sum(bbduk_003$reads),
                         dataset='003',
                         condition='bbduk')

human011 <- bbduk_011 %>% filter(filename == 'GRCh38.fasta')
bbduk_011 <- bbduk_011 %>% filter(filename != 'GRCh38.fasta')
bbduk_011 <- data.frame( human_reads = sum(human011$reads),
                         bacterial_reads = sum(bbduk_011$reads),
                         dataset='011',
                         condition='bbduk')

human014 <- bbduk_014 %>% filter(filename == 'GRCh38.fasta')
bbduk_014 <- bbduk_014 %>% filter(filename != 'GRCh38.fasta')
bbduk_014 <- data.frame( human_reads = sum(human014$reads),
                         bacterial_reads = sum(bbduk_014$reads),
                         dataset='014',
                         condition='bbduk')

human022 <- bbduk_022 %>% filter(filename == 'GRCh38.fasta')
bbduk_022 <- bbduk_022 %>% filter(filename != 'GRCh38.fasta')
bbduk_022 <- data.frame( human_reads = sum(human022$reads),
                         bacterial_reads = sum(bbduk_022$reads),
                         dataset='022',
                         condition='bbduk')

human025 <- bbduk_025 %>% filter(filename == 'GRCh38.fasta')
bbduk_025 <- bbduk_025 %>% filter(filename != 'GRCh38.fasta')
bbduk_025 <- data.frame( human_reads = sum(human025$reads),
                         bacterial_reads = sum(bbduk_025$reads),
                         dataset='025',
                         condition='bbduk')

human002 <- bbduk_002 %>% filter(filename == 'GRCh38.fasta')
bbduk_002 <- bbduk_002 %>% filter(filename != 'GRCh38.fasta')
bbduk_002 <- data.frame( human_reads = sum(human002$reads),
                         bacterial_reads = sum(bbduk_002$reads),
                         dataset='002',
                         condition='bbduk')

human004 <- bbduk_004 %>% filter(filename == 'GRCh38.fasta')
bbduk_004 <- bbduk_004 %>% filter(filename != 'GRCh38.fasta')
bbduk_004 <- data.frame( human_reads = sum(human004$reads),
                         bacterial_reads = sum(bbduk_004$reads),
                         dataset='004',
                         condition='bbduk')

human012 <- bbduk_012 %>% filter(filename == 'GRCh38.fasta')
bbduk_012 <- bbduk_012 %>% filter(filename != 'GRCh38.fasta')
bbduk_012 <- data.frame( human_reads = sum(human012$reads),
                         bacterial_reads = sum(bbduk_012$reads),
                         dataset='012',
                         condition='bbduk')

human015 <- bbduk_015 %>% filter(filename == 'GRCh38.fasta')
bbduk_015 <- bbduk_015 %>% filter(filename != 'GRCh38.fasta')
bbduk_015 <- data.frame( human_reads = sum(human015$reads),
                         bacterial_reads = sum(bbduk_015$reads),
                         dataset='015',
                         condition='bbduk')  

human024 <- bbduk_024 %>% filter(filename == 'GRCh38.fasta')
bbduk_024 <- bbduk_024 %>% filter(filename != 'GRCh38.fasta')
bbduk_024 <- data.frame( human_reads = sum(human024$reads),
                         bacterial_reads = sum(bbduk_024$reads),
                         dataset='024',
                         condition='bbduk')

#form single data frame of all bbduk results
bbduk <- rbind(bbduk_001, bbduk_002, bbduk_003, bbduk_004, bbduk_011, bbduk_012, bbduk_014, bbduk_015, bbduk_022, bbduk_024, bbduk_025)

rm(bbduk_001, bbduk_002, bbduk_003, bbduk_004, bbduk_011, bbduk_012, bbduk_014, bbduk_015, bbduk_022, bbduk_024, bbduk_025)
rm(human001, human002, human003, human004, human011, human012, human014, human015, human022, human025, human024)




       

#### load in bwa files in same fashion ####
bwa_001 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/001_seq_counts', col_names=c('filename', 'reads'))
bwa_003 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/003_seq_counts', col_names=c('filename', 'reads'))
bwa_011 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/011_seq_counts', col_names=c('filename', 'reads'))
bwa_014 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/014_seq_counts', col_names=c('filename', 'reads'))
bwa_022 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/022_seq_counts', col_names=c('filename', 'reads'))
bwa_025 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/025_seq_counts', col_names=c('filename', 'reads'))
bwa_002 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/002_seq_counts', col_names=c('filename', 'reads'))
bwa_004 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/004_seq_counts', col_names=c('filename', 'reads'))
bwa_012 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/012_seq_counts', col_names=c('filename', 'reads'))
bwa_015 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/015_seq_counts', col_names=c('filename', 'reads'))
bwa_024 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa/024_seq_counts', col_names=c('filename', 'reads'))

#form bacteria vs human for bwa reads
human001 <- bwa_001 %>% filter(filename == 'GRCh38.fasta')
bwa_001 <- bwa_001 %>% filter(filename != 'GRCh38.fasta')
bwa_001 <- data.frame( human_reads = sum(human001$reads),
                       bacterial_reads = sum(bwa_001$reads),
                       dataset='001',
                       condition='bwa')

human003 <- bwa_003 %>% filter(filename == 'GRCh38.fasta')
bwa_003 <- bwa_003 %>% filter(filename != 'GRCh38.fasta')
bwa_003 <- data.frame( human_reads = sum(human003$reads),
                       bacterial_reads = sum(bwa_003$reads),
                       dataset='003',
                       condition='bwa')

human011 <- bwa_011 %>% filter(filename == 'GRCh38.fasta')
bwa_011 <- bwa_011 %>% filter(filename != 'GRCh38.fasta')
bwa_011 <- data.frame( human_reads = sum(human011$reads),
                       bacterial_reads = sum(bwa_011$reads),
                       dataset='011',
                       condition='bwa')

human014 <- bwa_014 %>% filter(filename == 'GRCh38.fasta')
bwa_014 <- bwa_014 %>% filter(filename != 'GRCh38.fasta')
bwa_014 <- data.frame( human_reads = sum(human014$reads),
                       bacterial_reads = sum(bwa_014$reads),
                       dataset='014',
                       condition='bwa')

human022 <- bwa_022 %>% filter(filename == 'GRCh38.fasta')
bwa_022 <- bwa_022 %>% filter(filename != 'GRCh38.fasta')
bwa_022 <- data.frame( human_reads = sum(human022$reads),
                       bacterial_reads = sum(bwa_022$reads),
                       dataset='022',
                       condition='bwa')

human025 <- bwa_025 %>% filter(filename == 'GRCh38.fasta')
bwa_025 <- bwa_025 %>% filter(filename != 'GRCh38.fasta')
bwa_025 <- data.frame( human_reads = sum(human025$reads),
                       bacterial_reads = sum(bwa_025$reads),
                       dataset='025',
                       condition='bwa')

human002 <- bwa_002 %>% filter(filename == 'GRCh38.fasta')
bwa_002 <- bwa_002 %>% filter(filename != 'GRCh38.fasta')
bwa_002 <- data.frame( human_reads = sum(human002$reads),
                       bacterial_reads = sum(bwa_002$reads),
                       dataset='002',
                       condition='bwa')

human004 <- bwa_004 %>% filter(filename == 'GRCh38.fasta')
bwa_004 <- bwa_004 %>% filter(filename != 'GRCh38.fasta')
bwa_004 <- data.frame( human_reads = sum(human004$reads),
                       bacterial_reads = sum(bwa_004$reads),
                       dataset='004',
                       condition='bwa')

human012 <- bwa_012 %>% filter(filename == 'GRCh38.fasta')
bwa_012 <- bwa_012 %>% filter(filename != 'GRCh38.fasta')
bwa_012 <- data.frame( human_reads = sum(human012$reads),
                       bacterial_reads = sum(bwa_012$reads),
                       dataset='012',
                       condition='bwa')

human015 <- bwa_015 %>% filter(filename == 'GRCh38.fasta')
bwa_015 <- bwa_015 %>% filter(filename != 'GRCh38.fasta')
bwa_015 <- data.frame( human_reads = sum(human015$reads),
                       bacterial_reads = sum(bwa_015$reads),
                       dataset='015',
                       condition='bwa')  

human024 <- bwa_024 %>% filter(filename == 'GRCh38.fasta')
bwa_024 <- bwa_024 %>% filter(filename != 'GRCh38.fasta')
bwa_024 <- data.frame( human_reads = sum(human024$reads),
                       bacterial_reads = sum(bwa_024$reads),
                       dataset='024',
                       condition='bwa')

#form single data frame of all bwa results
bwa <- rbind(bwa_001, bwa_002, bwa_003, bwa_004, bwa_011, bwa_012, bwa_014, bwa_015, bwa_022, bwa_024, bwa_025)

rm(bwa_001, bwa_002, bwa_003, bwa_004, bwa_011, bwa_012, bwa_014, bwa_015, bwa_022, bwa_024, bwa_025)
rm(human001, human002, human003, human004, human011, human012, human014, human015, human022, human025, human024)







#### load in bwa_bbduk files in same fashion ####
bwa_bbduk_001 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/001_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_003 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/003_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_011 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/011_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_014 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/014_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_022 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/022_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_025 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/025_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_002 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/002_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_004 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/004_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_012 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/012_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_015 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/015_seq_counts', col_names=c('filename', 'reads'))
bwa_bbduk_024 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bwa_bbduk/024_seq_counts', col_names=c('filename', 'reads'))

#form bacteria vs human for bwa_bbduk reads
human001 <- bwa_bbduk_001 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_001 <- bwa_bbduk_001 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_001 <- data.frame( human_reads = sum(human001$reads),
                             bacterial_reads = sum(bwa_bbduk_001$reads),
                             dataset='001',
                             condition='bwa_bbduk')

human003 <- bwa_bbduk_003 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_003 <- bwa_bbduk_003 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_003 <- data.frame( human_reads = sum(human003$reads),
                             bacterial_reads = sum(bwa_bbduk_003$reads),
                             dataset='003',
                             condition='bwa_bbduk')

human011 <- bwa_bbduk_011 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_011 <- bwa_bbduk_011 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_011 <- data.frame( human_reads = sum(human011$reads),
                             bacterial_reads = sum(bwa_bbduk_011$reads),
                             dataset='011',
                             condition='bwa_bbduk')

human014 <- bwa_bbduk_014 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_014 <- bwa_bbduk_014 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_014 <- data.frame( human_reads = sum(human014$reads),
                             bacterial_reads = sum(bwa_bbduk_014$reads),
                             dataset='014',
                             condition='bwa_bbduk')

human022 <- bwa_bbduk_022 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_022 <- bwa_bbduk_022 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_022 <- data.frame( human_reads = sum(human022$reads),
                             bacterial_reads = sum(bwa_bbduk_022$reads),
                             dataset='022',
                             condition='bwa_bbduk')

human025 <- bwa_bbduk_025 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_025 <- bwa_bbduk_025 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_025 <- data.frame( human_reads = sum(human025$reads),
                             bacterial_reads = sum(bwa_bbduk_025$reads),
                             dataset='025',
                             condition='bwa_bbduk')

human002 <- bwa_bbduk_002 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_002 <- bwa_bbduk_002 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_002 <- data.frame( human_reads = sum(human002$reads),
                             bacterial_reads = sum(bwa_bbduk_002$reads),
                             dataset='002',
                             condition='bwa_bbduk')

human004 <- bwa_bbduk_004 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_004 <- bwa_bbduk_004 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_004 <- data.frame( human_reads = sum(human004$reads),
                             bacterial_reads = sum(bwa_bbduk_004$reads),
                             dataset='004',
                             condition='bwa_bbduk')

human012 <- bwa_bbduk_012 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_012 <- bwa_bbduk_012 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_012 <- data.frame( human_reads = sum(human012$reads),
                             bacterial_reads = sum(bwa_bbduk_012$reads),
                             dataset='012',
                             condition='bwa_bbduk')

human015 <- bwa_bbduk_015 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_015 <- bwa_bbduk_015 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_015 <- data.frame( human_reads = sum(human015$reads),
                             bacterial_reads = sum(bwa_bbduk_015$reads),
                             dataset='015',
                             condition='bwa_bbduk')  

human024 <- bwa_bbduk_024 %>% filter(filename == 'GRCh38.fasta')
bwa_bbduk_024 <- bwa_bbduk_024 %>% filter(filename != 'GRCh38.fasta')
bwa_bbduk_024 <- data.frame( human_reads = sum(human024$reads),
                             bacterial_reads = sum(bwa_bbduk_024$reads),
                             dataset='024',
                             condition='bwa_bbduk')

#form single data frame of all bwa_bbduk results
bwa_bbduk <- rbind(bwa_bbduk_001, bwa_bbduk_002, bwa_bbduk_003, bwa_bbduk_004, bwa_bbduk_011, bwa_bbduk_012, bwa_bbduk_014, bwa_bbduk_015, bwa_bbduk_022, bwa_bbduk_024, bwa_bbduk_025)

rm(bwa_bbduk_001, bwa_bbduk_002, bwa_bbduk_003, bwa_bbduk_004, bwa_bbduk_011, bwa_bbduk_012, bwa_bbduk_014, bwa_bbduk_015, bwa_bbduk_022, bwa_bbduk_024, bwa_bbduk_025)
rm(human001, human002, human003, human004, human011, human012, human014, human015, human022, human025, human024)









#### load in mcf50_bbduk files in same fashion ####
mcf50_bbduk_001 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/001_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_003 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/003_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_011 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/011_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_014 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/014_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_022 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/022_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_025 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/025_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_002 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/002_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_004 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/004_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_012 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/012_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_015 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/015_seq_counts', col_names=c('filename', 'reads'))
mcf50_bbduk_024 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/bbduk_mcf50/024_seq_counts', col_names=c('filename', 'reads'))

#form bacteria vs human for mcf50_bbduk reads
human001 <- mcf50_bbduk_001 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_001 <- mcf50_bbduk_001 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_001 <- data.frame( human_reads = sum(human001$reads),
                               bacterial_reads = sum(mcf50_bbduk_001$reads),
                               dataset='001',
                               condition='mcf50_bbduk')

human003 <- mcf50_bbduk_003 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_003 <- mcf50_bbduk_003 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_003 <- data.frame( human_reads = sum(human003$reads),
                               bacterial_reads = sum(mcf50_bbduk_003$reads),
                               dataset='003',
                               condition='mcf50_bbduk')

human011 <- mcf50_bbduk_011 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_011 <- mcf50_bbduk_011 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_011 <- data.frame( human_reads = sum(human011$reads),
                               bacterial_reads = sum(mcf50_bbduk_011$reads),
                               dataset='011',
                               condition='mcf50_bbduk')

human014 <- mcf50_bbduk_014 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_014 <- mcf50_bbduk_014 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_014 <- data.frame( human_reads = sum(human014$reads),
                               bacterial_reads = sum(mcf50_bbduk_014$reads),
                               dataset='014',
                               condition='mcf50_bbduk')

human022 <- mcf50_bbduk_022 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_022 <- mcf50_bbduk_022 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_022 <- data.frame( human_reads = sum(human022$reads),
                               bacterial_reads = sum(mcf50_bbduk_022$reads),
                               dataset='022',
                               condition='mcf50_bbduk')

human025 <- mcf50_bbduk_025 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_025 <- mcf50_bbduk_025 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_025 <- data.frame( human_reads = sum(human025$reads),
                               bacterial_reads = sum(mcf50_bbduk_025$reads),
                               dataset='025',
                               condition='mcf50_bbduk')

human002 <- mcf50_bbduk_002 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_002 <- mcf50_bbduk_002 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_002 <- data.frame( human_reads = sum(human002$reads),
                               bacterial_reads = sum(mcf50_bbduk_002$reads),
                               dataset='002',
                               condition='mcf50_bbduk')

human004 <- mcf50_bbduk_004 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_004 <- mcf50_bbduk_004 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_004 <- data.frame( human_reads = sum(human004$reads),
                               bacterial_reads = sum(mcf50_bbduk_004$reads),
                               dataset='004',
                               condition='mcf50_bbduk')

human012 <- mcf50_bbduk_012 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_012 <- mcf50_bbduk_012 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_012 <- data.frame( human_reads = sum(human012$reads),
                               bacterial_reads = sum(mcf50_bbduk_012$reads),
                               dataset='012',
                               condition='mcf50_bbduk')

human015 <- mcf50_bbduk_015 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_015 <- mcf50_bbduk_015 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_015 <- data.frame( human_reads = sum(human015$reads),
                               bacterial_reads = sum(mcf50_bbduk_015$reads),
                               dataset='015',
                               condition='mcf50_bbduk')  

human024 <- mcf50_bbduk_024 %>% filter(filename == 'GRCh38.fasta')
mcf50_bbduk_024 <- mcf50_bbduk_024 %>% filter(filename != 'GRCh38.fasta')
mcf50_bbduk_024 <- data.frame( human_reads = sum(human024$reads),
                               bacterial_reads = sum(mcf50_bbduk_024$reads),
                               dataset='024',
                               condition='mcf50_bbduk')

#form single data frame of all mcf50_bbduk results
mcf50_bbduk <- rbind(mcf50_bbduk_001, mcf50_bbduk_002, mcf50_bbduk_003, mcf50_bbduk_004, mcf50_bbduk_011, mcf50_bbduk_012, mcf50_bbduk_014, mcf50_bbduk_015, mcf50_bbduk_022, mcf50_bbduk_024, mcf50_bbduk_025)

rm(mcf50_bbduk_001, mcf50_bbduk_002, mcf50_bbduk_003, mcf50_bbduk_004, mcf50_bbduk_011, mcf50_bbduk_012, mcf50_bbduk_014, mcf50_bbduk_015, mcf50_bbduk_022, mcf50_bbduk_024, mcf50_bbduk_025)
rm(human001, human002, human003, human004, human011, human012, human014, human015, human022, human025, human024)











#### load in kontaminant files in same fashion ####
kontaminant_001 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/001_seq_counts', col_names=c('filename', 'reads'))
kontaminant_003 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/003_seq_counts', col_names=c('filename', 'reads'))
kontaminant_011 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/011_seq_counts', col_names=c('filename', 'reads'))
kontaminant_014 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/014_seq_counts', col_names=c('filename', 'reads'))
kontaminant_022 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/022_seq_counts', col_names=c('filename', 'reads'))
kontaminant_025 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/025_seq_counts', col_names=c('filename', 'reads'))
kontaminant_002 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/002_seq_counts', col_names=c('filename', 'reads'))
kontaminant_004 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/004_seq_counts', col_names=c('filename', 'reads'))
kontaminant_012 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/012_seq_counts', col_names=c('filename', 'reads'))
kontaminant_015 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/015_seq_counts', col_names=c('filename', 'reads'))
kontaminant_024 <- read_tsv(file= '~/Desktop/sepath_paper/human_depletion/tool_comparison/kontaminant/024_seq_counts', col_names=c('filename', 'reads'))

#form bacteria vs human for kontaminant reads
human001 <- kontaminant_001 %>% filter(filename == 'GRCh38.fasta')
kontaminant_001 <- kontaminant_001 %>% filter(filename != 'GRCh38.fasta')
kontaminant_001 <- data.frame( human_reads = sum(human001$reads),
                               bacterial_reads = sum(kontaminant_001$reads),
                               dataset='001',
                               condition='kontaminant')

human003 <- kontaminant_003 %>% filter(filename == 'GRCh38.fasta')
kontaminant_003 <- kontaminant_003 %>% filter(filename != 'GRCh38.fasta')
kontaminant_003 <- data.frame( human_reads = sum(human003$reads),
                               bacterial_reads = sum(kontaminant_003$reads),
                               dataset='003',
                               condition='kontaminant')

human011 <- kontaminant_011 %>% filter(filename == 'GRCh38.fasta')
kontaminant_011 <- kontaminant_011 %>% filter(filename != 'GRCh38.fasta')
kontaminant_011 <- data.frame( human_reads = sum(human011$reads),
                               bacterial_reads = sum(kontaminant_011$reads),
                               dataset='011',
                               condition='kontaminant')

human014 <- kontaminant_014 %>% filter(filename == 'GRCh38.fasta')
kontaminant_014 <- kontaminant_014 %>% filter(filename != 'GRCh38.fasta')
kontaminant_014 <- data.frame( human_reads = sum(human014$reads),
                               bacterial_reads = sum(kontaminant_014$reads),
                               dataset='014',
                               condition='kontaminant')

human022 <- kontaminant_022 %>% filter(filename == 'GRCh38.fasta')
kontaminant_022 <- kontaminant_022 %>% filter(filename != 'GRCh38.fasta')
kontaminant_022 <- data.frame( human_reads = sum(human022$reads),
                               bacterial_reads = sum(kontaminant_022$reads),
                               dataset='022',
                               condition='kontaminant')

human025 <- kontaminant_025 %>% filter(filename == 'GRCh38.fasta')
kontaminant_025 <- kontaminant_025 %>% filter(filename != 'GRCh38.fasta')
kontaminant_025 <- data.frame( human_reads = sum(human025$reads),
                               bacterial_reads = sum(kontaminant_025$reads),
                               dataset='025',
                               condition='kontaminant')

human002 <- kontaminant_002 %>% filter(filename == 'GRCh38.fasta')
kontaminant_002 <- kontaminant_002 %>% filter(filename != 'GRCh38.fasta')
kontaminant_002 <- data.frame( human_reads = sum(human002$reads),
                               bacterial_reads = sum(kontaminant_002$reads),
                               dataset='002',
                               condition='kontaminant')

human004 <- kontaminant_004 %>% filter(filename == 'GRCh38.fasta')
kontaminant_004 <- kontaminant_004 %>% filter(filename != 'GRCh38.fasta')
kontaminant_004 <- data.frame( human_reads = sum(human004$reads),
                               bacterial_reads = sum(kontaminant_004$reads),
                               dataset='004',
                               condition='kontaminant')

human012 <- kontaminant_012 %>% filter(filename == 'GRCh38.fasta')
kontaminant_012 <- kontaminant_012 %>% filter(filename != 'GRCh38.fasta')
kontaminant_012 <- data.frame( human_reads = sum(human012$reads),
                               bacterial_reads = sum(kontaminant_012$reads),
                               dataset='012',
                               condition='kontaminant')

human015 <- kontaminant_015 %>% filter(filename == 'GRCh38.fasta')
kontaminant_015 <- kontaminant_015 %>% filter(filename != 'GRCh38.fasta')
kontaminant_015 <- data.frame( human_reads = sum(human015$reads),
                               bacterial_reads = sum(kontaminant_015$reads),
                               dataset='015',
                               condition='kontaminant')  

human024 <- kontaminant_024 %>% filter(filename == 'GRCh38.fasta')
kontaminant_024 <- kontaminant_024 %>% filter(filename != 'GRCh38.fasta')
kontaminant_024 <- data.frame( human_reads = sum(human024$reads),
                               bacterial_reads = sum(kontaminant_024$reads),
                               dataset='024',
                               condition='kontaminant')

#form single data frame of all kontaminant results
kontaminant <- rbind(kontaminant_001, kontaminant_002, kontaminant_003, kontaminant_004, kontaminant_011, kontaminant_012, kontaminant_014, kontaminant_015, kontaminant_022, kontaminant_024, kontaminant_025)

rm(kontaminant_001, kontaminant_002, kontaminant_003, kontaminant_004, kontaminant_011, kontaminant_012, kontaminant_014, kontaminant_015, kontaminant_022, kontaminant_024, kontaminant_025)
rm(human001, human002, human003, human004, human011, human012, human014, human015, human022, human025, human024)




#### Analyse Results ####


temp <- rbind(bbduk, bwa, bwa_bbduk, kontaminant, truth)

human_plot <- ggplot(temp, aes(y=((human_reads/1000000)), fill=condition, colour=condition)) +
  geom_boxplot(alpha=0.5) +
  theme_pubclean() +
  scale_fill_discrete(name='Test Condition',
                      breaks=c('bbduk', 'bwa', 'bwa_bbduk', 'kontaminant', 'truth'),
                      labels=c('BBDuK_Default', 'BWA-MEM', 'BWA & BBDuK Default', 'Kontaminant', 'Original')) +
  scale_colour_discrete(name='Test Condition',
                        breaks=c('bbduk', 'bwa', 'bwa_bbduk', 'kontaminant', 'truth'),
                        labels=c('BBDuK_Default', 'BWA-MEM', 'BWA & BBDuK Default', 'Kontaminant', 'Original')) +
  labs(title='Human Depletion Tool Performance',
       y='Number of Human Reads (million)') +
  scale_y_continuous(limits=c(0,300),
                     breaks=c(seq(0,300, 50))) +
  theme(legend.title=element_text(hjust=0.5, size=12),
        legend.text=element_text(size=12),
        legend.position = 'right',
        plot.title=element_text(hjust=0.5, size=12),
        axis.text.x=element_blank(),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(size=12),
        axis.ticks.x.bottom = element_blank())

human_plot

bacterial_plot <- ggplot(temp, aes(y=(bacterial_reads/1000000), x=condition, fill=condition, color=condition)) +
  geom_boxplot(alpha=0.5) +
  geom_point(aes(x=condition)) +
  scale_y_continuous(trans='log10') +
  theme_pubclean() +
  labs(title='Human Depletion - Bacterial Read Removal',
       y='Number of Bacterial Reads (million)') +
  theme(legend.title=element_text(hjust=0.5),
        legend.position = 'right',
        plot.title=element_text(hjust=0.5, size=16),
        axis.text.x=element_blank(),
        axis.text.y=element_text(size=13),
        axis.title.y=element_text(size=14),
        axis.ticks.x.bottom = element_blank())

bacterial_plot

pdf('~/Desktop/SEPATH_Figures/human_depletion_plot.pdf', height=4, width=6)
human_plot
dev.off()

pdf('~/Desktop/SEPATH_Figures/bacterial_depletion_plot.pdf', height=10, width=10)
bacterial_plot
dev.off()








temp2 <- temp %>% filter(condition !='truth')
temp3 <- merge(temp2, truth, by='dataset', all=TRUE)

colnames(temp3) <- c('dataset', 'human_reads', 'bacterial_reads', 'condition', 'true_human_reads', 'true_bacterial_reads', 'truth_condition')

temp3 <- temp3 %>% mutate(proportion_human = human_reads / true_human_reads, proportion_bacterial = bacterial_reads / true_bacterial_reads)

temp %>% group_by(condition) %>% summarise(median(bacterial_reads))

temp3 %>% group_by(condition) %>% summarise(median(human_reads))

temp3 <- temp3 %>% mutate(prop_human_removed = (1 - proportion_human) * 100 )

temp3 %>% group_by(condition) %>% summarise(median(prop_human_removed))

