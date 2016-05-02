#!/bin/bash
rm -f data*
for i in `seq 1 20`;
do
  problog sample -N 1 --output data$i.txt dun.pl
done

rm -f result.csv
for i in `seq 1 20`;
do
  for j in `seq $i 20`;
  do
    if ((i != j))
    then
      java Main data$i.txt data$j.txt >> prob-dun-7.csv
    fi
  done
done
rm data*
