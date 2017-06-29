#!/bin/bash

school="{change to your school id}"
classroom="{change to your classroom id}"
pages="{change to your photo pages of index"

rm -r ../tmp
mkdir ../tmp
bash getIndex.sh $school $classroom $pages
cat ../tmp/index.dat | xargs -n 3 bash getPhotoPages.sh
cat ../tmp/index_pages.dat | xargs -n 4 bash getPhotoFilename.sh
cat ../tmp/index.dat | xargs -n 3 bash renameFolder.sh

