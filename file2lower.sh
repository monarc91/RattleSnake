#!/bin/bash

if [ ! -f "$file" ]; then
	echo "Filename $file does not exists"
	exit 1
fi
# remove doubles
cat "$1" |sort -u > temp.txt

tr '[:upper:]' '[:lower:]' < "temp.txt" >> "$2"

rm temp.txt
exit 0

