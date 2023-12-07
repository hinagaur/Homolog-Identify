# Identifying Homologs

## Given a protein sequence query, performs a blast search against a nucleotide subject

## Introduction

Sequence similarity searching, typically with BLAST, is the most widely used, and most reliable, strategy for characterizing newly determined sequences. Sequence similarity searches can identify ”homologous” proteins or genes by detecting excess similarity – statistically significant similarity that reflects common ancestry. 

Sequence similarity searching to identify homologous sequences is one of the first, and most informative, steps in any analysis of newly determined sequences. Modern protein sequence databases are very comprehensive, so that more than 80% of metagenomic sequence samples typically share significant similarity with proteins in sequence databases. Widely used similarity searching programs, like BLAST (Altschul et al. (1997); units 3.3 and 3.4), PSI-BLAST (Altschul et al., 1997), SSEARCH (Smith and Waterman (1981); Pearson (1991), unit 3.10), FASTA (Pearson and Lipman (1988)) and the HMMER3 (Johnson et al., 2010) programs produce accurate statistical estimates, ensuring protein sequences that share significant similarity also have similar structures. Similarity searching is effective and reliable because sequences that share significant similarity can be inferred to be homologous; they share a common ancestor.

## Functionality of the script: <br>

(a) Given a protein sequence query, performs a blast search against a nucleotide subject. In other words, finds putative homologs of query amino acid sequences in FASTA format <br> <br>
(b) Filter hits to keep only hits with >30% sequence identity and >90% match length (90% of the query sequence length) <br>
(c) Uses Bash loop to identify which genes in a BED file contain the identified homologous domains. (if a gene contains a domain, then the location of the domain will be entirely <br>
    within the boundaries of the gene) <br>
(d) Writes an output file containing the unique gene names which are identified as containing domains. <br>


## Setup: <br>

• Creare a new conda environment

```
conda create -n myenv
 ```
• Activate the new conda environment
```
conda activate myenv
 ```
• Install blast in the new environment
```
conda install -c bioconda blast
```
• Clone this repository or download zip.
```
https://github.com/hinagaur/Homolog-Identify.git
```
• To run the project (Usage of your script should be: homolog_identify.sh <query.faa> <subject.fna> <bedfile> <outfile>)
```
./homolog_identify.sh Data/HK_domain.faa Data/Wolbachia.fna Data/Wolbachia.bed Wolbachia.txt
```

• For usage of the script for multiple genomes and their associated bed files, refer to the "script_usage.txt" and data for the code and dummy data, respectively. <br>
```
for bed_file in Data/*.bed; do
    if [[ -f "$bed_file" ]]; then
        base_name="${bed_file%.bed}"
        fna_file="$base_name.fna"
        
        if [[ -f "$fna_file" ]]; then
            output="$base_name.txt"
            ./homolog_identify.sh Data/HK_domain.faa "$fna_file" "$bed_file" "$output"
        fi
    fi
done
```
