
#!/bin/bash -x
echo "Welcome to tic Tac Toe GAME";
#CONSTANTS
COMPUTERPLAY=0;
PLAYERPLAY=1;
SYMBOL1="O";
SYMBOL2="X";
#VARIABLES
tossResult=0;
computerSymbol="-";
playerSymbol="-";
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
tossResult=$((RANDOM%2));

	if [ $tossResult -eq $COMPUTERPLAY ]
	then
		#Computer Randomly Choose the Symbol
		echo "Computer Play First";
		symbol=$((RANDOM%2));

  	 	if [ $symbol -eq $COMPUTERPLAY ]
   	then
			printf "\n";
      	computerSymbol=$SYMBOL1;
			echo "COMPUTER SYMBOL IS="$computerSymbol;
   	else
			printf "\n";
      	computerSymbol=$SYMBOL2;
			echo "COMPUTER SYMBOL IS="$computerSymbol;
   	fi;

	else
		#Player Choose The Symbol
		#If player pressed Wrong Choice Then Player Automatically Get the Symbol --X--
		echo "Player Play First";
		echo "To Choose Symbol Press Number";
		echo "1) O";
		echo "2) X";
		read -p "Enter=" choice;

		if [ $choice -eq 1 ]
      then
			printf "\n";
        	playerSymbol=$SYMBOL1;
        	echo "PLAYER SYMBOL IS="$playerSymbol;
      else
			printf "\n";
         playerSymbol=$SYMBOL2;
			echo "PLAYER SYMBOL IS="$playerSymbol;
      fi;

	fi;
