###Finds most common pitch classes

function getKeyProfile () { 
	yank -o ^= -r '$-1-$' $1 | deg | rid -GLId | grep -v '=' | grep -v 'r' | sed 's/[v^]//g'
}

for i in */*.krn
do
	getKeyProfile $i 

done > /tmp/tonesUsed

sort /tmp/tonesUsed | uniq -c | sort -n

