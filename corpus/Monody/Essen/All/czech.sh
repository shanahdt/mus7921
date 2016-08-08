for i in $(grep -L 'Tschech' *.krn)
do
	deg -a $i | grep -v '[r=]' | rid -GLId
done