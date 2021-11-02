#!/bin/bash

rm $HOME/.cache/wal/palette/*

i=0

cat $HOME/.cache/wal/colors | while read in; do
      #echo "Retrieving $in...";
      rgb=$(sh $HOME/scripts/hexrgb.sh ${in:1})

      IFS=' ' read -ra rgb_array <<< "$rgb"

      r=${rgb_array[0]}
      g=${rgb_array[1]}
      b=${rgb_array[2]}

      curl -s "https://hexcolorcodes.org/download-color-image?hex=${in:1}&bac=${r},${g},${b}&clr=255%20,%20255%20,255" > $HOME/.cache/wal/palette/color$(printf %02d $i).png
      ((i=i+1))
done
