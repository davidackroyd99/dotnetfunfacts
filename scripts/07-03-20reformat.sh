FACTS_DIR="../facts/*"

for file in $FACTS_DIR
do
	contents=$(cat $file)
	rm $file
	echo "!meta

title:
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:

!endmeta

"$contents >> $file
done