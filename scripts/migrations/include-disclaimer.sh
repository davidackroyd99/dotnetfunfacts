FACTS_DIR="facts/*"

for file in $FACTS_DIR
do
	contents=$(cat $file)
	rm $file
	echo "This fact was actually created before the date listed, but the metadata system was not created until 08/03/2020.

${contents}" >> $file
done