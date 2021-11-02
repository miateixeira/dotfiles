#!/bin/bash

# This script checks for all articles that I have
# For each PDF it finds, it checks for a corresponding markdown file in vimwiki
# If a markdown file is found, it uses pandoc to compile MD > PDF
# NOTE: The basename for the .pdf and .md files MUST be the same

#PDF_DIR=$HOME/articles/pdf/*.pdf
#MD_DIR=$HOME/vimwiki/phd/articles/
#OUTPUT_DIR=$HOME/articles/notes
#
#for f in $PDF_DIR
#do
#  MD_FILENAME="$MD_DIR$(basename $f .pdf).md"
#  if [ -f "$MD_FILENAME" ]
#  then
#    pandoc -o "$OUTPUT_DIR/$(basename $f .pdf)_notes.pdf" "$MD_FILENAME"
#    echo "$MD_FILENAME"
#  fi
#done

MD_FILE=$1
OUTPUT_DIR=$HOME/vimwiki/output

OUTPUT_FILE="$OUTPUT_DIR/$(basename $MD_FILE .md).pdf"

pandoc $MD_FILE -o "$OUTPUT_FILE"
