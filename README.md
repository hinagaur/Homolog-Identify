# Identifying homologs

## Performing a BLAST search against nucleotide subject using a protein sequence as the query.

## Introduction

Sequence similarity searching, typically with BLAST, is the most widely used, and most reliable, strategy for characterizing newly determined sequences. Sequence similarity searches can identify ”homologous” proteins or genes by detecting excess similarity – statistically significant similarity that reflects common ancestry. 

Sequence similarity searching to identify homologous sequences is one of the first, and most informative, steps in any analysis of newly determined sequences. Modern protein sequence databases are very comprehensive, so that more than 80% of metagenomic sequence samples typically share significant similarity with proteins in sequence databases. Widely used similarity searching programs, like BLAST (Altschul et al. (1997); units 3.3 and 3.4), PSI-BLAST (Altschul et al., 1997), SSEARCH (Smith and Waterman (1981); Pearson (1991), unit 3.10), FASTA (Pearson and Lipman (1988)) and the HMMER3 (Johnson et al., 2010) programs produce accurate statistical estimates, ensuring protein sequences that share significant similarity also have similar structures. Similarity searching is effective and reliable because sequences that share significant similarity can be inferred to be homologous; they share a common ancestor.

## Functionality of the script: <br>

(a) Given a protein sequence query, performs a blast search against a nucleotide subject. In other words, finds putative homologs of query amino acid sequences in FASTA format <br>
(b) Filter hits to keep only hits with >30% sequence identity and >90% match length (90% of the query sequence length) <br>
(c) Uses Bash loop to identify which genes in a BED file contain the identified homologous domains. (if a gene contains a domain, then the location of the domain will be entirely <br>
    within the boundaries of the gene) <br>
(d) Writes an output file containing the unique gene names which are identified as containing domains. <br>


## Setup: <br>

* Set up a new conda environment and install Blast in that using the following commands- <br>
``` conda create -n myenv ```
* conda install -c bioconda blast <br>
#### Usage of your script should be: <br>

<img width="452" alt="image" src="https://github.com/hinagaur/Homolog-Identify/assets/66309991/47dc7fd9-8cd4-4ba5-8951-5958db47e450">

#### Usage of your script for multiple genomes and their associated bed files: <br>

Refer to the "script_usage.txt" and data for the code and dummy data. <br>


<img width="452" alt="image" src="https://github.com/hinagaur/Homolog-Identify/assets/66309991/0d194420-9bdb-4da5-abc3-4b7db5f784d5">





