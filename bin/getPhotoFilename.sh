#!/bin/bash

school=$1
photoId=$2
photoType=$3
pages=$4

function getHtmlAndIconvToUtf8() 
{
    url=$1
    filename=$2
    curl -s "$1" | iconv -c -f big5 -t utf8 > $2
}

function getPhotoIndex()
{
    school=$1
    photoId=$2
    photoType=$3
    page=$4
    tmpdir="../tmp/"
    tmpfile=$tmpdir"pages."$photoId"."$page".html"
    url="http://yourSchoolName.topschool.com.tw/FlashBrowser.asp?SCHOOL_ID=$school&PHOTO_ID=$photoId&PHOTO_TYPE=$photoType&ToPage=$page"
    getHtmlAndIconvToUtf8 $url $tmpfile
    grep "_xl.jpg" $tmpfile | cut -d"/" -f2,3,4,5 | grep "_self" | cut -d"'" -f1 | sort | uniq | awk '{print "http://yourSchoolName.topschool.com.tw/"$1}' | xargs -n 1 wget -P ../tmp/$photoId/ 
}

#mkdir "../tmp/"$photoId
for ((i=1; i<=$pages; i++))
do
    getPhotoIndex $school $photoId $photoType $i
done

