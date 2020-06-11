
#!/bin/bash -x
echo "Welcome to tic Tac Toe GAME";
#CONSTANTS

#This is for To check who PLAY FIRST  
COMPUTERPLAY=0;
PLAYERPLAY=1;

#Board Symbols
SYMBOL1="O";
SYMBOL2="X";

#100 means player and 1 means Computer
PLAYERVALUE=100;
COMPUTERVALUE=1;
#gameinit flag is to initialize the game like who play play first /which player which symbol
GAMEINIT=1;

#To check pair Addition// if addition equal to this Pair means Winning Condition 
COMPUTERPAIR=3;
PLAYERPAIR=300;

#VARIABLES

tossResult=" ";
computerSymbol=" ";
playerSymbol=" ";
#To Switch The players
switchFlag=1;

#ARRAY
#gameStorage To Actual Values
#symbolStorage for To store symbols  By mapping Two players Values
declare -a gameStorage;
declare -a symbolStorage;

#Board function display the Design with respective Symbols
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
		k=0;
		blank=$k;
		dummySymbol=" ";
		#Array Initialized Because to set Boad Alignment Proper
		for (( index=0;index<10;index++))
      do
         symbolStorage[(( index ))]="$dummySymbol";
			gameStorage[(( index ))]="$blank";
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
				#IF WE ASSIGN SYMBOL TO Computer IT WILL NOT ASSIGNE SYMBOL TO PLAYER
            #SO that we assigned PLAYER Symbol
      		computerSymbol=$SYMBOL1;
				playerSymbol=$SYMBOL2;
				echo "COMPUTER SYMBOL IS="$computerSymbol;
				printf "\n";
   		else
				printf "\n";
				#IF WE ASSIGN SYMBOL TO Computer IT WILL NOT ASSIGNE SYMBOL TO PLAYER
            #SO that we assigned PLAYER Symbol
      		computerSymbol=$SYMBOL2;
				playerSymbol=$SYMBOL1;
				echo "COMPUTER SYMBOL IS="$computerSymbol;
				printf "\n";
   		fi;

			else
				#Player Choose The Symbol
				#If player pressed Wrong Choice Then Player Automatically Get the Symbol --X--

				echo "YOU Play First";
				printf "\n \n";
				echo "To Choose Symbol Press Number";
				echo "1) O";
				echo "2) X";
				printf "\n \n";
				read -p "Enter=" choice;

				if [ $choice -eq 1 ]
      		then
					printf "\n";
					#IF WE ASSIGN SYMBOL TO PLAYER IT WILL NOT ASSIGNE SYMBOL TO COMPUTER 
					#SO that we assigned computer Symbol
        			playerSymbol=$SYMBOL1;
					computerSymbol=$SYMBOL2;
        			echo "YOUR SYMBOL IS="$playerSymbol;
					printf "\n";
      		else
					printf "\n";
					#IF WE ASSIGN SYMBOL TO PLAYER IT WILL NOT ASSIGNE SYMBOL TO COMPUTER
					#SO that we assigned computer Symbol
         		playerSymbol=$SYMBOL2;
					computerSymbol=$SYMBOL1;
					echo "YOUR  SYMBOL IS="$playerSymbol;
					printf "\n";
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
	fi;

	}

