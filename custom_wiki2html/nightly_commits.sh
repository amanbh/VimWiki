#!/bin/bash

TIMESTAMP=$( date +%Y%m%dT%H%M%S )
echo ${TIMESTAMP}

git add vimwiki_md/*.md
git add vimwiki_md/*/*.md
git add html/vimwiki_md/*.html
git add html/vimwiki_md/*/*.html
git commit -m "[Nightly Commit] ${TIMESTAMP}"
git push keybase
