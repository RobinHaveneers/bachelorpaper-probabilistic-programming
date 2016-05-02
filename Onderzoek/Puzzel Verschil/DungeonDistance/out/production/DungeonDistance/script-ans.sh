#!/bin/bash
rm -f data*
clingo --models 20 --rand-freq=1 dun-ans.pl >> dataALL.txt
cat dataALL.txt | tr " " "\n" >> dataALLsep.txt
csplit -n 2 -f 'data' -k dataALLsep.txt '/^Answer*/' '{50000}' > /dev/null
rm dataALL.txt
rm dataALLsep.txt

rm -f result.csv
for i in `seq 1 20`;
do
  for j in `seq $i 20`;
  do
    if ((i != j));then
      if ((i < 10)) && ((j<10)); then
        java Main data0$i data0$j >> result.csv
      fi
      if ((i < 10)) && ((j>=10)); then
        java Main data0$i data$j >> result.csv
      fi
      if ((i >= 10)) && ((j<10)); then
        java Main data$i data0$j >> result.csv
      fi
      if ((i >= 10)) && ((j>=10)); then
        java Main data$i data$j >> result.csv
      fi
    fi
  done
done
rm data*
