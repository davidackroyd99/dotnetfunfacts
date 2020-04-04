dateStr=$(date +"%Y-%m-%d")

echo "!meta

title:
url:$1
contributors:$2
created:$dateStr
modified:$dateStr
tags:

!endmeta" >> "facts/$1.md"
