#!/bin/bash

echo What year would you like to collect data for?

read year

echo $year

mkdir "$year"Data
grep "\b"$year"\b" GapMinderDataAll.txt > "$year"Data/"$year"-data.txt ## extracts data for the given year
sed -i 's/ /-/g' "$year"Data/"$year"-data.txt ## replaces empty spaces with dashes
sort -k6 -b -n "$year"Data/"$year"-data.txt > "$year"Data/"$year"-sortedbyGDP.txt ## sorts by column 6 = 'gdpPerCap'
head -10 "$year"Data/"$year"-sortedbyGDP.txt > "$year"Data/10-poorest-countries-"$year"_pre.txt ## get first 10 lines
tail -10 "$year"Data/"$year"-sortedbyGDP.txt | sort -k6bnr > "$year"Data/10-richest-countries-"$year"_pre.txt ## get last 10 lines (reverse order)
head -1 GapMinderDataAll.txt > Headers.txt
cat Headers.txt "$year"Data/10-poorest-countries-"$year"_pre.txt > "$year"Data/10-poorest-countries-"$year".txt  ## add column headers
cat Headers.txt "$year"Data/10-richest-countries-"$year"_pre.txt > "$year"Data/10-richest-countries-"$year".txt
rm Headers.txt 
rm "$year"Data/10-poorest-countries-"$year"_pre.txt
rm "$year"Data/10-richest-countries-"$year"_pre.txt
rm "$year"Data/"$year"-sortedbyGDP.txt
