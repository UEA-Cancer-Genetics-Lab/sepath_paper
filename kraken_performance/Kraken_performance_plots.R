library(tidyverse)
library(see)
library(ggpubr)
library(reshape2)
library(cowplot)


#This script will plot performances accross taxonomic levels for unfilt and filt

#load in performance files
unfilt_performance <- read_tsv(file='~/Desktop/tool_comparison/performancelogs/kraken_unfilt_performance', col_names=TRUE)
kraken_500f <- read_tsv(file='~/Desktop/tool_comparison/performancelogs/top_performers/kraken_500filt_performance', col_names=TRUE)


unfilt_performance <- unfilt_performance %>% select(Phylum_F1, Class_F1, Order_F1, Family_F1, Genus_F1, Species_F1,
                                                    Phylum_SSV, Class_SSV, Order_SSV, Family_SSV, Genus_SSV, Species_SSV,
                                                    Phylum_PPV, Class_PPV, Order_PPV, Family_PPV, Genus_PPV, Species_PPV)

kraken_500f <- kraken_500f %>% select(Phylum_F1, Class_F1, Order_F1, Family_F1, Genus_F1, Species_F1,
                                                    Phylum_SSV, Class_SSV, Order_SSV, Family_SSV, Genus_SSV, Species_SSV,
                                                    Phylum_PPV, Class_PPV, Order_PPV, Family_PPV, Genus_PPV, Species_PPV)                                                   

#Melt the data frames     
unfilt_melt <- melt(unfilt_performance)                     
filt_melt <- melt(kraken_500f)

#Add in taxonomic rank and measure as new columns
unfilt_melt <- unfilt_melt %>% mutate(measure  = case_when(
  grepl("_F1", variable) ~ "F1_Score",
  grepl("_SSV", variable) ~ "SSV",
  grepl("_PPV", variable) ~ "PPV"
))

unfilt_melt <- unfilt_melt %>% mutate(taxonomic_rank = case_when(
  grepl("Phylum", variable) ~ "Phylum",
  grepl("Class", variable) ~ "Class",
  grepl("Order", variable) ~ "Order",
  grepl("Family", variable) ~ "Family",
  grepl("Genus", variable) ~ "Genus",
  grepl("Species", variable) ~ "Species",
))

filt_melt <- filt_melt %>% mutate(measure  = case_when(
  grepl("_F1", variable) ~ "F1_Score",
  grepl("_SSV", variable) ~ "SSV",
  grepl("_PPV", variable) ~ "PPV"
))

filt_melt <- filt_melt %>% mutate(taxonomic_rank = case_when(
  grepl("Phylum", variable) ~ "Phylum",
  grepl("Class", variable) ~ "Class",
  grepl("Order", variable) ~ "Order",
  grepl("Family", variable) ~ "Family",
  grepl("Genus", variable) ~ "Genus",
  grepl("Species", variable) ~ "Species",
))



# Now make some plotz
unfilt_plot <- ggplot(unfilt_melt, aes( x=taxonomic_rank, y=value)) +
  geom_violin(fill='chartreuse3', alpha=0.7) +
  facet_grid(. ~ measure) +
  theme_pubclean() +
  scale_x_discrete(limits=c('Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'),
                   breaks=c('Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species')) +
  scale_y_continuous(limits=c(0,1),
                     breaks=c(seq(0,1,0.1))) +
  labs(title='Unfiltered Kraken') +
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        plot.title=element_text(hjust=0.5),
        axis.title=element_blank())



filt_plot <- ggplot(filt_melt, aes( x=taxonomic_rank, y=value)) +
  geom_violin(fill='chartreuse4', alpha=0.7) +
  facet_grid(. ~ measure) +
  theme_pubclean() +
  scale_x_discrete(limits=c('Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'),
                   breaks=c('Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species')) +
  scale_y_continuous(limits=c(0,1),
                     breaks=c(seq(0,1,0.1))) +
  labs(title='Read Filtered Kraken (500 read minimum)') + 
  theme(axis.text.x=element_text(angle=90, vjust=0.5),
        plot.title=element_text(hjust=0.5),
        axis.title=element_blank())




kraken_plot <- plot_grid(unfilt_plot, filt_plot, nrow=2, ncol=1, labels=c('A','B'))


ggsave(kraken_plot, file='~/Desktop/kraken_performance.pdf', width=16, height=10)
ggsave(kraken_plot, file='~/Desktop/kraken_performance.svg', width=16, height=10)





