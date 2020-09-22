




cd cd ~/Documents/GitHub/didactic-octo-fortnight

#grab sequences
export BLASTDB=~/Applications/ncbi-blast-2.10.1+/blastdb/dm3


cat zfh1_genome-wide_eTSS.txt | while read l; do
  chr=$(echo $l | awk '{print $1}')
  start=$(echo $l | awk '{print $2}')
  end=$(echo $l | awk '{print $3}')
  strand=$(echo $l | awk '($5=="+"){s="plus"}($5=="-"){s="minus"} END{print s}')

  ~/Applications/ncbi-blast-2.10.1+/bin/blastdbcmd -db dm3 \
  -entry $chr -range ${start}-${end} -strand ${strand}

done




#####
