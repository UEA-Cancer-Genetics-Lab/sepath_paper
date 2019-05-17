#!/bin/bash

for x in "001" "002" "003" "004" "005" "006" "007" "008" "009" "010" "011" "012" "013" "014" "015" "016" "017" "018" "019" "020"; do mkdir $x; gunzip $x\_bear_unmapped.?.fastq.gz; bsub -q short-ib -M 60000 -R "rusage[mem=60000]" -J gottcha -x "gottcha.pl --threads 8 -outdir $x\/ --input $x\_bear_unmapped.1.fastq,$x\_bear_unmapped.2.fastq,$x\_bear_unmapped.0.fastq --minq 15 --mode all --database ~/programs/gottcha/database/GOTTCHA_BACTERIA_c4937_k24_u30_xHUMAN3x.genus; rm -f $x\_bear_unmapped.?.fastq"; sleep 600; done
