####Loop
#####Here's my header
printf "Work"",""Percentage_64\n"
for work in *.krn
do

#####Define a variable that finds the worknumber
#####In kern notation, this is listed as ONM. 
#####Then 
	piece=$(grep 'ONM' $work | awk '{print $3}')

###awk prints the columns, grep looks for a second, followed by an end of line	
	inversion=$(sonority -i $work | 
		grep -v '[=X\*]' | rid -GLId | 
		sortcount -p | grep '2$' | awk '{print $1}')

	######This is for those who have trouble with sonority.
	# secondinv=$(hint $work | grep -v '[=X\*]' | 
	# 	rid -GLId | sortcount -p | grep '	P4')
	

	####Alternative to printf
	# echo $piece
	# echo $inversions

####Print my variables fancily, with a tab 
####separating them and a newline afterward.
	
	printf "$piece\t$inversion\n" | 
##### This last line prints a 0 when there's nothing.
##### IT literatlly means: If the second column is blank,
##### print the entire line ($0), followed by a 0. Otherwise
##### Just print the whole line.
	awk '{if ($2 == "") {print $0,"0"} else print $0}'

#####And now I end my loop.
done
