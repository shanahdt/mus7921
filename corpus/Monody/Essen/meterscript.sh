##Get meters of every song.
#for i in */*.krn
#do
#	meter=$(grep \*M $i)
#	filename=$(echo $i)
#	printf "$filename,$meter\n"
#done

####get meters per group.

for i in $1/*.krn
do
	grep -h \*M $i | awk '{print $1}'  >> /tmp/$1.file
done

	sort /tmp/$1.file | uniq -c | sort -n > $1_meters.txt


	rm -f /tmp/$1.file
