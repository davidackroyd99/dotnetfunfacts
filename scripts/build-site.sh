#!/bin/sh

rm -r www_stage/generated/*
mkdir www_stage/generated/data
python scripts/generate_json.py