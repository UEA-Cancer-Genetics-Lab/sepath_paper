# sepath_paper
A collection of scripts and data used in the SEPATH manuscript

This repository contains compressed scripts and data used in the development and benchmarking of SEPATH.

The directory ``` simulations/ ``` contains information regarding the metagenome simulations including the composition of each of the files. ```???_bear``` files in this directory contain each of the contig headers and their abundance which was parsed to BEAR for metagenome simulation. ```final_generation.R``` contains the script used to randomly generate abundance files which were distributed to each contig proportionately based on contig length using ```scaff_to_new_BEAR_abund.R```.  The file ``` simulations/ref_genome_location.txt ``` contains FTP links to each of the contituent genomes in NCBI and the name of the submitter

```input_file_referrences.txt``` contains a list of each file and its associated taxonomic ID. ```genomecounts.txt``` contains a list of each file and its estimated genome length.

Each fasta file was split into multiple parts using ```fasta-splitter.pl``` and each of these were converted to fastq format using scripts in ```fastq_gen/```. The error model used was generated as per the BEAR instructions from a smaple downloaded form Illumina's website for sample: 'HiSeqx_Nextera_DNA_Flex_Replicates_of_Coriell_Trio_Samples_48078043'

``` fq_to_count.py ``` is used to count the headers from each generated metagenome to obtain accurate number of reads assigning to each species which was then used to generate the final COMP (common metagenomic profile format) files using ``` bear_seq_counts_to_humanless_comp.R ```. Each COMP file had relative abundance (normalised by genome length) and shannon index calculated with ``` abundance_and_shannon_calculator.R ```.


``` comparisons/ ``` contains each of the scripts used to benchmark test output data. ```comp_performance2.R``` was the main script used to compare input comp files to true comp files and obtain performance metrics. The ```Analysis/``` directory contains raw comp files, the reports for each condition, such as what taxa were reported as false negative/false positive/true positive, and plots for all parameters tested. ```true_comp/``` contains the true composition for each metagenome tested. ```performancelogs/``` contains the summary output of each parameters tested including a subfolder for top performers and the code used to generate plots for the paper.

``` pipelines/ ``` contains outlines of pipelines used to run each tool and example methods of reformatting each tool output. Within this folder ```human_repletion``` has example pipelines for each parameter used for human depletion methods. ```tool_comparison/``` has example pipelines of running each tool but is not an exhaustive representation of each parameter ran.

``` motus_abundance_correlation/ ``` contains scripts used to derive the correlation between motus relative abundance of true positive classifications vs actual relative abundance in the simulated metagenomic datasets

``` simulation_summary/ ``` contains summary of the simulated metagenomes

``` pathseq/ ``` contains analysis from using the pathseq tool

``` krakenuniq/ ``` contains the analysis from using the krakenuniq tool which includes adjusting filtering parameters and trialling the tool on all datasets (following metagenomic assembly using MetaSPAdes

``` spades_contig_coverage_filtering/ ``` contains the analysis used when altering the minimum contig coverage produced from MetaSPAdes assembly and shows that performance is not particularly altered

``` human_depletion/``` contains data + ploting scripts for estimating the best human depletion tool and filtering bbduk parameters

``` 008v/``` contains information and plot scripts about metaspades assembled viral dataset 008v and kraken classification
