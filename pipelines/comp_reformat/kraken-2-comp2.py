#!/Users/agihawi/miniconda3/bin/python3
#This script will take a kraken profile (in metaphlan2 style) and reformat them to the common metagenomic profile output
#use: from the command line you can call the script, then the arguments are the filenames you wish to process
#must be in directory of files to be processed


import sys
import os

#first system argument must be the original fasta/fastq file! call whole file path.
specifiedfiles = (sys.argv) # (sys.argv) # set to (sys.argv) # for debugging set to: ['arbitraryelement', 'N30Q35.kraken']
filelist = [] 
actualfilelist = []



#create directory to use from specifiedfiles
calleddirectory  = (os.path.dirname(specifiedfiles[-1]))
#directorytouse = (str(os.getcwd()))
#directorytouse = (directorytouse + '/')
#actualdirectory = (directorytouse + str(calleddirectory))



#create filename to store new file under, replace .txt with .comp if present
filelist.append(os.path.basename(specifiedfiles[-1]))
actualfilelist.append(specifiedfiles[-1])

#check first system argument is a fastq/fasta file
#if specifiedfiles[1][-6:] is not '.fastq' or specifiedfiles[1][-6:] is not '.fasta':
#    raise ValueError(specifiedfiles[1] + ' is not a valid .fastq or .fasta file')

#form a dictionary of names and taxid's from names.dmp obtained from ftp://ftp.ncbi.nih.gov/pub/taxonomy/ taxdump
name_dict = {}
with open("/gpfs/home/znb17pxu/bin/names.dmp") as namesfile:
    input_file_list = set(line.rstrip("\n") for line in namesfile)
    for term in input_file_list:
        idnum = (term.split('|')[0])
        name = (term.split('|')[1])
        idnum2 = idnum.replace('\t', '')
        name2 = name.replace('\t', '')
        name_dict[name2] = idnum2

print("names.dmp loaded")

