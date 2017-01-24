#!/bin/bash
shopt -s expand_aliases
source ~/.bashrc

git add vimwiki_md/*.md
git add vimwiki_md/*/*.md
git add html/vimwiki_md/*.html
git add html/vimwiki_md/*/*.html
git commit -m "[Nightly Commit] `timestamp`"
git push github
