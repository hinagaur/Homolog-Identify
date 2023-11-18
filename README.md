# Homolog-Identify

### homolog_identify.sh 

#### Pre-requisites: <br>

* Set up a new conda environment and install Blast in that using the following commands- <br>
* conda create -n myenv <br>
* conda install -c bioconda blast <br>

#### Functionality of the script: <br>

(a) Given a protein sequence query, performs a blast search against a nucleotide subject. In other words, finds putative homologs of query amino acid sequences in FASTA format <br>
(b) Filter hits to keep only hits with >30% sequence identity and >90% match length (90% of the query sequence length) <br>
(c) Uses Bash loop to identify which genes in a BED file contain the identified homologous domains. (if a gene contains a domain, then the location of the domain will be entirely <br>
    within the boundaries of the gene) <br>
(d) Writes an output file containing the unique gene names which are identified as containing domains. <br>

#### Usage of your script should be: <br>

<img width="452" alt="image" src="https://github.com/hinagaur/Homolog-Identify/assets/66309991/47dc7fd9-8cd4-4ba5-8951-5958db47e450">

#### Usage of your script for multiple genomes and their associated bed files: <br>

Refer to the "script_usage.txt" and data for the code and dummy data. <br>

<img width="452" alt="image" src="https://github.com/hinagaur/Homolog-Identify/assets/66309991/0d194420-9bdb-4da5-abc3-4b7db5f784d5">





