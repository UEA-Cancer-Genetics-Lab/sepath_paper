#!/usr/bin/env python
import os
import sys

kraken_file = sys.argv[-1]

with open(kraken_file, "r") as k:
    contents = k.readlines()
    contents = contents[0].split('\t')

node = contents[1] 
#print(node)

#remove \n
unsplit_class = (contents[4])[:-1]
classifications = unsplit_class.split(' ')

#print(classifications)
#declare empty list for tax id's
taxid_count = []

#look through ncbi tax_id : k-mer count and multiply each tax id by each count
for term in classifications:
    items = term.split(':')
    #print(items)
    class_string = []
    #append ncbi id to class_string for each item
    for i in range(int(items[1])):
        class_string.append(items[0])
    #extend overall list by each ncbi tax id mentioned
    taxid_count.extend(class_string)


#Now sort the list and calculate how many counts of each unique tax id there are
taxid_count.sort()

#function to count unique elements in the list
print("NCBI_taxID	k_mer_counts")
for term in set(taxid_count):
    print("%s	%s" %(term,taxid_count.count(term)))
