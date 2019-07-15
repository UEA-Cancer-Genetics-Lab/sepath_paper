#!/bin/bash

mkdir =pv filtered
cat 008v_non_viral.comp | grep -v 'Number_of_Reads' | awk -F '\t' '$9>100 {print ;}' > filtered/008v_100f_non_viral.comp
cat 008v_viral.comp | grep -v 'Number_of_Reads' | awk -F '\t' '$9>100 {print ;}' > filtered/008v_100f_viral.comp
