#!/bin/sh
echo "start deploying the weblog."
hugo
rm -rf ./sivertigo.github.io/docs
cp -rf ./docs ./sivertigo.github.io/docs
cp -rf ./content ./sivertigo.github.io/docs/content
cd ./sivertigo.github.io
git add .
git commit -m "add new articles"
git push
