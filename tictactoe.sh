
#!/bin/bash -x
echo "Welcome to tic Tac Toe GAME";
#CONSTANTS
COMPUTERPLAY=0;
PLAYERPLAY=1;
#VARIABLES
whoPlay=0;
#Locic For Board Design 
#Assumed for 1-2-3
a="O";
b="O";
c="O";
#Assumed for 4-5-6
d="X";
e="X";
f="X";
#Assumed for 7-8-9
h="X";
i="X";
j="X";

echo "-------------------------";

echo -ne "|       ";echo -ne "|       ";echo -ne "|       ";echo -ne "|       "; echo -e " ";

echo -ne "|   $a   ";echo -ne "|   $b   ";echo -ne "|   $c   ";echo -ne "|       "; echo -e " ";

echo -ne "|       ";echo -ne "|       ";echo -ne "|       ";echo -ne "|       "; echo -e " ";

echo "-------------------------";

echo -ne "|       ";echo -ne "|       ";echo -ne "|       ";echo -ne "|       "; echo -e " ";

echo -ne "|   $d   ";echo -ne "|   $e   ";echo -ne "|   $f   ";echo -ne "|       "; echo -e " ";

echo -ne "|       ";echo -ne "|       ";echo -ne "|       ";echo -ne "|       "; echo -e " ";


echo "-------------------------";

echo -ne "|       ";echo -ne "|       ";echo -ne "|       ";echo -ne "|       "; echo -e " ";

echo -ne "|   $h   ";echo -ne "|   $i   ";echo -ne "|   $j   ";echo -ne "|       "; echo -e " ";

echo -ne "|       ";echo -ne "|       ";echo -ne "|       ";echo -ne "|       "; echo -e " ";

echo "-------------------------";

echo -ne " ";

#Toss for Who Play First
whoPlay=$((RANDOM%2));
echo $whoPlay;

	if [ $whoPlay -eq $COMPUTERPLAY ]
	then
		echo "Computer Play First";
	else
		echo "Player Play First";
	fi;
