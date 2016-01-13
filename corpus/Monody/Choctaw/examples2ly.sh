# I am going to try to write this script to emulate the music21 feature that outputs 
# found examples to a single file (I will use lilypond). The script will:
# 1. First find a certain melodic element.
# 2. Send all of these to a single file with a prepended Humdrum notation.
	# a. Comments or stars by found items?
# 3. Convert to XML then to Lilypond.
# 4. Expand this to find harmonic elements (chordified?)
# 	a. Contextual things.
# 5. Colored for found instances (this will take altering the lilypond script).

####find a certain melodic element
for i in *.krn
do	
###echo file name
echo $i 
 
extract -f 1 $i | context -n 4 | grep -v = |  grep 'B-' 
done
####create a file with a humdrum opening (** columns, etc.)

##send all instances to this file. 


###convert to music xml

###convert to lilypond

###add comments/colors in the lilypond script

###output as PDF.