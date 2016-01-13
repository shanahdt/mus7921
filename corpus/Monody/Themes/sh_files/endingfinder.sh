for file in *.solfa
do 
	extract -f 1 $file | grep -v '=' | 
	grep -v 'r' | grep -v 'M' | grep -B 3 '\*-' | 
	context -e '-' | grep -v '\.' | grep -v '-'| 
	sed 's/[JL]//g' | sed 's/[\/\\]//g' | 
	sed 's/\[//g' | sed 's/\]//g' | 
	sed 's/[0-9]//g'
done