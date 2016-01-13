#ls */*.thm >> /tmp/list
grep
for file in */*.thm
do 
	grep -v '=' $file | rid -GLId | extract -f 1 | infot -s | grep -i $1 

done | awk '{print $NF}' >> /tmp/numbers

assemble /tmp/list /tmp/numbers > /tmp/numbers1
sort -k2n /tmp/numbers1 > data.txt 
cat /tmp/numbers | stats | grep -i 'mean' > average.txt
rm /tmp/list /tmp/numbers /tmp/numbers1
open data.txt
open average.txt
