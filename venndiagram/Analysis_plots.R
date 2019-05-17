library(tidyverse)
library(VennDiagram)
library(cowplot)
library(ggpubr)
library(reshape2)


setwd('~/Desktop/sepath_paper/venndiagram/')

#load in files
krakenmotus <- read_tsv(file='Kraken_motus/performancelog', col_names=TRUE)
motuspathseq <- read_tsv(file='motus_pathseq/performancelog', col_names=TRUE)
pathseqkraken <- read_tsv(file='pathseq_kraken/performancelog', col_names=TRUE)

pathseq <- read_tsv(file='Pathseq/performancelog', col_names=TRUE)
kraken <- read_tsv(file='Kraken/performancelog', col_names=TRUE)
motus <- read_tsv(file='mOTUS/performancelog', col_names=TRUE)

pathseqkrakenmotus <- read_tsv(file='kraken_motus_pathseq/performancelog', col_names=TRUE)


#label with conditions
krakenmotus$condition <- 'kraken_motus'
motuspathseq$condition <- 'motus_pathseq'
pathseqkraken$condition <- 'pathseq_kraken'
pathseq$condition <- 'pathseq'
kraken$condition <- 'kraken'
motus$condition <- 'motus'
pathseqkrakenmotus$condition <- 'pathseq_kraken_motus'


metric <- c('F1score', 'SSV' ,'PPV')

#data frame of all variables
comparison <- data.frame(metric = c(rep(metric, 7)),
                         values =  c(median(kraken$Genus_F1), median(kraken$Genus_SSV), median(kraken$Genus_PPV),
                                   median(krakenmotus$Genus_F1), median(krakenmotus$Genus_SSV), median(krakenmotus$Genus_PPV),
                                   median(motus$Genus_F1), median(motus$Genus_SSV), median(motus$Genus_PPV),
                                   median(motuspathseq$Genus_F1), median(motuspathseq$Genus_SSV), median(motuspathseq$Genus_PPV),
                                   median(pathseq$Genus_F1), median(pathseq$Genus_SSV), median(pathseq$Genus_PPV),
                                   median(pathseqkraken$Genus_F1), median(pathseqkraken$Genus_SSV), median(pathseqkraken$Genus_PPV),
                                   median(pathseqkrakenmotus$Genus_F1), median(pathseqkrakenmotus$Genus_SSV), median(pathseqkrakenmotus$Genus_PPV)),
                         condition = c(rep('kraken', 3), 
                                       rep('krakenmotus', 3), 
                                       rep('motus', 3), 
                                       rep('motuspathseq', 3), 
                                       rep('pathseq', 3), 
                                       rep('pathseqkraken', 3),
                                       rep('pathseqkrakenmotus', 3)))


comparison_spread <- comparison %>% spread(key='metric', value='values')

