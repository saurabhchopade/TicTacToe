

#!/bin/bash -x
echo "Welcome to tic Tac Toe GAME";
#CONSTANTS
COMPUTERPLAY=0;
PLAYERPLAY=1;
SYMBOL1="O";
SYMBOL2="X";
PLAYERVALUE=100;
COMPUTERVALUE=1;
GAMEINIT=1;
#VARIABLES
tossResult="-";
computerSymbol="-";
playerSymbol="-";
switchFlag=1;

#ARRAY
declare -a gameStorage;
declare -a symbolStorage;
	function board() {
		#Locic For Board Design 
		#Assumed for 1-2-3
		a=${symbolStorage[1]};
		b=${symbolStorage[2]};
		c=${symbolStorage[3]};
		#Assumed for 4-5-6
		d=${symbolStorage[4]};
		e=${symbolStorage[5]};
		f=${symbolStorage[6]};
		#Assumed for 7-8-9
		h=${symbolStorage[7]};
		i=${symbolStorage[8]};
		j=${symbolStorage[9]};

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

	}

#Toss for Who Play First
#This Logic Run Only Starting of The GAME
	function assignSymbol(){
		blank="-";
		#Array Initialized Because to set Boad Alignment Proper
		for (( index=0;index<=10;index++))
      do
         symbolStorage[(( index ))]="$blank";
      done

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
		#Calling Board Function  To enter Valid cells
      board;
	}

#THIS FUNCTION FOR INSERTING VALUE AND THE SYMBOL TO ARRAY 
#VALUE ARRAY(GAMESTORAGE) WE USING FOR THE WINNING CONDITION AND FOR BLOCKING THE PLAYER USING THE VALUES
#SYMBOL STORAGE USING FOR AS PER USER CELL VALUE
 
	function insertInStorage(){

	cellv=$1;
	value=$2;
	#echo $cellv $value;
	gameStorage[(( cellv ))]="$value";

	#Storing Symbol As per The Value
	if [ $value -eq $PLAYERVALUE ]
	then
		#PLAYER VALUE MEANS ITS PLAYER 
		symbolStorage[(( cellv ))]="$playerSymbol";

	elif [ $value -eq $COMPUTERVALUE ]
	then
		#MEANS ITS COMPUTER TURN SO THAT WE STORING COMPUTER SYMBOL
		symbolStorage[(( cellv ))]="$computerSymbol";
		echo ${gameStorage[@]};
	fi;

	}


#Player Switching Done Here
#This Is main
	while :
	do

	#GAME initialize execute only onece to Assign Symbols And Toss
	if [ $GAMEINIT -eq 1 ]
	then
		assignSymbol;
		GAMEINIT=0;
	fi;

	#THIS LOGIC FOR SWITCHING PLAYERS
	if [ $switchFlag -eq 1 ]
	then
		echo "==PLAYER TURN==";

		#Cell Choice From User
		read -p  "Enter VALID CELL=" cell;

		#calling to insert into array
     	insertInStorage $cell $PLAYERVALUE;

      #To Reflect in Board
      board;

      switchFlag=0;

	else
		echo "==COMPUTER TURN==";

		switchFlag=1;

	fi;

	done;