#HERE WE ARE CHECKING WINNING CONDITION
	function checkWin() {
		whichPlayer=$1
		if [ $PLAYERPLAY -eq $whichPlayer ]
		then
		#PLAYERPAIR=300;
		whoIs=$PLAYERPAIR;
		else
		#$COMPUTERPAIR=3;
		whoIs=$COMPUTERPAIR;
		fi;
		#GameStorage Contains These Values
		#	PLAYERVALUE=100;
		#	COMPUTERVALUE=1;
		pair1=$(( ${gameStorage[1]} + ${gameStorage[2]} +  ${gameStorage[3]}  ));
		pair2=$(( ${gameStorage[1]} + ${gameStorage[4]} +  ${gameStorage[7]}  ));
		pair3=$(( ${gameStorage[1]} + ${gameStorage[5]} +  ${gameStorage[9]}  ));
		pair4=$(( ${gameStorage[2]} + ${gameStorage[5]} +  ${gameStorage[8]}  ));
		pair5=$(( ${gameStorage[4]} + ${gameStorage[5]} +  ${gameStorage[6]}  ));
		pair6=$(( ${gameStorage[3]} + ${gameStorage[5]} +  ${gameStorage[7]}  ));
		pair7=$(( ${gameStorage[3]} + ${gameStorage[6]} +  ${gameStorage[9]}  ));
		pair8=$(( ${gameStorage[7]} + ${gameStorage[8]} +  ${gameStorage[9]}  ));

		if [ $pair1 -eq  $whoIs ] || [ $pair2 -eq  $whoIs ] || [ $pair3 -eq  $whoIs ] || [ $pair4 -eq  $whoIs ] || [ $pair5 -eq  $whoIs ] || [ $pair6 -eq  $whoIs ] || [ $pair7 -eq  $whoIs ] || [ $pair8 -eq  $whoIs ] 
		then
			echo "WINNER WINNER CHIKEN DINNER";
			exit 1;
		fi;
	}



	function computerPlaying(){
			 for (( i=1;i<10;i++))
         do
            l=${gameStorage[$i]};
            if [ $l -eq 0 ]
            then
               echo $i;
               break;
            fi;
         done
	}
	
	function iCanWin(){
		winsCondition=2;
		pair1=$(( ${gameStorage[1]} + ${gameStorage[2]} +  ${gameStorage[3]}  ));
		pair2=$(( ${gameStorage[1]} + ${gameStorage[4]} +  ${gameStorage[7]}  ));
		pair3=$(( ${gameStorage[1]} + ${gameStorage[5]} +  ${gameStorage[9]}  ));
		pair4=$(( ${gameStorage[2]} + ${gameStorage[5]} +  ${gameStorage[8]}  ));
		pair5=$(( ${gameStorage[4]} + ${gameStorage[5]} +  ${gameStorage[6]}  ));
		pair6=$(( ${gameStorage[3]} + ${gameStorage[5]} +  ${gameStorage[7]}  ));
		pair7=$(( ${gameStorage[3]} + ${gameStorage[6]} +  ${gameStorage[9]}  ));
		pair8=$(( ${gameStorage[7]} + ${gameStorage[8]} +  ${gameStorage[9]}  ));

 
			add=1;
			checker=1;
			if [ $pair1 -eq $winsCondition ]
			then
				if [ $((${gameStorage[1]} + $add )) -eq $checker ]
				then
					no=1;
					echo $no;
					
				elif [ $((${gameStorage[2]} + $add )) -eq $checker ]
				then
					no=2;   
               echo $no;
					
				elif [ $((${gameStorage[3]} + $add )) -eq $checker ]
				then
					no=3;
					echo $no;
				
				fi;
		
         elif [ $pair2 -eq $winsCondition ]
         then
            if [ $((${gameStorage[1]} + $add )) -eq $checker ] 
            then
					no=1;
               echo $no;
               
            elif [ $((${gameStorage[4]} + $add )) -eq $checker ]
            then
					no=4;
               echo $no;
               
            elif [ $((${gameStorage[7]} + $add )) -eq $checker ]
            then
					no=7;
               echo $no;
               
            fi;
			
			elif [ $pair3 -eq $winsCondition ]
         then
            if [ $((${gameStorage[1]} + $add )) -eq $checker ] 
            then
					no=1;
               echo $no;
               
            elif [ $((${gameStorage[5]} + $add )) -eq $checker ]
            then
					no=5;
               echo $no;
               
            elif [ $((${gameStorage[9]} + $add )) -eq $checker ]
            then
					no=9;
               echo $no;
               
            fi;
			elif [ $pair4 -eq $winsCondition ]
         then
            if [ $((${gameStorage[2]} + $add )) -eq $checker ] 
            then
					no=2;
               echo $no;
               
            elif [ $((${gameStorage[5]} + $add )) -eq $checker ]
            then
					no=5;
               echo $no;
               
            elif [ $((${gameStorage[8]} + $add )) -eq $checker ]
            then
					no=8;
               echo $no;
               
            fi;
			elif [ $pair5 -eq $winsCondition ]
         then
            if [ $((${gameStorage[4]} + $add )) -eq $checker ] 
            then
					no=4;
               echo $no;
               
            elif [ $((${gameStorage[5]} + $add )) -eq $checker ]
            then
					no=5;
               echo $no;
               
            elif [ $((${gameStorage[6]} + $add )) -eq $checker ]
            then
					no=6;
               echo $no;
               
            fi;
			elif [ $pair6 -eq $winsCondition ]
         then
            if [ $((${gameStorage[3]} + $add )) -eq $checker ] 
            then
					no=6;
               echo $no;
               
            elif [ $((${gameStorage[5]} + $add )) -eq $checker ]
            then
					no=5;
               echo $no;
               
            elif [ $((${gameStorage[7]} + $add )) -eq $checker ]
            then
					no=7;
               echo $no;
               
            fi;
			elif [ $pair7 -eq $winsCondition ]
         then
            if [ $((${gameStorage[3]} + $add )) -eq $checker ] 
            then
					no=3;
               echo $no;
               
            elif [ $((${gameStorage[6]} + $add )) -eq $checker ]
            then
					no=6;
               echo $no;
               
            elif [ $((${gameStorage[9]} + $add )) -eq $checker ]
            then
					no=9;
               echo $no;
               
            fi;
			elif [ $pair8 -eq $winsCondition ]
         then
            if [ $((${gameStorage[7]} + $add )) -eq $checker ] 
            then
					no=7;
               echo $no;
               
            elif [ $((${gameStorage[8]} + $add )) -eq $checker ]
            then
					no=8;
               echo $no;
               
            elif [ $((${gameStorage[9]} + $add )) -eq $checker ]
            then
					no=9;
               echo $no;
            fi;
			fi

	}


#THIS IS MAIN
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
		printf "\n ";
		echo "     YOUR TURN";
		echo "      Symbol=" $playerSymbol;

		printf "\n \n";
		#Cell Choice From User
		read -p  "Enter VALID CELL=" cell;

		#calling to insert into array
     	insertInStorage $cell $PLAYERVALUE;
		
      #Board changes here
      board;
		checkWin $PLAYERPLAY;
      switchFlag=0;
		printf "\n \n ";
	else
		printf "\n ";
		echo "     COMPUTER TURN";
		echo "      Symbol=" $computerSymbol;
		#computer Playing Give Cell Value
		celem=$(iCanWin);
		echo "========="$celem;
		cell1=$(computerPlaying);
		insertInStorage $cell1 $COMPUTERVALUE;
		board;
		checkWin $COMPUTERPLAY;
		switchFlag=1;
		
	fi;

	done;
unset gameStorage;
unset symbolStorage;
