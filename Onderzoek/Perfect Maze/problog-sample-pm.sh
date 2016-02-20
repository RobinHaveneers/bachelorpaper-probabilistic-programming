#!/bin/bash
# My first script
if [ -f data.txt ]
then
    rm data.txt
fi

read -e -p "Specify program, use tab for completion: " file
echo "Running ProbLog command"
date +"%T"
problog sample -N 1 $file --output data.txt
date +"%T"
echo "Parsing data with python"
python print.py
