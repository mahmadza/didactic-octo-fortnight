


cd ~/Documents/GitHub/didactic-octo-fortnight

#grab sequences
export BLASTDB=~/Applications/ncbi-blast-2.10.1+/blastdb/dm3

width=50

#download eTSS sequences
cat zfh1_genome-wide_eTSS.txt | while read l; do
  chr=$(echo $l | awk '{print $1}')
  start=$(echo $l | awk -v p=$width '{print $2+1-p}')
  end=$(echo $l | awk -v p=$width '{print $3+p}')
  tss=$(echo $l | awk '{print $4}')
  strand=$(echo $l | awk '($5=="+"){s="plus"}($5=="-"){s="minus"} END{print s}')

  seq=$(~/Applications/ncbi-blast-2.10.1+/bin/blastdbcmd -db dm3 \
  -entry $chr -range ${start}-${end} -strand ${strand} -outfmt %s)

  echo -en $chr"\t"$start"\t"$end"\t"$tss"\t"$(echo $l | awk '{print $5}')"\t"$seq"\n"

done | gzip -c > zfh1_genome-wide_eTSS_seq.txt

#download other sequences
for i in random zfh1_2 zfh1_3 zfh1_4; do
  cat positions_${i}.txt | while read l; do
    chr=$(echo $l | awk '{print $1}')
    start=$(echo $l | awk -v p=$width '{print $2+1-p}')
    end=$(echo $l | awk -v p=$width '{print $3+p}')
    tss=$(echo $l | awk '{print $4}')
    strand=$(echo $l | awk '($6=="+"){s="plus"}($6=="-"){s="minus"} END{print s}')

    seq=$(~/Applications/ncbi-blast-2.10.1+/bin/blastdbcmd -db dm3 \
    -entry $chr -range ${start}-${end} -strand ${strand} -outfmt %s)

    echo -en $chr"\t"$start"\t"$end"\t"$tss"\t"$(echo $l | awk '{print $5}')"\t"$seq"\n"

  done | gzip -c > positons_${i}_seq.txt
done



#####
