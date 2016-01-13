for i in */*.thm
do
	highest=$(census -k $i | grep 'Highest' | awk '{print $3}')
	title=$(grep 'OTL' $i | sed 's/\!\!\!//g' | grep -v 'COM' | sed 's/OTL//g')
	comp=$(grep 'COM' $i | sed 's/\!\!\!//g' | grep -v 'OTL' | sed 's/COM//g')
	printf "The highest pitch in $title by $comp is $highest.\n"
done