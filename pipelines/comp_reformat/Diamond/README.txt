Notes on required format of input to diamond_to_comp.R:

To obtain the precomp ---
1) Form diamond classification - ie diamond blastx --more-sensitive --db ~/data/diamond/database.dmnd -q  001_contigs.fasta -o 001.dmnd --threads 14 -f102
2) Isolate NCBI ID's -- cat 001.dmnd | cut -f 2 > 001_ncbi.dmnd
3) launch script locally to find taxon information: taxid.py 001_ncbi.dmnd > 001.dmnd.taxons
4) find unique values with some counts cat 001.dmnd.preprecomp | sort | uniq -c > 001.dmnd.precomp
4) call this script with the filename Rscript script.R 001.dmnd.precomp
