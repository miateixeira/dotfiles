#!/bin/bash

{
  [ ! -f $HOME/.config/mpd/mpd.pid ] && mpd && ncmpcpp
} ||
{
  ncmpcpp
}
