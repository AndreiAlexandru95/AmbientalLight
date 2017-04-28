#!/bin/bash
# script.sh

clear

while true; do

	blueInt=0
	redInt=0
	greenInt=0
	purpleInt=0
	cyanInt=0
	yellowInt=0
	whiteInt=0
	blackInt=0
	temp=0
	treshold=10
	nodataID=6

	# Get packets that contain the dictionary words
	sudo timeout 60 ngrep -X -q -d wlan2 port 80 -O test.dump

	temp=`du -k "test.dump" | cut -f1`

	if [ "$temp" -gt "$treshold" ]; then

		# Get the packets for BLUE color - fear|terror|horror
		sudo ngrep -xX -q '0x66656172' -I test.dump -O blue.dump

		temp=`du -k "blue.dump" | cut -f1`
		blueInt=$((blueInt + temp))

		sudo ngrep -xX -q '0x746572726f72' -I test.dump -O blue.dump

		temp=`du -k "blue.dump" | cut -f1`
		blueInt=$((blueInt + temp))

		sudo ngrep -xX -q '0x686f72726f72' -I test.dump -O blue.dump

		temp=`du -k "blue.dump" | cut -f1`
		blueInt=$((blueInt + temp))


		# Get the packets for RED color - love|sex|sweet
		sudo ngrep -xX -q '0x6c6f7665' -I test.dump -O red.dump

		temp=`du -k "red.dump" | cut -f1`
		redInt=$((redInt + temp))

		sudo ngrep -xX -q '0x736578' -I test.dump -O red.dump

		temp=`du -k "red.dump" | cut -f1`
		redInt=$((redInt + temp))

		sudo ngrep -xX -q '0x7377656574' -I test.dump -O red.dump

		temp=`du -k "red.dump" | cut -f1`
		redInt=$((redInt + temp))


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


		# Get the packets for PURPLE color - sad|depress|cry
		sudo ngrep -xX -q '0x736164' -I test.dump -O purple.dump

		temp=`du -k "purple.dump" | cut -f1`
		purpleInt=$((purpleInt + temp))

		sudo ngrep -xX -q '0x64657072657373' -I test.dump -O purple.dump

		temp=`du -k "purple.dump" | cut -f1`
		purpleInt=$((purpleInt + temp))

		sudo ngrep -xX -q '0x637279' -I test.dump -O purple.dump

		temp=`du -k "purple.dump" | cut -f1`
		purpleInt=$((purpleInt + temp))


		# Get the packets for CYAN color - peace|relax|zen
		sudo ngrep -xX -q '0x7065616365' -I test.dump -O cyan.dump

		temp=`du -k "cyan.dump" | cut -f1`
		cyanInt=$((cyanInt + temp))

		sudo ngrep -xX -q '0x72656c6178' -I test.dump -O cyan.dump

		temp=`du -k "cyan.dump" | cut -f1`
		cyanInt=$((cyanInt + temp))

		sudo ngrep -xX -q '0x7a656e' -I test.dump -O cyan.dump

		temp=`du -k "cyan.dump" | cut -f1`
		cyanInt=$((cyanInt + temp))


		# Get the packets for YELLOW color - happy|joy|cheer
		sudo ngrep -xX -q '0x6861707079' -I test.dump -O yellow.dump

		temp=`du -k "yellow.dump" | cut -f1`
		yellowInt=$((yellowInt + temp))

		sudo ngrep -xX -q '0x6a6f79' -I test.dump -O yellow.dump

		temp=`du -k "yellow.dump" | cut -f1`
		yellowInt=$((yellowInt + temp))

		sudo ngrep -xX -q '0x6368656572' -I test.dump -O yellow.dump

		temp=`du -k "yellow.dump" | cut -f1`
		yellowInt=$((yellowInt + temp))


		# Get the packets for WHITE color - news|politic|science
		sudo ngrep -xX -q '0x6e657773' -I test.dump -O white.dump

		temp=`du -k "white.dump" | cut -f1`
		whiteInt=$((whiteInt + temp))

		sudo ngrep -xX -q '0x706f6c69746963' -I test.dump -O white.dump

		temp=`du -k "white.dump" | cut -f1`
		whiteInt=$((whiteInt + temp))

		sudo ngrep -xX -q '0x736369656e6365' -I test.dump -O white.dump

		temp=`du -k "white.dump" | cut -f1`
		whiteInt=$((whiteInt + temp))


		# Get the packets for NO color - tragi|disaster|terror
		sudo ngrep -xX -q '0x7472616769' -I test.dump -O black.dump

		temp=`du -k "black.dump" | cut -f1`
		blackInt=$((blackInt + temp))

		sudo ngrep -xX -q '0x6469736173746572' -I test.dump -O black.dump

		temp=`du -k "black.dump" | cut -f1`
		blackInt=$((blackInt + temp))

		sudo ngrep -xX -q '0x746572726f72' -I test.dump -O black.dump

		temp=`du -k "black.dump" | cut -f1`
		blackInt=$((blackInt + temp))

		echo "blueInt = $blueInt"
		echo "redInt = $redInt"
		echo "greenInt = $greenInt"
		echo "purpleInt = $purpleInt"
		echo "cyanInt = $cyanInt"
		echo "yellowInt = $yellowInt"
		echo "whiteInt = $whiteInt"
		echo "blackInt = $blackInt"

		maxValue=$blueInt
		maxColor=7

		Array=($redInt $greenInt $purpleInt $cyanInt $yellowInt $whiteInt $blackInt)
		# See what color should be lighten depending on the size of its file
		for index in ${!Array[*]}
		do
			if [ "${Array[$index]}" -gt "$maxValue" ]; then
				maxValue=${Array[$index]};
				maxColor=$index;
			fi
		done

		# Send the Color id to colorFile for further use
		# ID = 0 : red
		# ID = 1 : green
		# ID = 2 : purple
		# ID = 3 : cyan
		# ID = 4 : yellow
		# ID = 5 : white
		# ID = 6 : black
		# ID = 7 : blue
		echo -n "$maxColor" > /home/pi/AmbientalLight/LedBorg/colorFile.txt
	else
		echo -n "$nodataID" > /home/pi/AmbientalLight/LedBorg/colorFile.txt
	fi

done