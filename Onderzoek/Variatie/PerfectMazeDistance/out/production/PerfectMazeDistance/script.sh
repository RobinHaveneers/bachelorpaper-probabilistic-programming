#!/bin/bash
rm -f data*
for i in `seq 1 20`;
do
  problog sample -N 1 --output data$i.txt pm.pl
done

rm result.csv
for i in `seq 1 20`;
do
  for j in `seq $i 20`;
  do
    if ((i != j))
    then
      java -cp ../../../lib/jgrapht-core-0.9.2.jar:. Main data$i.txt data$j.txt >> result.csv
    fi
  done
done
rm data*
