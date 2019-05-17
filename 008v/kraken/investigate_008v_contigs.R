library(tidyverse)
library(stringr)
library(reshape2)

setwd('~/Desktop/008v/kraken/')

true_file <- read_tsv(file='008.comp', col_names=TRUE)

bacterial_genus <- read_tsv(file='008v_bacterial_genus', col_names=FALSE)
viral_genus <- read_tsv(file='008v_viral_classifications', col_names=FALSE)



#split up coverage information
bacterial_cov <- bacterial_genus %>% separate(X1, c('length', 'coverage'), sep='_cov_', remove=FALSE)
viral_cov <- viral_genus %>% separate(X1, c('length', 'coverage'), sep='_cov_', remove=FALSE)

#convert coverage to numeric
bacterial_cov$coverage <- as.numeric(bacterial_cov$coverage)
viral_cov$coverage <- as.numeric(viral_cov$coverage)

# set detection status ( all viral classifications are true positive)
viral_cov$detection_status = 'Viral_True_Positive'
#split up bacteiral into genus only
bacterial_cov <- bacterial_cov %>% separate(X2, c('higher_taxa', 'pre_genus'), sep='g__', remove=FALSE)
bacterial_cov <- bacterial_cov %>% separate(pre_genus, c('genus', 'species'), sep="[|]", remove=FALSE)

#set list of unique genera in true file
true_genera <- unique(true_file$Genus)

#mutate bacterial genus to add detection status
bacterial_cov <- bacterial_cov %>% mutate(detection_status = case_when(
  genus %in% true_genera ~ 'Bacterial_True_Positive',
  TRUE ~ 'Bacterial_False_Positive'
  
))

#isolate contig length information
bacterial_cov <- bacterial_cov %>% separate(length, c('info', 'length'), sep='_length_', remove=FALSE)
viral_cov <- viral_cov %>% separate(length, c('info', 'length'), sep='_length_', remove=FALSE)

bacterial_cov$length <- as.numeric(bacterial_cov$length)
viral_cov$length  <- as.numeric(viral_cov$length)

#bind viral and bacterial back togehter
bacterial_plot <- bacterial_cov %>% select(coverage, detection_status, length)
viral_plot <- viral_cov %>% select(coverage, detection_status, length)

merged_cov <- rbind(bacterial_plot, viral_plot)


ggplot(merged_cov, aes(x=coverage, fill=detection_status)) +
  geom_density(alpha=0.7) +
  xlim(0,20) +
  labs(x='MetaSPAdes Coverage',
       title='Contig Coverage vs Detection Status',
       subtitle='008v Dataset - 0.2 confidence threshold - ') +
  theme_pubclean() +
  theme(legend.position='right',
        plot.title=element_text(hjust=0.5))



fps <- bacterial_cov %>% filter(detection_status == 'Bacterial_False_Positive')
tps <- bacterial_cov %>% filter(detection_status == 'Bacterial_True_Positive')

fp_genus <- unique(fps$genus)
tp_genus <- unique(tps$genus)
PPV <- round(length(tp_genus) / (length(tp_genus) +  length(fp_genus)  ),3)
PPV

plot008 <- ggplot(merged_cov, aes(x=log2(coverage), y=log2(length), col=detection_status, alpha=detection_status)) +
  geom_point() +
  scale_alpha_manual(limits=c('Bacterial_False_Positive', 'Bacterial_True_Positive', 'Viral_True_Positive'),
                       values=c(1, 0.2, 0.9)) +
  scale_x_continuous(trans='log2') +
  scale_y_continuous(trans='log2') +
  theme_pubclean() +
  labs(x='Contig Coverage (log2)',
       y='Contig Length (log2)',
       title='MetaSPAdes Contig Characteristics vs Kraken Detection Status',
       subtitle=paste0('008v Dataset - ', nrow(merged_cov), ' Contigs - 0.2 Confidence - PPV = ', PPV)) +
  theme(legend.position='right',
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5)) 


pdf('008v_contigs.pdf', height=10, width=10)
plot008
dev.off()
system('open 008v_contigs.pdf')



t.test(fps$coverage, tps$coverage, paried=FALSE)



