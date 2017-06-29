#!/bin/bash

school=$1
classroom=$2
pages=$3

function getHtmlAndIconvToUtf8() 
{
    url=$1
    filename=$2
    curl -s "$1" | iconv -c -f big5 -t utf8 >> $2
}

function getClassroomIndex()
{
    school=$1
    classroom=$2
    page=$3
    tmpdir="../tmp/"
    tmpfile=$tmpdir"index.html"
    url="http://yourSchoolName.topschool.com.tw/parten/G08/page4_3.asp?ToPage=$page&SC=$school&PHOTO_TYPE2=$classroom"
    getHtmlAndIconvToUtf8 $url $tmpfile
}

for ((i=1; i<=$pages; i++))
do
    getClassroomIndex $school $classroom $i
done

cat "../tmp/index.html" | grep OpenFlashBrowers ../tmp/index.html | grep -v function | cut -d"'" -f2,4,6 | tr "'" " " | sort | uniq >> "../tmp/index.dat"

