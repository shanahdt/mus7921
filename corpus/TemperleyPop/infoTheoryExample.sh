ls *.txt >> /tmp/list

for file in *.txt
do 
	tr ' ' '\n' < $file >> /tmp/$file
	grep -v -h '=' /tmp/$file | rid -GLId | infot -s | grep -i $1 

done | awk '{print $NF}' >> /tmp/numbers

assemble /tmp/list /tmp/numbers > /tmp/numbers1
sort -k2n /tmp/numbers1 > data.txt 
cat /tmp/numbers | stats | grep -i 'mean' > average.txt
rm /tmp/list /tmp/numbers /tmp/numbers1 /tmp/*.txt
open data.txt
open average.txt
