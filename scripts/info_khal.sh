#!/bin/bash

#upcoming=$(khal list now | head -n +2 | tail -n -1 | grep -o "^.*::" | sed 's/::$//')
upcoming=$(khal list now | head -n +2 | tail -n -1)

echo "Upcoming: $upcoming"
