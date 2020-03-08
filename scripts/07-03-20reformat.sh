FACTS_DIR="../facts/*"

for file in $FACTS_DIR
do
	contents=$(cat $file)
	rm $file
	echo "!meta

author:David Ackroyd

!endmeta

"$contents >> $file
done