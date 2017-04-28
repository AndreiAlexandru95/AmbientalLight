#!/bin/bash

clear

# Get 200 packets that contain the dictionary words
sudo ngrep -i -c 200 -q -w '(love|family|child|parent|fear|happy|news|tragic|sad|gam|joy)' -d wlan2 port 80 -O test.dump

# Get the packets for BLUE color - fear
sudo ngrep -i -q -w 'fear' -I test.dump -O blue.dump
# Get the packets for RED color - love
sudo ngrep -i -q -w 'love' -I test.dump -O red.dump
# Get the packets for GREEN color -family|child|parent
sudo ngrep -i -q -w '(family|child|parent)' -I test.dump -O green.dump
# Get the packets for PURPLE color - sad
sudo ngrep -i -q -w 'sad' -I test.dump -O purple.dump
# Get the packets for CYAN color - gam = gaming/game
sudo ngrep -i -q -w 'gam' -I test.dump -O cyan.dump
# Get the packets for YELLOW color - happy|joy
sudo ngrep -i -q -w '(happy|joy)' -I test.dump -O yellow.dump
# Get the packets for WHITE color - news
sudo ngrep -i -q -w 'news' -I test.dump -O white.dump
# Get the packets for NO color - tragic
sudo ngrep -i -q -w 'tragic' -I test.dump -O black.dump