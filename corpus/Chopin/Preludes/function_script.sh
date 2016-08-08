#!/bin/bash
# - reusable
# - flexible
# - play nicely with others (stdin)
# - be noisy if there are problems   (stderr)

# key signature by area
# npvi by area
# opening interval by area

#########This loops over each folder (which is the argument), and searches for area
#


title(){
grep 'OTL' $1
}


npvi(){
nPVI $1

}

meter(){
	grep '\*M' $1 | grep -v MM | awk '{print $1}'
}
# title $1
# nPVI $1


while getopts ntm\? name
do
	for file in $2
		do
			case $name in
				n) npvi $2;;
				t) title $2;;
				m) meter $2;;	  
				\?)   echo "you did me wrong, brosef."
			esac
		done
done