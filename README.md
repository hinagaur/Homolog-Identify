# Homolog-Identify

#### homolog_identify.sh 

Functionality of the script: <br>

(a) Given a protein sequence query, performs a blast search against a nucleotide subject. In other words, finds putative homologs of query amino acid sequences in FASTA format <br>
(b) Filter hits to keep only hits with >30% sequence identity and >90% match length (90% of the query sequence length) <br>
(c) Uses Bash loops to identify which genes in a BED file contain the identified homologous domains. (if a gene contains a domain, then the location of the domain will be entirely <br>
    within the boundaries of the gene) <br>
(d) Write an output file containing the unique gene names which your script identified as containing predicted HK domains. <br>

Usage of your script should be: <br>

homolog_identify.sh <query.faa> <subject.fna> <bedfile> <outfile> <br>
