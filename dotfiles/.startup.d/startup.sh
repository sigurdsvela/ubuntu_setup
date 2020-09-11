echo "startup.." >> ./startup.log

for f in ./*.startup.sh; do
	echo $f >> ./startup.log
	$f >> $f.log
done

