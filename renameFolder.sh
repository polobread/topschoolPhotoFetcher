#!/bin/bash

school=$1
photoId=$2

folderName=$(grep -B1 $2 ../tmp/index.html | grep span | cut -c69- | sed 's| ||g' | sed 's|</b>|-|g' | sed 's|<[^>]*>| |g' | cut -d" " -f1)
echo $2 $folderName
mv ../tmp/$2 ../tmp/$2"_"$folderName

