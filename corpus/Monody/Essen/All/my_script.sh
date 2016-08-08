for file in *.krn
do
	country=$(grep 'ARE' $file | awk '{print $4}')
	npvi=$(nPVI $file)
	printf "$country,$npvi\n"
done
