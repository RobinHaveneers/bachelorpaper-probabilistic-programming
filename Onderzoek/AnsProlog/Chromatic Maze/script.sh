#!/bin/bash
if [ -f Scripts/data.txt ]
then
    rm Scripts/data.txt
fi
if [ -f Scripts/parsed_data.js ]
then
    rm Scripts/parsed_data.js
fi

read -e -p "Specify program, use tab for completion: " file
echo "Running AnsProlog command"
clingo $file >> Scripts/data.txt

file="`cat Scripts/data.txt`"
for word in $file
do
  echo $word >> Scripts/data2.txt
done

sed '/tile_/!d' Scripts/data2.txt >> Scripts/data3.txt

rm Scripts/data.txt
rm Scripts/data2.txt
mv Scripts/data3.txt Scripts/data.txt

echo "Sorting data"
sort Scripts/data.txt -o Scripts/data.txt
echo "Parsing data with javascript"
node Scripts/parse_data_to_json.js
echo "Opening ..."
open -a "Safari" Scripts/visualize.html
