for file in *.krn
do
	deg -a $file > /tmp/$file.deg
	assemble $file /tmp/$file.deg > $file.deg
	highest_note=$(census -k $file | grep 'Highest' | awk '{print $3}')
	grep ^[0-9].*$highest_note $file.deg | head -1 | grep -v '\!' | awk '{print $2}'
done 

