#!/usr/bin/env python

import os
import glob
import time

outdir = '../../cleaned_data/'

with open('input_files.txt') as f:
    inputfiles = f.read().splitlines()

#command to launch snakemake
launchsnake = 'bsub -J motu_snek -q long-eth -M 10000 -R "rusage[mem=10000]" "snakemake -s motu.snake --cluster \\"bsub -q {params.queue} {params.cluster}\\" --jobs 20 --latency-wait 1200 --timestamp"'

x = 0
while x < len(inputfiles):
    readpair = [inputfiles[x],inputfiles[(x+1)],inputfiles[(x+2)]]
    print("Processing: %s" %readpair)
    os.system('cp %s ./' %(readpair[0]))
    os.system('cp %s ./' %(readpair[1]))
    os.system('cp %s ./' %(readpair[2]))
    R = os.path.basename(inputfiles[x])
    #First_three_numbers = (inputfiles[x])[:-2]
    First_three_numbers = R[0:3] # create first three numbers to look out for in filesdone/ changed for [x]-2 to test if loop works - might be different for genomes that aren't just 3 letters
    print("Looking for file: %s" %First_three_numbers)
    #launch snake
    os.system("%s" %launchsnake)
    while (os.path.isfile("filesdone/%s" %First_three_numbers) == False):
        print("%s not found, trying again in 10 minutes" %First_three_numbers)
        time.sleep(600)
    x=(x + 3)
    #house keeping
    os.system("rm -f *.fastq.gz")
