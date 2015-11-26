#!/bin/bash
# My first script

echo "Running following command" $1
$1 --output data.txt
echo "Parsing data with javascript"
node parse_data_to_json.js
echo "Opening ..."
open visualize.html
