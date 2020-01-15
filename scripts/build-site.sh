#!/bin/sh

OUT_FILE="../www/index.html"

HEADER_TEMPLATE="../templates/header.html"
FACT_START_TEMPLATE="../templates/fact-start.html"
FACT_END_TEMPLATE="../templates/fact-end.html"
FOOTER_TEMPLATE="../templates/footer.html"

FACTS_DIR="../facts/*"
RESOURCES_DIR="../resources/*"
OUT_DIR="../www"

rm -r $OUT_DIR
mkdir $OUT_DIR

cat $HEADER_TEMPLATE >> $OUT_FILE

echo "factsArray = [" >> "${OUT_DIR}/data.js"

yes | cp -rf $RESOURCES_DIR $OUT_DIR

for file in $(ls -r -v $FACTS_DIR) # go in reverse order, newest fact first
do 
	fact_name=$(head -1 $file | cut -c4-) # get the markdown title, get rid of the leading hashes and space
	fact_file=$(echo $fact_name | tr " " _ | tr . _) # replace spaces and dots with underscores
	fact_file="${fact_file}.html" # add .html
	
	echo "\"${fact_file}\"," >>  "${OUT_DIR}/data.js" # write this to the js file that contains all the data for 
														# the random fact functionality and so on
	cat $FACT_START_TEMPLATE >> $OUT_FILE
	echo "<a href='${fact_file}'>${fact_name}</a>" >> $OUT_FILE # write the title of each fact out to the index.html page
	cat $FACT_END_TEMPLATE >> $OUT_FILE

	fact_file_path="${OUT_DIR}/${fact_file}" # finally actually make the fact page
	cat $HEADER_TEMPLATE >> $fact_file_path
	markdown $file >> $fact_file_path
	cat $FOOTER_TEMPLATE >> $fact_file_path

done

echo "]" >> "${OUT_DIR}/data.js"


cat $FOOTER_TEMPLATE >> $OUT_FILE