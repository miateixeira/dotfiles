#!/bin/bash

show_color() {
  perl -e 'foreach $a(@ARGV){print "\e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m \e[49m "};print "\n"' "$@"
}

#show_colour() {
#l
#reach $a(@ARGV){print "\e[48;2;".join(";",unpack("C*",pack("H*",$a)))."m \e[49m "};print "\n"' "$@"
#}
