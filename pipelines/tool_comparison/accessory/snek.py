#!/usr/bin/env python

import os

launchsnake = 'bsub -J motu_snek -q long-eth -M 10000 -R "rusage[mem=10000]" "snakemake -s motu.snake --cluster \\"bsub -q {params.queue} {params.cluster}\\" --jobs 20 --latency-wait 1200 --timestamp"'

os.system(launchsnake)
