#!/bin/bash

cd /home/mia/wallpapers/torice

IMG=$(ls | sort -R | tail -1)

wal --backend wal -i /home/mia/wallpapers/torice/$IMG

sh $HOME/scripts/wal_palette.sh
