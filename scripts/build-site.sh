#!/bin/sh

rm -r www/generated
mkdir www/generated
mkdir www/generated/data
python scripts/generate_json.py