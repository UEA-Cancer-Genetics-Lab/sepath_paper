#!/usr/bin/env python

#This script will obtain taxonomy from a file containing a list of NCBI_taxID's (one per line)

import csv
import sys
from ete3 import NCBITaxa


NCBI_LIST = []
with open((sys.argv[1]), 'r') as id_file:
    for line in id_file:
        NCBI_LIST.append(line.rstrip('\n'))

Unfound_ID = []
Unfound_ID.append("Issue obtaining ranks for NCBI taxid numbers:")

ncbi = NCBITaxa()

def get_desired_ranks(taxid, desired_ranks):
    lineage = ncbi.get_lineage(taxid)
    names = ncbi.get_taxid_translator(lineage)
    lineage2ranks = ncbi.get_rank(names)
    ranks2lineage = dict((rank,taxid) for (taxid, rank) in lineage2ranks.items())
    return{'{}_id'.format(rank): ranks2lineage.get(rank, '<not present>') for rank in desired_ranks}

if __name__ == '__main__':
    taxids = NCBI_LIST
    desired_ranks = ['kingdom', 'phylum', 'class', 'order', 'family', 'genus', 'species']
    results = list()
    for taxid in taxids:
        try:
            get_desired_ranks(taxid, desired_ranks)
        except:
            Unfound_ID.append('%s' %taxid)
            continue 
        results.append(list())
        results[-1].append(str(taxid))
        ranks = get_desired_ranks(taxid, desired_ranks)
        for key, rank in ranks.items():
            if rank != '<not present>':
                results[-1].append(list(ncbi.get_taxid_translator([rank]).values())[0])
            else:
                results[-1].append(rank)

    #generate the header
    header = ['NCBI-TaxID']
    header.extend(desired_ranks)
    print('\t'.join(header))

    #print the results
    for result in results:
        print('\t'.join(result))

#write unfound NCBI ID's to file for further investigation
if len(Unfound_ID) >=2:
    with open("NCBI_Error", 'w') as error_file:
        for term in Unfound_ID:
            error_file.write('%s\n' %term)









