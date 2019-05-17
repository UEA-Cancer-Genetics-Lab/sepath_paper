#script to correlate kraken relative abundance with true relative abundance from input list of true positive genus classifications
library(tidyverse)
library(plyr)
library(cowplot)

#load input list of true positives

list_of_nums <- c("001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100")


for(filename in list_of_nums) {
  input_file <- paste0('~/Desktop/sepath_paper/kraken_read_correlation/true_positives/', filename, '_tp')
  input_tp <- read_tsv(file=input_file, col_names = FALSE)
  input_tp <- as.list(input_tp$X1)

  #load true comp, select only relative abundance and genus
  input_comp_file <- paste0('~/Desktop/tool_comparison/true_comp/', filename, '.comp')
  input_comp <- read_tsv(file=input_comp_file, col_names=TRUE)
  input_comp <- input_comp %>% select(Genus, Number_of_Reads)

  #load up kraken results and filter for only true positive's
  kraken_file <- paste0('~/Desktop/sepath_paper/kraken_read_correlation/', filename, '.comp')
  kraken <- read_tsv(file=kraken_file, col_names=TRUE)
  kraken <- kraken %>% select(Genus, Number_of_Reads)
  kraken <- kraken %>% filter(Genus %in% input_tp)
  #search for duplicate genera and add reads together
  kraken <- ddply(kraken, 'Genus', numcolwise(sum))
  
  #filter out input comp by genus that are present in true_positives
  input_comp <- input_comp %>% filter(Genus %in% input_tp)
  #search for duplicate genera and add reads together
  input_comp <- ddply(input_comp, 'Genus', numcolwise(sum))

  #marry up input_comp and kraken so output can be correlated
  colnames(input_comp) <- c('Genus', 'True_Reads')
  colnames(kraken) <- c('Genus', 'Estimated_Reads')

  #make all integers
  input_comp <- input_comp %>% mutate(True_Reads = as.numeric(True_Reads))
  kraken <- kraken %>% mutate(Estimated_Reads = as.numeric(Estimated_Reads))

  merged <- merge(input_comp, kraken, by='Genus', all=TRUE)

  write_file <- paste0('~/Desktop/sepath_paper/kraken_read_correlation/merged_TP_abundances/', filename, '_abundances')
  write.table(merged, file=write_file, row.names=FALSE, col.names=FALSE, quote=FALSE, sep='\t')
}



#merge all results via command line
system('cat ~/Desktop/sepath_paper/kraken_read_correlation/merged_TP_abundances/* > ~/Desktop/sepath_paper/kraken_read_correlation/all_merged_abundances')

#load in merged abundances for all 100 kraken results
abundances <- read_tsv(file='~/Desktop/sepath_paper/kraken_read_correlation/all_merged_abundances', col_names=FALSE)
colnames(abundances) <- colnames(merged)





setwd('/Users/agihawi/Desktop/SEPATH_Figures/')
pdf('kraken_abundance_correlation.pdf', width=6, height=6)
#do some plots
read_plot <- ggplot(abundances, aes(x=(True_Reads/1000000), y=(Estimated_Reads/1000000))) +
  geom_point(alpha=0.7, col='chartreuse4') +
  geom_smooth(method='lm', col='navy') +
  theme_pubclean() +
  labs(title='Kraken Estimated vs True Reads',
       subtitle='2,021 True Positive Results',
       x='True Reads (million)',
       y='Estimated Reads (million)') +
  theme(plot.title=element_text(size=12, hjust=0.5),
        plot.subtitle=element_text(hjust=0.5), 
        panel.grid.major = element_line(colour='grey', size=0.2),
        axis.text = element_text(size=12),
        axis.title=element_text(size=12)
        ) +
  scale_x_continuous(limits=c(0,(max(abundances$True_Reads))/1000000), breaks=seq(0, (max(abundances$True_Reads)/1000000),2)) +
  scale_y_continuous(limits=c(0,(max(abundances$Estimated_Reads))/1000000), breaks=seq(0, (max(abundances$Estimated_Reads)/1000000),2)) +
  stat_cor(method='spearman', label.x=16, label.y=7, col='navy', size=5, output.type='expression', 
           aes(label = paste(..rr.label..)))
read_plot

dev.off()


#load in plot for motus abundance so they can be merged
correlation_plot <- plot_grid(abundance_plot, read_plot, labels=c('A', 'B'), scale=0.9, nrow=1)


pdf('~/Desktop/abundance_cor.pdf', width=12, height=4)
correlation_plot
dev.off()





