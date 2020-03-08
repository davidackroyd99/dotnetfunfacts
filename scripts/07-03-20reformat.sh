FACTS_DIR="../facts/*"

for file in $FACTS_DIR
do
	fact_name=$(head -1 $file | cut -c4-)
	contents=$(cat $file)
	rm $file
	echo "!meta

title:${fact_name}
contributors:David Ackroyd
created:2020-03-08
modified:2020-03-08
tags:

!endmeta


${contents}" >> $file
done