#!/bin/bash
# script.sh

clear

blueInt=0
redInt=0
greenInt=0
purpleInt=0
cyanInt=0
yellowInt=0
whiteInt=0
blackInt=0
temp=0

# Get 200 packets that contain the dictionary words
sudo timeout 10 ngrep -X -q -d wlan2 port 80 -O test.dump


# Get the packets for BLUE color - fear
sudo ngrep -xX -q '0x66656172' -I test.dump -O blue.dump

blueInt=`du -k "blue.dump" | cut -f1`


# Get the packets for RED color - love
sudo ngrep -xX -q '0x6c6f7665' -I test.dump -O red.dump

redInt=`du -k "red.dump" | cut -f1`


# Get the packets for GREEN color -family|child|parent
sudo ngrep -xX -q '0x66616d696c79' -I test.dump -O green.dump

temp=`du -k "green.dump" | cut -f1`
greenInt=$((greenInt + temp))

sudo ngrep -xX -q '0x6368696c64' -I test.dump -O green.dump

temp=`du -k "green.dump" | cut -f1`
greenInt=$((greenInt + temp))

sudo ngrep -xX -q '0x706172656e74' -I test.dump -O green.dump

temp=`du -k "green.dump" | cut -f1`
greenInt=$((greenInt + temp))


# Get the packets for PURPLE color - sad
sudo ngrep -xX -q '0x736164' -I test.dump -O purple.dump

purpleInt=`du -k "purple.dump" | cut -f1`


# Get the packets for CYAN color - gam = gaming/game
sudo ngrep -xX -q '0x67616d' -I test.dump -O cyan.dump

cyanInt=`du -k "cyan.dump" | cut -f1`


# Get the packets for YELLOW color - happy|joy
sudo ngrep -xX -q '0x6861707079' -I test.dump -O yellow.dump

temp=`du -k "yellow.dump" | cut -f1`
yellowInt=$((greenInt + temp))

sudo ngrep -xX -q '0x6a6f79' -I test.dump -O yellow.dump

temp=`du -k "yellow.dump" | cut -f1`
yellowInt=$((greenInt + temp))


# Get the packets for WHITE color - news
sudo ngrep -xX -q '0x6e657773' -I test.dump -O white.dump

whiteInt=`du -k "white.dump" | cut -f1`


# Get the packets for NO color - tragi
sudo ngrep -xX -q '0x7472616769' -I test.dump -O black.dump

blackInt=`du -k "black.dump" | cut -f1`

echo "blueInt = $blueInt"
echo "redInt = $redInt"
echo "greenInt = $greenInt"
echo "purpleInt = $purpleInt"
echo "cyanInt = $cyanInt"
echo "yellowInt = $yellowInt"
echo "whiteInt = $whiteInt"
echo "blackInt = $blackInt"

maxValue=$blueInt

echo "maxValue = $maxValue"

Array=($redInt $greenInt $purpleInt $cyanInt $yellowInt $whiteInt $blackInt)

for index in ${!Array[*]}
do
	echo "ColorNo: $index has ${Array[$index]} size"
done