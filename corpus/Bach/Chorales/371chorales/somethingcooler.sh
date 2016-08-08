for file in *.krn
do

	####Be noisy!! Tell the user what the script is doing.
	echo "extracting parts of $file"
	####Extract the bass and soprano parts and create files that do that.
	extract -f 1 $file | deg -a > $file.bass
	extract -f 4 $file | deg -a > $file.soprano
	#####Use sonority to get chord types.
	sonority -t $file > $file.sonority
	#####Put them all together.
	assemble $file.bass $file.sonority $file.soprano > $file.schema
	####clean everything up.
	rm $file.bass 
	rm $file.soprano
	rm $file.sonority
done
