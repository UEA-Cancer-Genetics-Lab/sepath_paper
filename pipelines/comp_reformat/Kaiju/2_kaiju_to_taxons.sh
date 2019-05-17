#!/bin/bash

#This script will launch the kaiju accessory script to add taxon paths for each of the merged kaiju outputs


bsub -q short-ib -J addtaxons001 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 001_greedy_merged.kaiju -o 001_greedy_merged.taxons"; bsub -q short-ib -J addtaxons002 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 002_greedy_merged.kaiju -o 002_greedy_merged.taxons"; bsub -q short-ib -J addtaxons003 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 003_greedy_merged.kaiju -o 003_greedy_merged.taxons"; bsub -q short-ib -J addtaxons004 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 004_greedy_merged.kaiju -o 004_greedy_merged.taxons"; bsub -q short-ib -J addtaxons005 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 005_greedy_merged.kaiju -o 005_greedy_merged.taxons"; bsub -q short-ib -J addtaxons006 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 006_greedy_merged.kaiju -o 006_greedy_merged.taxons"; bsub -q short-ib -J addtaxons007 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 007_greedy_merged.kaiju -o 007_greedy_merged.taxons"; bsub -q short-ib -J addtaxons008 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 008_greedy_merged.kaiju -o 008_greedy_merged.taxons"; bsub -q short-ib -J addtaxons009 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 009_greedy_merged.kaiju -o 009_greedy_merged.taxons"; bsub -q short-ib -J addtaxons010 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 010_greedy_merged.kaiju -o 010_greedy_merged.taxons"; bsub -q short-ib -J addtaxons011 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 011_greedy_merged.kaiju -o 011_greedy_merged.taxons"; bsub -q short-ib -J addtaxons012 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 012_greedy_merged.kaiju -o 012_greedy_merged.taxons"; bsub -q short-ib -J addtaxons013 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 013_greedy_merged.kaiju -o 013_greedy_merged.taxons"; bsub -q short-ib -J addtaxons014 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 014_greedy_merged.kaiju -o 014_greedy_merged.taxons"; bsub -q short-ib -J addtaxons015 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 015_greedy_merged.kaiju -o 015_greedy_merged.taxons"; bsub -q short-ib -J addtaxons016 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 016_greedy_merged.kaiju -o 016_greedy_merged.taxons"; bsub -q short-ib -J addtaxons017 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 017_greedy_merged.kaiju -o 017_greedy_merged.taxons"; bsub -q short-ib -J addtaxons018 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 018_greedy_merged.kaiju -o 018_greedy_merged.taxons"; bsub -q short-ib -J addtaxons019 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 019_greedy_merged.kaiju -o 019_greedy_merged.taxons"; bsub -q short-ib -J addtaxons020 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 020_greedy_merged.kaiju -o 020_greedy_merged.taxons"; bsub -q short-ib -J addtaxons021 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 021_greedy_merged.kaiju -o 021_greedy_merged.taxons"; bsub -q short-ib -J addtaxons022 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 022_greedy_merged.kaiju -o 022_greedy_merged.taxons"; bsub -q short-ib -J addtaxons023 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 023_greedy_merged.kaiju -o 023_greedy_merged.taxons"; bsub -q short-ib -J addtaxons024 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 024_greedy_merged.kaiju -o 024_greedy_merged.taxons"; bsub -q short-ib -J addtaxons025 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 025_greedy_merged.kaiju -o 025_greedy_merged.taxons"; bsub -q short-ib -J addtaxons026 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 026_greedy_merged.kaiju -o 026_greedy_merged.taxons"; bsub -q short-ib -J addtaxons027 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 027_greedy_merged.kaiju -o 027_greedy_merged.taxons"; bsub -q short-ib -J addtaxons028 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 028_greedy_merged.kaiju -o 028_greedy_merged.taxons"; bsub -q short-ib -J addtaxons029 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 029_greedy_merged.kaiju -o 029_greedy_merged.taxons"; bsub -q short-ib -J addtaxons030 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 030_greedy_merged.kaiju -o 030_greedy_merged.taxons"; bsub -q short-ib -J addtaxons031 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 031_greedy_merged.kaiju -o 031_greedy_merged.taxons"; bsub -q short-ib -J addtaxons032 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 032_greedy_merged.kaiju -o 032_greedy_merged.taxons"; bsub -q short-ib -J addtaxons033 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 033_greedy_merged.kaiju -o 033_greedy_merged.taxons"; bsub -q short-ib -J addtaxons034 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 034_greedy_merged.kaiju -o 034_greedy_merged.taxons"; bsub -q short-ib -J addtaxons035 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 035_greedy_merged.kaiju -o 035_greedy_merged.taxons"; bsub -q short-ib -J addtaxons036 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 036_greedy_merged.kaiju -o 036_greedy_merged.taxons"; bsub -q short-ib -J addtaxons037 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 037_greedy_merged.kaiju -o 037_greedy_merged.taxons"; bsub -q short-ib -J addtaxons038 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 038_greedy_merged.kaiju -o 038_greedy_merged.taxons"; bsub -q short-ib -J addtaxons039 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 039_greedy_merged.kaiju -o 039_greedy_merged.taxons"; bsub -q short-ib -J addtaxons040 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 040_greedy_merged.kaiju -o 040_greedy_merged.taxons"; bsub -q short-ib -J addtaxons041 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 041_greedy_merged.kaiju -o 041_greedy_merged.taxons"; bsub -q short-ib -J addtaxons042 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 042_greedy_merged.kaiju -o 042_greedy_merged.taxons"; bsub -q short-ib -J addtaxons043 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 043_greedy_merged.kaiju -o 043_greedy_merged.taxons"; bsub -q short-ib -J addtaxons044 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 044_greedy_merged.kaiju -o 044_greedy_merged.taxons"; bsub -q short-ib -J addtaxons045 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 045_greedy_merged.kaiju -o 045_greedy_merged.taxons"; bsub -q short-ib -J addtaxons046 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 046_greedy_merged.kaiju -o 046_greedy_merged.taxons"; bsub -q short-ib -J addtaxons047 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 047_greedy_merged.kaiju -o 047_greedy_merged.taxons"; bsub -q short-ib -J addtaxons048 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 048_greedy_merged.kaiju -o 048_greedy_merged.taxons"; bsub -q short-ib -J addtaxons049 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 049_greedy_merged.kaiju -o 049_greedy_merged.taxons"; bsub -q short-ib -J addtaxons050 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 050_greedy_merged.kaiju -o 050_greedy_merged.taxons"; bsub -q short-ib -J addtaxons051 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 051_greedy_merged.kaiju -o 051_greedy_merged.taxons"; bsub -q short-ib -J addtaxons052 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 052_greedy_merged.kaiju -o 052_greedy_merged.taxons"; bsub -q short-ib -J addtaxons053 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 053_greedy_merged.kaiju -o 053_greedy_merged.taxons"; bsub -q short-ib -J addtaxons054 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 054_greedy_merged.kaiju -o 054_greedy_merged.taxons"; bsub -q short-ib -J addtaxons055 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 055_greedy_merged.kaiju -o 055_greedy_merged.taxons"; bsub -q short-ib -J addtaxons056 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 056_greedy_merged.kaiju -o 056_greedy_merged.taxons"; bsub -q short-ib -J addtaxons057 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 057_greedy_merged.kaiju -o 057_greedy_merged.taxons"; bsub -q short-ib -J addtaxons058 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 058_greedy_merged.kaiju -o 058_greedy_merged.taxons"; bsub -q short-ib -J addtaxons059 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 059_greedy_merged.kaiju -o 059_greedy_merged.taxons"; bsub -q short-ib -J addtaxons060 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 060_greedy_merged.kaiju -o 060_greedy_merged.taxons"; bsub -q short-ib -J addtaxons061 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 061_greedy_merged.kaiju -o 061_greedy_merged.taxons"; bsub -q short-ib -J addtaxons062 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 062_greedy_merged.kaiju -o 062_greedy_merged.taxons"; bsub -q short-ib -J addtaxons063 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 063_greedy_merged.kaiju -o 063_greedy_merged.taxons"; bsub -q short-ib -J addtaxons064 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 064_greedy_merged.kaiju -o 064_greedy_merged.taxons"; bsub -q short-ib -J addtaxons065 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 065_greedy_merged.kaiju -o 065_greedy_merged.taxons"; bsub -q short-ib -J addtaxons066 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 066_greedy_merged.kaiju -o 066_greedy_merged.taxons"; bsub -q short-ib -J addtaxons067 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 067_greedy_merged.kaiju -o 067_greedy_merged.taxons"; bsub -q short-ib -J addtaxons068 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 068_greedy_merged.kaiju -o 068_greedy_merged.taxons"; bsub -q short-ib -J addtaxons069 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 069_greedy_merged.kaiju -o 069_greedy_merged.taxons"; bsub -q short-ib -J addtaxons070 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 070_greedy_merged.kaiju -o 070_greedy_merged.taxons"; bsub -q short-ib -J addtaxons071 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 071_greedy_merged.kaiju -o 071_greedy_merged.taxons"; bsub -q short-ib -J addtaxons072 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 072_greedy_merged.kaiju -o 072_greedy_merged.taxons"; bsub -q short-ib -J addtaxons073 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 073_greedy_merged.kaiju -o 073_greedy_merged.taxons"; bsub -q short-ib -J addtaxons074 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 074_greedy_merged.kaiju -o 074_greedy_merged.taxons"; bsub -q short-ib -J addtaxons075 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 075_greedy_merged.kaiju -o 075_greedy_merged.taxons"; bsub -q short-ib -J addtaxons076 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 076_greedy_merged.kaiju -o 076_greedy_merged.taxons"; bsub -q short-ib -J addtaxons077 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 077_greedy_merged.kaiju -o 077_greedy_merged.taxons"; bsub -q short-ib -J addtaxons078 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 078_greedy_merged.kaiju -o 078_greedy_merged.taxons"; bsub -q short-ib -J addtaxons079 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 079_greedy_merged.kaiju -o 079_greedy_merged.taxons"; bsub -q short-ib -J addtaxons080 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 080_greedy_merged.kaiju -o 080_greedy_merged.taxons"; bsub -q short-ib -J addtaxons081 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 081_greedy_merged.kaiju -o 081_greedy_merged.taxons"; bsub -q short-ib -J addtaxons082 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 082_greedy_merged.kaiju -o 082_greedy_merged.taxons"; bsub -q short-ib -J addtaxons083 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 083_greedy_merged.kaiju -o 083_greedy_merged.taxons"; bsub -q short-ib -J addtaxons084 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 084_greedy_merged.kaiju -o 084_greedy_merged.taxons"; bsub -q short-ib -J addtaxons085 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 085_greedy_merged.kaiju -o 085_greedy_merged.taxons"; bsub -q short-ib -J addtaxons086 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 086_greedy_merged.kaiju -o 086_greedy_merged.taxons"; bsub -q short-ib -J addtaxons087 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 087_greedy_merged.kaiju -o 087_greedy_merged.taxons"; bsub -q short-ib -J addtaxons088 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 088_greedy_merged.kaiju -o 088_greedy_merged.taxons"; bsub -q short-ib -J addtaxons089 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 089_greedy_merged.kaiju -o 089_greedy_merged.taxons"; bsub -q short-ib -J addtaxons090 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 090_greedy_merged.kaiju -o 090_greedy_merged.taxons"; bsub -q short-ib -J addtaxons091 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 091_greedy_merged.kaiju -o 091_greedy_merged.taxons"; bsub -q short-ib -J addtaxons092 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 092_greedy_merged.kaiju -o 092_greedy_merged.taxons"; bsub -q short-ib -J addtaxons093 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 093_greedy_merged.kaiju -o 093_greedy_merged.taxons"; bsub -q short-ib -J addtaxons094 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 094_greedy_merged.kaiju -o 094_greedy_merged.taxons"; bsub -q short-ib -J addtaxons095 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 095_greedy_merged.kaiju -o 095_greedy_merged.taxons"; bsub -q short-ib -J addtaxons096 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 096_greedy_merged.kaiju -o 096_greedy_merged.taxons"; bsub -q short-ib -J addtaxons097 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 097_greedy_merged.kaiju -o 097_greedy_merged.taxons"; bsub -q short-ib -J addtaxons098 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 098_greedy_merged.kaiju -o 098_greedy_merged.taxons"; bsub -q short-ib -J addtaxons099 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 099_greedy_merged.kaiju -o 099_greedy_merged.taxons"; bsub -q short-ib -J addtaxons100 -M 20000 -R "rusage[mem=20000]" "addTaxonNames -u -r kingdom,phylum,class,order,family,genus,species -t ~/scratch/kaijudb/nodes.dmp -n ~/scratch/kaijudb/names.dmp -i 100_greedy_merged.kaiju -o 100_greedy_merged.taxons" 
