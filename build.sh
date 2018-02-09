#!/bin/bash
ID=$(docker build -t "markkimsal/jekyll_plus:0.3.0" .)
docker tag $ID markkimsal/jekyll_plus:latest
