#!/bin/sh

OUT_FILE="../www/index.html"
HEADER_TEMPLATE="../templates/header.html"
FACT_START_TEMPLATE="../templates/fact-start.html"
FACT_END_TEMPLATE="../templates/fact-end.html"
FOOTER_TEMPLATE="../templates/footer.html"
FACTS_DIR="../facts/*"


rm $OUT_FILE 
cat $HEADER_TEMPLATE >> $OUT_FILE

for file in $FACTS_DIR
do 
	cat $FACT_START_TEMPLATE >> $OUT_FILE
	markdown $file >> $OUT_FILE
	cat $FACT_END_TEMPLATE >> $OUT_FILE
done

cat $FOOTER_TEMPLATE >> $OUT_FILE