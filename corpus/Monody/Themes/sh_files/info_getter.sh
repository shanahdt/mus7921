files=$(grep 'PDT' */*.thm | awk 'BEGIN{FS=":"}{print $1}')
for i in $files
do
	information=$(mint $i | rid -GLId | grep -v '=' | infot -s | grep 'Total info' | awk '{print $7}' | sed 's/ //g')
	years=$(grep -h 'PDT' $i | awk 'BEGIN{FS=":"}{print $2}' | sed 's/ //g' | sed 's/\/.*$//g')
	#echo "Melodic Variability,Rhythmic Variability"
	printf "$information,$years\n"
done
