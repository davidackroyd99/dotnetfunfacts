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

yes | cp -rf $RESOURCES_DIR $OUT_DIR

for file in $(ls -r -v $FACTS_DIR)
do 
	fact_name=$(head -1 $file | cut -c4-)
	fact_file=$(echo $fact_name | tr " " _ | tr . _)
	fact_file="${fact_file}.html"
	
	cat $FACT_START_TEMPLATE >> $OUT_FILE
	echo "<a href='${fact_file}'>${fact_name}</a>" >> $OUT_FILE
	cat $FACT_END_TEMPLATE >> $OUT_FILE

	fact_file_path="${OUT_DIR}/${fact_file}"
	cat $HEADER_TEMPLATE >> $fact_file_path
	markdown $file >> $fact_file_path
	cat $FOOTER_TEMPLATE >> $fact_file_path

done

cat $FOOTER_TEMPLATE >> $OUT_FILE