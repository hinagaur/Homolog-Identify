#!/bin/bash

query_file=$1
genome_assembly=$2
bed_file=$3
out_file=$4


tblastn -query $query_file  -subject $genome_assembly  -outfmt "6 qseqid sseqid pident length qlen mismatch \
gapopen qstart \
qend sstart send evalue bitscore" | awk -F'\t' '$3 > 30 && ($4/$5)*100 > 90' > blastmatch1.txt

## Extracting start and stop positions from the blast file

awk -F'\t' '{print $10, $11}' blastmatch1.txt > blast_coordinates.txt

## Iterating through the start and stop positions in the bed file and finding the genes
## for the blast hits which lie "between" the coordinates of genes of the bed file

GENES=$(while read -r start end; do
    # Find the gene names that match the coordinates and append to a result file
    awk -v start="$start" -v end="$end" '$2 < start && $3 >= end {print $4}' $bed_file
done < blast_coordinates.txt | sort | uniq)

## Counting the genes found 
GENE_NUMBER=$(echo "$GENES" | wc -l)

## Adding the gene names and gene number to a distinct and informative output text file
echo "$GENES" > $out_file

## Getting the organism name without file path
bed_file_base=$(basename "$bed_file")


## Terminal output to display number of genes
echo "Number of genes for ${bed_file_base%.*} genome are: $GENE_NUMBER,  and the output is saved to ${bed_file_base%.*}.txt"