# #subset comparison df
# krakenmotus <- comparison_spread %>% filter(condition== 'krakenmotus')
# motuspathseq <- comparison_spread %>% filter(condition== 'motuspathseq' )
# pathseqkraken <- comparison_spread %>% filter(condition=='pathseqkraken' )
# pathseq <- comparison_spread %>% filter(condition=='pathseq' )
# kraken <- comparison_spread %>% filter(condition=='kraken' )
# motus <- comparison_spread %>% filter(condition=='motus' )
# pathseqkrakenmotus <- comparison_spread %>% filter(condition=='pathseqkrakenmotus' )
# 
# 
# 
# 
# krakenmotus_label <- paste0('F1-score: ', round(krakenmotus$F1score, 2),
#                             '\nSSV: ', round(krakenmotus$SSV, 2), 
#                             '\nPPV:', round(krakenmotus$PPV,2))
# 
# motuspathseq_label <- paste0('F1-score: ', round(motuspathseq$F1score,2), 
#                              '\nSSV: ', round(motuspathseq$SSV,2), 
#                              '\nPPV:', round(motuspathseq$PPV,2))
# 
# pathseqkraken_label <- paste0('F1-score: ', round(pathseqkraken$F1score,2),
#                               '\nSSV: ', round(pathseqkraken$SSV,2), 
#                               '\nPPV:', round(pathseqkraken$PPV,2))
# 
# pathseq_label <- paste0('F1-score: ', round(pathseq$F1score,2), 
#                         '\nSSV: ', round(pathseq$SSV,2), 
#                         '\nPPV:', round(pathseq$PPV,2))
# 
# kraken_label <- paste0('F1-score: ', round(kraken$F1score,2), 
#                        '\nSSV: ', round(kraken$SSV,2), 
#                        '\nPPV:', round(kraken$PPV,2))
# 
# motus_label <- paste0('F1-score: ', round(motus$F1score,2), 
#                       '\nSSV: ', round(motus$SSV,2), 
#                       '\nPPV:', round(motus$PPV,2))
# 
# pathseqkrakenmotus_label <- paste0('F1-score: ', round(pathseqkrakenmotus$F1score,2), 
#                                    '\nSSV: ', round(pathseqkrakenmotus$SSV,2), 
#                                    '\nPPV:', round(pathseqkrakenmotus$PPV,2))
# 
# 
# #plot just F1 score
# grid.newpage()
# 
# venn <- draw.triple.venn(area1 = 100, area2=100, area3=100,
#                  n12=25, n23=25, n13=25, n123=25,
#                  lty='blank',
#                  category = c('metaSPAdes & Kraken', 'mOTUs 2', 'PathSeq'),
#                  fill= c('chartreuse4','darkgoldenrod2','tomato'),
#                  col=c('black','black','black'),
#                  alpha=c(.8,.8,.8))
# 
# grid.draw(venn)
# 
# venn[[1]]$name <- 'label1'
# 
# grid.draw(venn)
# 
# grid.newpage()
# f1_plot = draw.triple.venn(area1= (round((kraken$F1score + krakenmotus$F1score + pathseqkraken$F1score + pathseqkrakenmotus$F1score),3)),
#                  area2= (round((motus$F1score + krakenmotus$F1score + motuspathseq$F1score + pathseqkrakenmotus$F1score),3)),
#                  area3= (round((pathseq$F1score + pathseqkraken$F1score + motuspathseq$F1score + pathseqkrakenmotus$F1score),3)),
#                  n12= (round((krakenmotus$F1score + pathseqkrakenmotus$F1score),3)),
#                  n23= (round((motuspathseq$F1score + pathseqkrakenmotus$F1score),3)),
#                  n13= (round((pathseqkraken$F1score + pathseqkrakenmotus$F1score),3)),
#                  n123 = (round((pathseqkrakenmotus$F1score),3)),
#                  lty='blank',
#                  fill= c('chartreuse4','darkgoldenrod2','tomato'),
#                  col=c('black','black','black'),
#                  category = c('Kraken', 'mOTUs 2', 'PathSeq'),
#                  alpha=c(.6,.6,.6))
# 
# grid.newpage()
# PPV_plot = draw.triple.venn(area1= (round((kraken$PPV + krakenmotus$PPV + pathseqkraken$PPV + pathseqkrakenmotus$PPV),3)),
#                              area2= (round((motus$PPV + krakenmotus$PPV + motuspathseq$PPV + pathseqkrakenmotus$PPV),3)),
#                              area3= (round((pathseq$PPV + pathseqkraken$PPV + motuspathseq$PPV + pathseqkrakenmotus$PPV),3)),
#                              n12= (round((krakenmotus$PPV + pathseqkrakenmotus$PPV),3)),
#                              n23= (round((motuspathseq$PPV + pathseqkrakenmotus$PPV),3)),
#                              n13= (round((pathseqkraken$PPV + pathseqkrakenmotus$PPV),3)),
#                              n123 = (round((pathseqkrakenmotus$PPV),3)),
#                              lty='blank',
#                              fill= c('chartreuse4','darkgoldenrod2','tomato'),
#                              col=c('black','black','black'),
#                              category = c('Kraken', 'mOTUs 2', 'PathSeq'),
#                              alpha=c(.6,.6,.6))
# 
# 
# grid.newpage()
# SSV_plot = draw.triple.venn(area1= (round((kraken$SSV + krakenmotus$SSV + pathseqkraken$SSV + pathseqkrakenmotus$SSV),3)),
#                              area2= (round((motus$SSV + krakenmotus$SSV + motuspathseq$SSV + pathseqkrakenmotus$SSV),3)),
#                              area3= (round((pathseq$SSV + pathseqkraken$SSV + motuspathseq$SSV + pathseqkrakenmotus$SSV),3)),
#                              n12= (round((krakenmotus$SSV + pathseqkrakenmotus$SSV),3)),
#                              n23= (round((motuspathseq$SSV + pathseqkrakenmotus$SSV),3)),
#                              n13= (round((pathseqkraken$SSV + pathseqkrakenmotus$SSV),3)),
#                              n123 = (round((pathseqkrakenmotus$SSV),3)),
#                              lty='blank',
#                              fill= c('chartreuse4','darkgoldenrod2','tomato'),
#                              col=c('black','black','black'),
#                              category = c('Kraken', 'mOTUs 2', 'PathSeq'),
#                              alpha=c(.6,.6,.6))
# 
# #pdf('~/Desktop/venndiagram/consensus_venn.pdf', width=20, height=8)
# plot_grid(grobTree(f1_plot), grobTree(PPV_plot), grobTree(SSV_plot), labels=c('A) F1 Score', 'B) PPV', 'c) SSV'), nrow=1)
# #dev.off()



