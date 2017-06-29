#!/bin/bash

school=$1
photoId=$2
photoType=$3

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
    tmpdir="../tmp/"
    tmpfile=$tmpdir"page."$photoId".html"
    url="http://yourSchoolName.topschool.com.tw/FlashBrowser.asp?SCHOOL_ID=$school&PHOTO_ID=$photoId&PHOTO_TYPE=$photoType&ToPage=1"
    getHtmlAndIconvToUtf8 $url $tmpfile
    totalPage=$(grep "頁" $tmpfile | grep option | wc -l)
    echo $1 $2 $3 $totalPage >> "../tmp/index_pages.dat"
}

getPhotoIndex $school $photoId $photoType

