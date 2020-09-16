



#download dm3 sequences
wget https://hgdownload.soe.ucsc.edu/goldenPath/dm3/bigZips/dm3.fa.gz
#expand
gunzip dm3.fa.gz

#create index
cd ~/Applications/ncbi-blast-2.10.1+/blastdb
../bin/makeblastdb -in ../sequences/dm3.fa -dbtype nucl -out dm3
cd ..





####