palette=c('tomato', '#D27B50', 'chartreuse4', '#FA8454','#C4A83D', 'darkgoldenrod2', '#E9783E')
Abes_palette=c('#FF6347', '#D27B50', '#458B00', '#FA8454', '#C4A83D', '#EEAD0E', '#E9783E')

#Produce scatter plots
merged <- rbind(krakenmotus, motuspathseq, pathseqkraken, pathseq, kraken, motus, pathseqkrakenmotus) %>% select(Genus_F1, Genus_PPV, Genus_SSV, condition)

merged$condition <- as.factor(merged$condition)

merged_melt <- melt(merged, by='condition')

f1_plot <- ggplot(merged, aes(x=condition, y=Genus_F1)) +
  geom_boxplot(alpha=0.7) +
  geom_jitter(height=0, width=0.15, alpha=0.9, aes(col=condition)) +
  ylim(0.5,1) +
  theme_pubclean() +
  scale_x_discrete(limits=c('pathseq', 'pathseq_kraken', 'kraken', 'motus_pathseq', 'kraken_motus', 'motus', 'pathseq_kraken_motus'),
                   breaks=c('pathseq', 'pathseq_kraken', 'kraken', 'motus_pathseq', 'kraken_motus', 'motus', 'pathseq_kraken_motus'),
                   labels=c('PathSeq', 'PathSeq & Kraken', 'Kraken', 'mOTUs2 & PathSeq', 'Kraken & mOTUs2', 'mOTUs2','Consensus')) +
  scale_color_manual(limits=c('pathseq', 'pathseq_kraken', 'kraken', 'motus_pathseq', 'kraken_motus', 'motus', 'pathseq_kraken_motus'),
                     values=Abes_palette) +
  labs(title='F1-Score') +
  theme(plot.title=element_text(hjust=0.5),
        axis.text.x=element_text(angle=45, hjust=1),
        legend.position='none',
        axis.title.x=element_blank(),
        axis.title.y=element_blank())
f1_plot


PPV_plot <- ggplot(merged, aes(x=condition, y=Genus_PPV)) +
  geom_boxplot(alpha=0.7) +
  geom_jitter(height=0, width=0.15, alpha=0.9, aes(col=condition)) +
  ylim(0.5,1) +
  theme_pubclean() +
  scale_x_discrete(limits=c('pathseq', 'pathseq_kraken', 'kraken', 'motus_pathseq', 'kraken_motus', 'motus', 'pathseq_kraken_motus'),
                   breaks=c('pathseq', 'pathseq_kraken', 'kraken', 'motus_pathseq', 'kraken_motus', 'motus', 'pathseq_kraken_motus'),
                   labels=c('PathSeq', 'PathSeq & Kraken', 'Kraken', 'mOTUs2 & PathSeq', 'Kraken & mOTUs2', 'mOTUs2','Consensus')) +
  scale_color_manual(limits=c('pathseq', 'pathseq_kraken', 'kraken', 'motus_pathseq', 'kraken_motus', 'motus', 'pathseq_kraken_motus'),
                     values=Abes_palette) +
  labs(title='PPV') +
  theme(plot.title=element_text(hjust=0.5),
    axis.text.x=element_text(angle=45, hjust=1),
        legend.position='none',
        axis.title.x=element_blank(),
        axis.title.y=element_blank()) 
PPV_plot

SSV_plot <- ggplot(merged, aes(x=condition, y=Genus_SSV)) +
  geom_boxplot(alpha=0.7) +
  geom_jitter(height=0, width=0.15, alpha=0.9, aes(col=condition)) +
  ylim(0.5,1) +
  theme_pubclean() +
  scale_x_discrete(limits=c('pathseq', 'pathseq_kraken', 'kraken', 'motus_pathseq', 'kraken_motus', 'motus', 'pathseq_kraken_motus'),
                   breaks=c('pathseq', 'pathseq_kraken', 'kraken', 'motus_pathseq', 'kraken_motus', 'motus', 'pathseq_kraken_motus'),
                   labels=c('PathSeq', 'PathSeq & Kraken', 'Kraken', 'mOTUs2 & PathSeq', 'Kraken & mOTUs2', 'mOTUs2','Consensus')) +
  scale_color_manual(limits=c('pathseq', 'pathseq_kraken', 'kraken', 'motus_pathseq', 'kraken_motus', 'motus', 'pathseq_kraken_motus'),
                     values=Abes_palette) +
  labs(title='SSV') +
  theme(plot.title=element_text(hjust=0.5),
        axis.text.x=element_text(angle=45, hjust=1),
        legend.position='none',
        axis.title.x=element_blank(),
        axis.title.y=element_blank())

SSV_plot

pdf('~/Desktop/SEPATH_V4/figures/figure5.pdf', width=10, height=5)
plot_grid(f1_plot, PPV_plot, SSV_plot, scale=0.9, labels=c('A', 'B', 'C'), nrow=1)
dev.off()
##finish making plot look pretty, maybe bigger axis text













