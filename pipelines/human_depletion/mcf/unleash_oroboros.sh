#!/bin/bash

#this script will launch oroboros.py which will launch several snakes to obtain unmapped reads from input_files.txt

source dependencies
source path-maker
chmod +x oroboros.py
bsub -J MCF -q long-ib -M 1000 -R "rusage[mem=1000]" "./oroboros.py"
#can change above back to long-ib, long ib was busy so changed 
