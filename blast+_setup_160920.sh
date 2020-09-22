



cd ~/Applications/ncbi-blast-2.10.1+

#download dm3 sequences
cd sequences
wget https://hgdownload.soe.ucsc.edu/goldenPath/dm3/bigZips/dm3.fa.gz
#expand
gunzip dm3.fa.gz

#build index
cd ~/Applications/ncbi-blast-2.10.1+
./bin/makeblastdb -in sequences/dm3.fa -dbtype nucl -out blastdb/dm3 -parse_seqids


#grab sequences
export BLASTDB=~/Applications/ncbi-blast-2.10.1+/blastdb/dm3

cd ~/Applications/ncbi-blast-2.10.1+
./bin/blastdbcmd -db dm3 -entry all -range 20-40 -strand minus




####
