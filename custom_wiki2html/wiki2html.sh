#!/bin/bash

# Initial Version from https://gist.github.com/enpassant/0496e3db19e32e110edca03647c36541
# Added todo done{1,2,3}

FORCE="$1"
SYNTAX="$2"
EXTENSION="$3"
OUTPUTDIR="$4"
INPUT="$5"
CSSFILE="$6"

FILE=$(basename "$INPUT")
FILENAME=$(basename "$INPUT" .$EXTENSION)
FILEPATH=${INPUT%$FILE}
OUTDIR=${OUTPUTDIR%$FILEPATH*}
OUTPUT="$OUTDIR"/$FILENAME
CSSFILENAME=$(basename "$6")

HAS_MATH=$(grep -o "\$\$.\+\$\$" "$INPUT")
if [ ! -z "$HAS_MATH" ]; then
    MATH="--mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
else
    MATH=""
fi

# >&2 echo "MATH: $MATH"

# cat "$INPUT" | \
    # sed -r 's/^    * \[\[20(.*)\]\]/- \[\[20\1\]\]/g' | \

sed -r '/http/!s/(\[.+\])\(([^)]+)\)/\1(\2.html)/g' <"$INPUT" | \
    sed -r 's/^    \* \[\[20(..)-(.*)\|(.*)\]\]/- [20\1-\2 -- \3](20\1-\2.html)/g' | \
    sed -r 's/\[\[#(.*)\|(.*)\]\]/[\2](#\1)/g' | \
    sed -r '/^# Contents$/,/^$/d' | \
    pandoc --toc $MATH -s -f $SYNTAX -t html -c $CSSFILENAME | \
    sed -r 's/<li>(.*)\[ \]/<li class="todo done0">\1/g' | \
    sed -r 's/<li>(.*)\[.\]/<li class="todo done1">\1/g' | \
    sed -r 's/<li>(.*)\[o\]/<li class="todo done2">\1/g' | \
    sed -r 's/<li>(.*)\[O\]/<li class="todo done3">\1/g' | \
    sed -r 's/<li>(.*)\[X\]/<li class="todo done4">\1/g' >"$OUTPUT.html"

