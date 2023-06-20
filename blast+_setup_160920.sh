

# This is to set up NCBI Blast application
# The application is used to download the DNA sequences

cd ~/Applications/ncbi-blast-2.10.1+

#download dm3 sequences
cd sequences
wget https://hgdownload.soe.ucsc.edu/goldenPath/dm3/bigZips/dm3.fa.gz
#expand
gunzip dm3.fa.gz

#build index for dm3
cd ~/Applications/ncbi-blast-2.10.1+
./bin/makeblastdb -in sequences/dm3.fa -dbtype nucl -out blastdb/dm3 -parse_seqids




####
