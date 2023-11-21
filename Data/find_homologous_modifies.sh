#!/bin/bash

query_file=$1
genome_assembly=$2
bed_file=$3
out_file=$4


tblastn -query $query_file  -subject $genome_assembly  -outfmt "6 qseqid sseqid pident length qlen mismatch gapopen qstart qend sstart send evalue bitscore" -out $out_file
awk -F'\t' '$3 > 30 && ($4/$5)*100 > 90' $out_file > blastmatch1.txt

# Count the number of perfect matches
NUMBER=$(wc -l < blastmatch1.txt)

awk -F'\t' '{print $10, $11}' blastmatch1.txt > blast_coordinates.txt

GENES=$(while read -r start end; do
    # Find the gene names that match the coordinates and append to a result file
    awk -v start="$start" -v end="$end" '$2 < start && $3 > end {print $4}' $bed_file
done < blast_coordinates.txt | sort | uniq)

echo "The number of matches is $NUMBER "
echo "gene names in ${bed_file%.*} are $GENES"
