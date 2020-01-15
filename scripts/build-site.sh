#!/bin/sh

rm "../www/index.html"
cat "../templates/header.html" >> "../www/index.html"

for file in ../facts/*
do 
	cat "../templates/fact-start.html" >> "../www/index.html"
	markdown $file >> "../www/index.html"
	cat "../templates/fact-end.html" >> "../www/index.html"
done

cat "../templates/footer.html" >> "../www/index.html"