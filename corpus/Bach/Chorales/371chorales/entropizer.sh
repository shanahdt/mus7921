rm -f bass_info
#####Step 1: Extract bass and soprano
for voice in *.krn
do
echo "working on $voice"
extract -f 1 $voice > $voice.bass
extract -f 4 $voice > $voice.soprano
deg -a $voice.bass | infot -s | grep -i 'redund' | awk '{print $6}' >> bass_info
deg -a $voice.soprano | infot -s | grep -i 'redund' | awk '{print $6}' >> soprano_info
done


#####Step 2: Find entropy of both individually