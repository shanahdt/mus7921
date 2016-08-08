###Finding Russian pieces
for i in $(grep -L 'SSR' *.krn )
do
	deg -a $i | grep -v '[r=]' | rid -GLId
done
