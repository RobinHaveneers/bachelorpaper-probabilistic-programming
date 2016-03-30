#!/bin/bash
# My first script
if [ -f Scripts/data.txt ]
then
    rm Scripts/data.txt
fi
if [ -f Scripts/parsed_data.js ]
then
    rm Scripts/parsed_data.js
fi

read -e -p "Specify program, use tab for completion: " file
echo "Running ProbLog command"
problog sample $file --output Scripts/data.txt
echo "Sorting data"
sort Scripts/data.txt -o Scripts/data.txt
echo "Parsing data with javascript"
node Scripts/parse_data_to_json.js
echo "Opening ..."
open -a "Safari" Scripts/visualize.html
