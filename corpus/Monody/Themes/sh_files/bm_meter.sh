###Start my loop. This loops over all folders and every theme file in those folders.
for i in */*.thm
do
	####search for the line that has the title.
	title=$(grep '!!!OTL' $i | sed 's/\!\!\!//g' | awk 'BEGIN{FS=":"}{print $2}' | sed 's/^ //g' | sed 's/,/_/g')
	title1=$(grep '!!!title1' $i | sed 's/\!\!\!//g' | awk 'BEGIN{FS=":"}{print $2}' | sed 's/^ //g' | sed 's/,/_/g')
	title2=$(grep '!!!title2' $i | sed 's/\!\!\!//g' | awk 'BEGIN{FS=":"}{print $2}' | sed 's/^ //g' | sed 's/,/_/g')
	movement=$(grep '!!!OMV' $i | sed 's/\!\!\!//g' | awk 'BEGIN{FS=":"}{print $2}' | sed 's/^ //g' | sed 's/,/_/g')
	comp=$(grep '!!!COM' $i | sed 's/\!\!\!//g' | awk 'BEGIN{FS=":"}{print $2}' | sed 's/^ //g' | sed 's/,/_/g')
	meter=$(grep '^\*M' $i | grep -v 'MM')
	printf "$title,$title1,$title2,$movement,$comp,$meter\n" 
done