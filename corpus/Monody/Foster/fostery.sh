printf "Harmonic Entropy,nPVIn, Meter, Rhythmic Entropy\n"
for work in *.krn
do
	harmonentropy=$(deg -a $work | infot -s $work | grep 'Average' | awk '{print $6}')
	nPVI=$(nPVI $work) 
#	rootposition=$(sonority -i $work | grep -v '[=X]' | rid -GLId | sortcount -p | grep '0$')
	meter=$(grep 'M./.' $work | grep -v 'MM' | sed 's/\*//g')
#	rhythmentropy=$(grep '^[0-32]' $work | infot -s | grep 'Average' | awk '{print $6}')
	printf "$harmonentropy,$nPVI,$rootposition,$meter,$rhythmentropy\n"
done
