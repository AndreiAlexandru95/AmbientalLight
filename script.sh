#!/bin/bash

clear

# Get 200 packets that contain the dictionary words
sudo timeout 10 ngrep -xX -q '(0x6c6f7665|0x66616d696c79|0x6368696c64|0x706172656e74|0x66656172|0x6861707079|0x6e657773|0x7472616769|0x736164|0x67616d|0x6a6f79)' -d wlan2 port 80 -O test.dump

# Get the packets for BLUE color - fear
sudo ngrep -xX -q '0x66656172' -I test.dump -O blue.dump
# Get the packets for RED color - love
sudo ngrep -xX -q '0x6c6f7665' -I test.dump -O red.dump
# Get the packets for GREEN color -family|child|parent
sudo ngrep -xX -q '(0x66616d696c79|0x6368696c64|0x706172656e74)' -I test.dump -O green.dump
# Get the packets for PURPLE color - sad
sudo ngrep -xX -q '0x736164' -I test.dump -O purple.dump
# Get the packets for CYAN color - gam = gaming/game
sudo ngrep -xX -q '0x67616d' -I test.dump -O cyan.dump
# Get the packets for YELLOW color - happy|joy
sudo ngrep -xX -q '(0x6861707079|0x6a6f79)' -I test.dump -O yellow.dump
# Get the packets for WHITE color - news
sudo ngrep -xX -q '0x6e657773' -I test.dump -O white.dump
# Get the packets for NO color - tragi
sudo ngrep -xX -q '0x7472616769' -I test.dump -O black.dump