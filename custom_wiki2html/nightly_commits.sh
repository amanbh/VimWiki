#!/bin/bash

TIMESTAMP=$( date +%Y%m%dT%H%M%S )
echo ${TIMESTAMP}

git add markdown/*.md
git add markdown/*/*.md
git add generated_html/*.html
git add generated_html/*/*.html
git commit -m "[Nightly Commit] ${TIMESTAMP}"
git push keybase
