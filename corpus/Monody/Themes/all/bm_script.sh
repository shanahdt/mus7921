for file in *.thm
do
	deg -a $file | rid -GLId | 
	context -e '='
done

#####My conditional
awk '{if ($1 ~ /Stella/) 
	{print $0, ".....awwwww"} 
	else print "yuk"}'