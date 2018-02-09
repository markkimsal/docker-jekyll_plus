#!/bin/bash
ID=$(docker build -t "markkimsal/jekyll-plus:0.3.0" .)
docker tag $ID markkimsal/jekyll-plus:latest
