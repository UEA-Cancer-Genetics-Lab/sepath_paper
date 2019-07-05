#check performances are the same between techniques
library(tidyverse)
library(ggpubr)
library(see)
library(cowplot)

#Load in performance files
abundance_performance <- read_tsv(file='~/Desktop/tool_comparison/performancelogs/top_performers/motus_unfilt_performance')
read_performance <- read_tsv(file='~/Desktop/tool_comparison/motu/read_counts/genus/comp/performancelog')

abundance_performance <- abundance_performance %>% select(Genus_SSV, Genus_PPV, Genus_F1)
read_performance <- read_performance %>% select(Genus_SSV, Genus_PPV, Genus_F1)

#Assign reads or abundance to merge later
abundance_performance$run_mode <- "abundance"
read_performance$run_mode <- "reads"

#Merge performance stats into one dataframe for later plotting
merged_performance <- rbind(abundance_performance, read_performance)


ssv_plot <- ggplot(merged_performance, aes(x=run_mode, fill=run_mode, y=Genus_SSV)) +
  scale_fill_manual(breaks=c('abundance', 'reads'),
                    values=c('darkgoldenrod2', 'khaki1' )) +
  geom_violindot(fill_dots='black', size_dots=0.1, alpha=0.7, binwidth=0.01) + theme_pubclean() + theme(legend.position='none')


ppv_plot <- ggplot(merged_performance, aes(x=run_mode, fill=run_mode, y=Genus_PPV)) +
  scale_fill_manual(breaks=c('abundance', 'reads'),
                    values=c('darkgoldenrod2', 'khaki1' )) +
  geom_violindot(fill_dots='black', size_dots=0.1, alpha=0.7, binwidth=0.01) + theme_pubclean() + theme(legend.position='none')


f1_plot <- ggplot(merged_performance, aes(x=run_mode, fill=run_mode, y=Genus_F1)) +
  scale_fill_manual(breaks=c('abundance', 'reads'),
                    values=c('darkgoldenrod2', 'khaki1' )) +
  geom_violindot(fill_dots='black', size_dots=0.1, alpha=0.7, binwidth=0.01) + theme_pubclean() + theme(legend.position='none')


performances <- plot_grid(f1_plot, ppv_plot, ssv_plot, labels=c('A','B','C'), scale=0.9, nrow=1)

pdf('~/Desktop/sepath_paper/motus_read_correlation/motus_read_vs_abundance_identical.pdf', width=12, height=4)
performances
dev.off()

system('open ~/Desktop/sepath_paper/motus_read_correlation/motus_read_vs_abundance_identical.pdf')



