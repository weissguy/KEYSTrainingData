grep "\b1957\b" GapMinderDataAll.txt > 1957_data.txt  ## extracts 1957 data
sed -i 's/ /-/g' 1957_data.txt  ## replaces empty spaces with dashes ‘-’
sort -k6 -b -n 1957_data.txt > 1957_sortedbyGDP.txt  ## sorts by column 6 = ‘gdpPercap’
head -10 1957_sortedbyGDP.txt > 10_poorest_countries_1957.txt  ## get 10 first
tail -10 1957_sortedbyGDP.txt | sort -k6bnr > 10_richest_countries_1957.txt  ## get 10 last in reverse order

