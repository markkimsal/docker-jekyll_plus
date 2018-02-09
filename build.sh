#!/bin/bash
TAG=$1
ID=$(docker build -qt "markkimsal/jekyll-plus:latest" .)
ret=$?
if [ "$TAG" != "" ];then
	if [ $ret -eq 0 ];then
		docker tag $ID markkimsal/jekyll-plus:$1
	fi
fi
