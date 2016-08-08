for file in *.krn
do
country=$(grep 'ARE' $file | awk '{print $4}' | sed 's/,//g')
melodic_entropy=$(deg $file | infot -s | grep 'Average' | awk '{print $6}')
printf "$country,$melodic_entropy\n"
done
