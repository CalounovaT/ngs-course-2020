#!/bin/bash

IN_FILE=/data-shared/vcf_examples/luscinia_vars.vcf.gz
OUT_FILE=~/substitutions_results.csv
output=$(<$IN_FILE zcat | grep -v '^#' | awk '{print $4, $5}' | tr 'acgtn' 'ACGTN' | grep '^[ACGT] [ACGT]$' | sort | uniq -c | awk '{print $0,";"}')

AC=$(echo $output | tr ';' '\n' | grep "A C" | tr -dc '0-9')
AG=$(echo $output | tr ';' '\n' | grep "A G" | tr -dc '0-9')
AT=$(echo $output | tr ';' '\n' | grep "A T" | tr -dc '0-9')
CA=$(echo $output | tr ';' '\n' | grep "C A" | tr -dc '0-9')
CG=$(echo $output | tr ';' '\n' | grep "C G" | tr -dc '0-9')
CT=$(echo $output | tr ';' '\n' | grep "C T" | tr -dc '0-9')
GA=$(echo $output | tr ';' '\n' | grep "G A" | tr -dc '0-9')
GC=$(echo $output | tr ';' '\n' | grep "G C" | tr -dc '0-9')
GT=$(echo $output | tr ';' '\n' | grep "G T" | tr -dc '0-9')
TA=$(echo $output | tr ';' '\n' | grep "T A" | tr -dc '0-9')
TC=$(echo $output | tr ';' '\n' | grep "T C" | tr -dc '0-9')
TG=$(echo $output | tr ';' '\n' | grep "T G" | tr -dc '0-9')

transitions=$(($AG+$GA+$CT+$TC))
transversions=$(($AC+$CA+$AT+$TA+$CG+$GC+$GT+$TG))
total=$(($transitions+$transversions))
echo "transitions =  $transitions ($(awk "BEGIN {printf \"%.2f\",$transitions/$total}")%)"
echo "transversions = $transversions ($(awk "BEGIN {printf \"%.2f\",$transversions/$total}")%)"
echo "A -> C = $AC ($(awk "BEGIN {printf \"%.2f\",$AC/$total}")%)"
echo "A -> G = $AG ($(awk "BEGIN {printf \"%.2f\",$AG/$total}")%)"
echo "A -> T = $AT ($(awk "BEGIN {printf \"%.2f\",$AT/$total}")%)"
echo "C -> A = $CA ($(awk "BEGIN {printf \"%.2f\",$CA/$total}")%)" 
echo "C -> G = $CG ($(awk "BEGIN {printf \"%.2f\",$CG/$total}")%)"
echo "C -> T = $CT ($(awk "BEGIN {printf \"%.2f\",$CT/$total}")%)"
echo "G -> A = $GA ($(awk "BEGIN {printf \"%.2f\",$GA/$total}")%)"
echo "G -> C = $GC ($(awk "BEGIN {printf \"%.2f\",$GC/$total}")%)"
echo "G -> T = $GT ($(awk "BEGIN {printf \"%.2f\",$GT/$total}")%)"
echo "T -> A = $TA ($(awk "BEGIN {printf \"%.2f\",$TA/$total}")%)"
echo "T -> C = $TC ($(awk "BEGIN {printf \"%.2f\",$TC/$total}")%)"
echo "T -> G = $TG ($(awk "BEGIN {printf \"%.2f\",$TG/$total}")%)"

echo "substitution,count,type" > $OUT_FILE
echo "AC,$AC,transversion" >> $OUT_FILE
echo "AG,$AG,transition" >> $OUT_FILE
echo "AT,$AT,transversion" >> $OUT_FILE
echo "CA,$AC,transversion" >> $OUT_FILE
echo "CG,$CG,transversion" >> $OUT_FILE
echo "CT,$CT,transition" >> $OUT_FILE
echo "GA,$GA,transition" >> $OUT_FILE
echo "GC,$GC,transversion" >> $OUT_FILE
echo "GT,$GT,transversion" >> $OUT_FILE
echo "TA,$TA,transversion" >> $OUT_FILE
echo "TC,$TC,transition" >> $OUT_FILE
echo "TG,$TG,transversion" >> $OUT_FILE
