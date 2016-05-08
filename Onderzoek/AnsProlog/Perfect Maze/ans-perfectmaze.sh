#!/bin/bash
if [ -f data.txt ]
then
    rm data.txt
fi

read -e -p "Specify program, use tab for completion: " file
echo "Running AnsProlog command"
clingo $file --rand-freq=1 >> data.txt
file="`cat data.txt`"

for word in $file
do
  echo $word >> data2.txt
done

sed '/parent/!d' data2.txt >> data3.txt

rm data.txt
rm data2.txt
mv data3.txt data.txt
echo "Parsing data with python"
python visualize.py