#begin cycling files specified from command line
print("beginning conversion")
for file in actualfilelist:
    if file[-4:] == ".txt":
        filename = file[:-4]
    elif file[-7:] == ".kraken":
        filename = file[:-7]
    else:
        filename = file
    newfilename = (filename + ".comp")
    
    joinedtaxonlist = ''

    #below checks if the file is already in the output, script stopped if it is.
    if os.path.isfile(newfilename) == True:
       raise ValueError(newfilename + ' already exists, check folder before running anlysis')

    #write the colum headers for the new file
    with open(newfilename, "a") as newfile:
        newfile.write("NCBI-TaxID\tKingdom\tPhylum\tClass\tOrder\tFamily\tGenus\tSpecies\tNumber_of_Reads\tRelative_Abundance\n")

    #open NCBI-taxID database to return ID numbers with names.
    NCBI_list_clean = {}
    with open("/gpfs/home/znb17pxu/bin/MP_Class2Tree.edit.csv", "r") as NCBI:
        NCBI_database = set(line.rstrip("\n") for line in NCBI)
        for term in NCBI_database:
            infopair= [f.replace('"', '') for f in term.split("\t")]
            NCBI_list_clean[infopair[0]] = infopair[1]
            
        
    with open(file) as handle_inputfile:
        input_file_list = set(line.rstrip("\n") for line in handle_inputfile)
        for classification in input_file_list:
            taxon = []
            taxon.extend(classification.split("|"))
            taxon.extend(taxon[-1].split("\t"))
            
            #set the search term variable for the NCBI-taxID and search ncbi_list_clean for it
            searchterm = ''
            searchterm = ((classification.split("\t"))[0])
            if searchterm in NCBI_list_clean:
                TaxID = (NCBI_list_clean[searchterm] + '\t')
            #if search term isn't in the NCBI_list_clean, then search the NCBI tax dump for the taxid at the most specific level possible
            elif searchterm not in NCBI_list_clean:
                if (len(taxon)>=2) and (taxon[-2][3:]) in name_dict:
                    TaxID = ((name_dict[(taxon[-2])[3:]]) + "\t")
                elif (len(taxon)>=3) and (taxon[-3][3:]) in name_dict:
                    TaxID = ((name_dict[(taxon[-3])[3:]]) + "\t")
                elif(len(taxon)>=4) and (taxon[-4][3:]) in name_dict:
                    TaxID = ((name_dict[(taxon[-4])[3:]]) + "\t")
                elif(len(taxon)>=5) and (taxon[-5][3:]) in name_dict:
                    TaxID = ((name_dict[(taxon[-5])[3:]]) + "\t")
                elif(len(taxon)>=6) and (taxon[-6][3:]) in name_dict:
                    TaxID = ((name_dict[(taxon[-6])[3:]]) + "\t")
                elif(len(taxon)>=7) and (taxon[-7][3:]) in name_dict:
                    TaxID = ((name_dict[(taxon[-7])[3:]]) + "\t")
                elif(len(taxon)>=8) and (taxon[-8][3:]) in name_dict:
                    TaxID = ((name_dict[(taxon[-8])[3:]]) + "\t")
                elif(len(taxon)>=9) and (taxon[-9][3:]) in name_dict:
                    TaxID = ((name_dict[(taxon[-9])[3:]]) + "\t")
                elif(len(taxon)>=10) and (taxon[-10][3:]) in name_dict:
                    TaxID = ((name_dict[(taxon[-10])[3:]]) + "\t")
                else:
                    TaxID = 'TAXID\t'
            else:
                TaxID = 'TAXID\t'
                
            del taxon[-3] #get rid of species with tab in now that 2 others created
            
            
            taxonlist = [TaxID, '\t', '\t', '\t', '\t', '\t', '\t', '\t', '\t', '\t']
            #print(taxon)# taxid  K,    P,    C,    O,    F,    G,    S,    R,    A
            for item in taxon:
                if item[0:3] == 'd__':
                    pass
                if item[0:3]=='k__':
                    taxonlist[1] = (item[3:] + '\t')
                elif item[0:3]=='p__':
                    taxonlist[2] = (item[3:] + '\t')
                elif item[0:3]=='c__':
                    taxonlist[3] = (item[3:] + '\t')
                elif item[0:3]=='o__':
                    taxonlist[4] = (item[3:] + '\t')
                elif item[0:3]=='f__':
                    taxonlist[5] = (item[3:] + '\t')
                elif item[0:3]=='g__':
                    taxonlist[6] = (item[3:] + '\t')
                elif item[0:3]=='s__':
                    taxonlist[7] = (item[3:] + '\t')
                else:
                    pass
            taxonlist[-2] = (taxon[-1] + '\t') #assign reads to second from last column

                
            #join the terms in the list so they print as a string to the new file rather than a list with [brackets]
            joinedtaxonlist = str(''.join(taxonlist))
            #write the classification data to the new .comp file
            with open(newfilename+"temp", "a") as new_comp_file:
                new_comp_file.write((joinedtaxonlist)+ '\n')


    #calculating abundances
    with open(newfilename+"temp") as new_comp_file:
        newcompfilelines = set(line.rstrip("\n") for line in new_comp_file)
    comptaxon = []
    for line in newcompfilelines:
        comptaxon.append(line.split("\t"))
 
    #calculate kingdom level abundance
    kingdomlevellist = []
    for taxon2 in comptaxon:
        if (taxon2[2] == '') and (len(taxon2[1]) > 1) and (taxon2[3] == '') and (taxon2[4] == '') and (taxon2[5] == '') and (taxon2[6] == '') and (taxon2[7] == ''):
            kingdomlevellist.append(taxon2)
        
    totalkingdomreads = 0
    for taxon2 in kingdomlevellist:
        totalkingdomreads = totalkingdomreads + int(taxon2[8])
        
    for taxon2 in kingdomlevellist:
        abundance = float((int(taxon2[8]) / totalkingdomreads)*100)
        taxon2[9] = str(abundance)
  
        
    #calculate phylum level abundance
    phylumlevellist = []
    for taxon2 in comptaxon:
        if (taxon2[3] == '') and (len(taxon2[2]) > 0) and (taxon2[4] == '') and (taxon2[5] == '') and (taxon2[6] == '') and (taxon2[7] == ''):
            phylumlevellist.append(taxon2)
        
    totalphylumreads = 0
    for taxon2 in phylumlevellist:
        totalphylumreads = totalphylumreads + int(taxon2[8])
        
    for taxon2 in phylumlevellist:
        abundance = float((int(taxon2[8]) / totalphylumreads)*100)
        taxon2[9] = str(abundance)
        
    #calculate class level abundance
    classlevellist = []
    for taxon2 in comptaxon:
        if (taxon2[4] == '') and (len(taxon2[3]) > 0) and (taxon2[5] == '') and (taxon2[6] == '') and (taxon2[7] == ''):
            classlevellist.append(taxon2)
        
    totalclassreads = 0
    for taxon2 in classlevellist:
        totalclassreads = totalclassreads + int(taxon2[8])
        
    for taxon2 in classlevellist:
        abundance = float((int(taxon2[8]) / totalclassreads)*100)
        taxon2[9] = str(abundance) 
        
    #calculate order level abundance
    orderlevellist = []
    for taxon2 in comptaxon:
        if (taxon2[5] == '') and (len(taxon2[4]) > 0) and (taxon2[6] == '') and (taxon2[7] == ''):
            orderlevellist.append(taxon2)
        
    totalorderreads = 0
    for taxon2 in orderlevellist:
        totalorderreads = totalorderreads + int(taxon2[8])
        
    for taxon2 in orderlevellist:
        abundance = float((int(taxon2[8]) / totalorderreads)*100)
        taxon2[9] = str(abundance) 
        
    #calculate family level abundance
    familylevellist = []
    for taxon2 in comptaxon:
        if (taxon2[6] == '') and (len(taxon2[5]) > 0) and (taxon2[7] == ''):
            familylevellist.append(taxon2)
        
    totalfamilyreads = 0
    for taxon2 in familylevellist:
        totalfamilyreads = totalfamilyreads + int(taxon2[8])
        
    for taxon2 in familylevellist:
        abundance = float((int(taxon2[8]) / totalfamilyreads)*100)
        taxon2[9] = str(abundance) 
        
    #calculate genus level abundance
    genuslevellist = []
    for taxon2 in comptaxon:
        if (taxon2[7] == '') and (len(taxon2[6]) > 0):
            genuslevellist.append(taxon2)
        
    totalgenusreads = 0
    for taxon2 in genuslevellist:
        totalgenusreads = totalgenusreads + int(taxon2[8])
        
    for taxon2 in genuslevellist:
        abundance = float((int(taxon2[8]) / totalgenusreads)*100)
        taxon2[9] = str(abundance)
        
    #calculate species level abundance
    specieslevellist = []
    for taxon2 in comptaxon:
        if (len(taxon2[7]) > 1): #no header in temp file, so all taxon2[8] below are integers
            specieslevellist.append(taxon2)
        
    totalspeciesreads = 0
    for taxon2 in specieslevellist:
        totalspeciesreads = totalspeciesreads + int(taxon2[8])
        
        
    for taxon2 in specieslevellist:
        abundance = float((int(taxon2[8]) / totalspeciesreads)*100)
        taxon2[9] = str(abundance)
        
    #form lists with \t and \n in so they can just be printed to the new file.     
    kingdomlist = []
    for classification in kingdomlevellist:
        tempkingdomlist = []
        for term in classification:
            tempkingdomlist.append(term + '\t')
        finaltempterm = tempkingdomlist[9]
        tempkingdomlist[9] = (finaltempterm[:-1] + '\n') #may need to be set to -2
        del tempkingdomlist[10]
        kingdomlist.extend(tempkingdomlist)
        
    joinedkingdoms = str(''.join(kingdomlist))

    phylumlist = []
    for classification in phylumlevellist:
        tempphylumlist = []
        for term in classification:
            tempphylumlist.append(term + '\t')
        finaltempterm = tempphylumlist[9]
        tempphylumlist[9] = (finaltempterm[:-1] + '\n') #may need to be set to -2
        del tempphylumlist[10]
        phylumlist.extend(tempphylumlist)
        
    joinedphylums = str(''.join(phylumlist))
    
    classlist = []
    for classification in classlevellist:
        tempclasslist = []
        for term in classification:
            tempclasslist.append(term + '\t')
        finaltempterm = tempclasslist[9]
        tempclasslist[9] = (finaltempterm[:-1] + '\n') #may need to be set to -2
        del tempclasslist[10]
        classlist.extend(tempclasslist)
        
    joinedclasss = str(''.join(classlist))
    
    orderlist = []
    for classification in orderlevellist:
        temporderlist = []
        for term in classification:
            temporderlist.append(term + '\t')
        finaltempterm = temporderlist[9]
        temporderlist[9] = (finaltempterm[:-1] + '\n') #may need to be set to -2
        del temporderlist[10]
        orderlist.extend(temporderlist)
        
    joinedorders = str(''.join(orderlist))
    
    
    familylist = []
    for classification in familylevellist:
        tempfamilylist = []
        for term in classification:
            tempfamilylist.append(term + '\t')
        finaltempterm = tempfamilylist[9]
        tempfamilylist[9] = (finaltempterm[:-1] + '\n') #may need to be set to -2
        del tempfamilylist[10]
        familylist.extend(tempfamilylist)
        
    joinedfamilys = str(''.join(familylist))
    
    genuslist = []
    for classification in genuslevellist:
        tempgenuslist = []
        for term in classification:
            tempgenuslist.append(term + '\t')
        finaltempterm = tempgenuslist[9]
        tempgenuslist[9] = (finaltempterm[:-1] + '\n') #may need to be set to -2
        del tempgenuslist[10]
        genuslist.extend(tempgenuslist)
        
    joinedgenuss = str(''.join(genuslist))
    
    
    specieslist = []
    for classification in specieslevellist:
        tempspecieslist = []
        for term in classification:
            tempspecieslist.append(term + '\t')
        finaltempterm = tempspecieslist[9]
        tempspecieslist[9] = (finaltempterm[:-1] + '\n') #may need to be set to -2
        del tempspecieslist[10]
        specieslist.extend(tempspecieslist)
        
    joinedspeciess = str(''.join(specieslist))
 
    #write the joined lists to the new file with abundances
    with open(newfilename, "a") as new_comp_file:
        new_comp_file.write(joinedkingdoms)
        new_comp_file.write(joinedphylums)
        new_comp_file.write(joinedclasss)
        new_comp_file.write(joinedorders)
        new_comp_file.write(joinedfamilys)
        new_comp_file.write(joinedgenuss)
        new_comp_file.write(joinedspeciess)
    
    #get rid of the temporary file
    os.remove(newfilename+"temp")
