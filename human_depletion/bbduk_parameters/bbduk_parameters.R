library(tidyverse)
library(tidyr)
library(reshape2)
library(cowplot)

mcf_50 <- read_tsv(file='/Users/agihawi/Desktop/Archive/human_depletion/mcf50_counts', col_names = TRUE)
mkf_50 <- read_tsv(file='/Users/agihawi/Desktop/Archive/human_depletion/mkf_50_counts', col_names = TRUE)
mcf_75 <- read_tsv(file='/Users/agihawi/Desktop/Archive/human_depletion/mcf075_counts', col_names = TRUE)
mkf_75 <- read_tsv(file='/Users/agihawi/Desktop/Archive/human_depletion/mkf075_counts', col_names = TRUE)
mkf_90 <- read_tsv(file='/Users/agihawi/Desktop/Archive/human_depletion/mkf90_counts', col_names = TRUE)
original <- read_tsv(file='/Users/agihawi/Desktop/Archive/human_depletion/original_counts', col_names = TRUE)
stringent <- read_tsv(file='/Users/agihawi/Desktop/Archive/human_depletion/stringent_counts', col_names = TRUE)
cancer_filt <- read_tsv(file='/Users/agihawi/Desktop/Archive/human_depletion/mcf50_cancer_counts', col_names=TRUE)

# mcf_90 <- read_tsv(file='/Users/agihawi/Desktop/human_depletion/mcf090_counts', col_names = TRUE)

all_bbduk <- cbind(mcf_50, mkf_50, mcf_75, mkf_75, mkf_90, original, cancer_filt, stringent)

all_bbduk$mcf50_bac_prop <- all_bbduk$mcf50_bacterial / all_bbduk$original_bacterial
all_bbduk$mcf75_bac_prop <- all_bbduk$mcf75_bacterial / all_bbduk$original_bacterial
all_bbduk$mkf50_bac_prop <- all_bbduk$mkf50_bacterial / all_bbduk$original_bacterial
all_bbduk$mkf75_bac_prop <- all_bbduk$mkf75_bacterial / all_bbduk$original_bacterial
all_bbduk$mkf90_bac_prop <- all_bbduk$mkf90_bacterial / all_bbduk$original_bacterial
all_bbduk$stringent_bac_prop <- all_bbduk$stringent_bacterial / all_bbduk$original_bacterial
all_bbduk$cancer_bac_prob <- all_bbduk$cancer_mcf50_bacterial / all_bbduk$original_bacterial
  
all_bbduk$mcf50_hum_prop <- all_bbduk$mcf50_human / all_bbduk$original_human
all_bbduk$mcf75_hum_prop <- all_bbduk$mcf75_human / all_bbduk$original_human
all_bbduk$mkf50_hum_prop <- all_bbduk$mkf50_human / all_bbduk$original_human
all_bbduk$mkf75_hum_prop <- all_bbduk$mkf75_human / all_bbduk$original_human
all_bbduk$mkf90_hum_prop <- all_bbduk$mkf90_human / all_bbduk$original_human
all_bbduk$stringent_hum_prop <- all_bbduk$stringent_human / all_bbduk$original_human
all_bbduk$cancer_hum_prop <- all_bbduk$cancer_mcf50_human / all_bbduk$original_human

#need to also include 1 kmer filtering


bac_plot_data <- all_bbduk %>% select(mcf50_bac_prop, mcf75_bac_prop, mkf50_bac_prop, mkf75_bac_prop, mkf90_bac_prop, cancer_bac_prob, stringent_bac_prop)
hum_plot_data <- all_bbduk %>% select(mcf50_hum_prop, mcf75_hum_prop, mkf50_hum_prop, mkf75_hum_prop, mkf90_hum_prop, cancer_hum_prop, stringent_hum_prop)

bac_melt <- melt(bac_plot_data)
hum_melt <- melt(hum_plot_data)



bplot <- ggplot(data=bac_melt, aes(x=factor(variable), y=value, fill=variable)) +
  geom_boxplot() +
  labs(title="BBDuk Filtering Parameters - Bacterial Reads",
       subtitle="",
       y="Proportion of Bacterial Reads Remaining",
       x='BBDuk Filtering Parameters') +
  theme_pubclean() +
  theme(plot.title=element_text(hjust=0.5, size=12),
        plot.subtitle=element_text(hjust=0.5, size=12),
        axis.text.x=element_text(angle=90, hjust=1, size=12),
        axis.title.x=element_text(hjust=0.5, size=12),
        axis.text.y=element_text(size=12),
        axis.title.y=element_text(hjust=0.5, size=12),
        legend.position='none') +
  scale_x_discrete(limits=c('mcf50_bac_prop', 'mcf75_bac_prop', 'mkf50_bac_prop', 'mkf75_bac_prop', 'mkf90_bac_prop', 'cancer_bac_prob', 'stringent_bac_prop'),
                   labels=c('MCF50','MCF75','MKF50','MKF75','MKF90','MCF50-Cancer','Default'))
bplot  

aplot <- ggplot(data=hum_melt, aes(x=factor(variable), y=(log10(value)))) +
  geom_boxplot() + 
  labs(title="BBDuk Filtering Parameters - Human Reads",
       subtitle="",
       y="Proportion of Human Reads Remaining (log10)",
       x='BBDuk Filtering Parameters') +
  theme_pubclean() +
  theme(plot.title=element_text(hjust=0.5, size=12),
        plot.subtitle=element_text(hjust=0.5, size=12),
        axis.text.x=element_text(angle=90, hjust=1, size=12),
        axis.title.x=element_text(hjust=0.5, size=12),
        axis.title.y=element_text(size=12),
        axis.text.y=element_text(size=12)) +
  scale_x_discrete(limits=c('mcf50_hum_prop', 'mcf75_hum_prop', 'mkf50_hum_prop', 'mkf75_hum_prop', 'mkf90_hum_prop', 'cancer_hum_prop', 'stringent_hum_prop'),
                   labels=c('MCF50','MCF75','MKF50','MKF75','MKF90','MCF50-Cancer','Default'))

aplot

pdf('~/Desktop/sepath_paper/human_depletion/bbduk_parameters/bbduk_plot.pdf', height=6, width=12)
plot_grid(aplot, bplot, labels = c("A", "B"))
dev.off()

#after loding in human plot from analysis_script.R (human depletion tool comparison)
pdf('~/Desktop/SEPATH_V5/figures/figure1.pdf', width=16, height=5)
plot_grid(human_plot, aplot, bplot, labels=c("A", "B", "C"), nrow=1, scale=0.9)
dev.off()


