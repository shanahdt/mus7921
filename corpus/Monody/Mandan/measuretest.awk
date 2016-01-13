{
if ($0 ~/^=/)
{
	bar_number = $1
	gsub("=","",bar_number)
}
if ($0 ~ /c/)
{
	print "Pattern found in bar " bar_number " of " FILENAME "."
}
}

