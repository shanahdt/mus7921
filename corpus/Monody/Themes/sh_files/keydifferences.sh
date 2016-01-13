#########I WANT MY DATA TO LOOK LIKE:
#composer,nationality,key signature,year of composition,information,rhythmic variability

#### This makes it cool with the special characters in names
unset LANG
###if a file exists already, get rid of it (normally this isn't necessary, but >> adds, not overwrites)
rm -f bmdata.csv
rm -f /tmp/bmdata
rm -f /tmp/bmdata1

###My loop
for derpy in */*.thm
do
	###grab composer last name and clean it up a bit
	composer=$(grep -h 'COM' $derpy | awk '{print $2}' | sed 's/\,//g')
	#### grab the nationality
	nationality=$(grep -h 'CNT' $derpy | awk '{print $2}')
	###grab the key and clean it up a bit
	key=$(grep -h '^\*k' $derpy | sed 's/[\[\]]//g' | sed 's/\*k//g')
	##### I've been lazy and gone with the hacky hard-coded year cleaner here. More sleep might allow for a proper solution...
	year=$(grep -h 'ODT' $derpy | awk '{print $2}' | sed 's/\<//g' | 
	sed 's/\/.*//g' | sed 's/c//g' | sed 's/\-.*$//g' | 
	sed 's/\?//g' | sed 's/\n\.d\.//g' | sed 's/\,.*//g' | 
	sed 's/\>//g' | sed 's/(spurious)//g' | sed 's/(arr\.//g')
	###rhythmic variability
	npvi=$(nPVI $derpy)
	###grab the total amount of info in the first staff (I used the unix cut instead of extract, as it seemed less error-prone).
	info=$(cut -f 1 $derpy | infot -s | grep 'Total in' | awk '{print $7}')
	####grab the meter line, but then get rid of the M and the *
	meter=$(grep -h '\*M[0-9]' $derpy | sed 's/\*M//g')
	
	printf "$composer,$nationality,$key,$year,$info,$npvi,$meter\n"

### print off to a temporary file that I can then just clean up a bit. might help with speed a bit.
done > /tmp/bmdata

###Clean things up a bit and write it to the same file with the ">>"
grep -v 'COM' /tmp/bmdata | sed 's/\[//g' | sed 's/\]//g' | 
grep -v '\,\,' | sed 's/\/.*,//g' | grep -v '^[0-9]' | sed 's/;//g' >> /tmp/bmdata1


######Create a top line for column names
echo "composer,nationality,key,year,info,npvi,meter" > bmdata.csv
#### only print the lines if all columns have data, and get rid of years that are "N"
awk '{FS=","}{if (NF == 7 && $4 !~ /[nN]/) {print $0}}' | grep '1.*,' /tmp/bmdata1 >> bmdata.csv 


### | perl -lne '/1.../ && print ')









###Keys in French Themes
# grep -h "^\*k" $(grep -l 'CNT: French$' */*.thm) | grep '-'
#
# ###Keys in German Themes
# grep "^\*k" $(grep -l 'CNT: German$' */*.thm) | grep '-'