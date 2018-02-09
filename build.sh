#!/bin/bash
ID=$(docker build -qt "markkimsal/jekyll-plus:0.3.0" .)
ret=$?
if [ $ret -eq 0 ];then
	docker tag $ID markkimsal/jekyll-plus:latest
fi
