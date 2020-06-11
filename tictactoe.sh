
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

#We are calling ICANWIN function for winning move and the Blocking move
winAttack=1
blockAttack=2;
#VARIABLES

tossResult=" ";
computerSymbol=" ";
playerSymbol=" ";
#To Switch The players
switchFlag=1;

#To store return value For Win block condition 
tripletWin=0;
tripletBlock=0;
#ARRAY
#gameStorage To Actual Values
#symbolStorage for To store symbols  By mapping Two players Values
declare -a gameStorage;
declare -a symbolStorage;
#=================================================BOARD DESIGN============================================
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
#=================================THIS RUNS ONLY ONCE WHILE INITIALIZATION=================================
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


#===================THIS FUNCTION FOR INSERTING VALUE AND THE SYMBOL TO ARRAY=========================== 
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

#====================================HERE WE ARE CHECK WINNER===========================================
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
			echo "-----------------------------";
			echo "| WINNER WINNER CHIKEN DINNER |";
			echo "------------------------------";
			exit 1;
		fi;
	}

#==================================================================================================
#This Function for Corner conditions if the winning move blocking move not possible
	function computerPlaying(){
			#These Are 4 corner conditions
			if [ ${gameStorage[1]} -eq 0 ]
			then
				state=1;
				echo $state;
			elif [ ${gameStorage[3]} -eq 0 ]
         then
            state=3;
            echo $state;
			elif [ ${gameStorage[7]} -eq 0 ]
         then
            state=7;
            echo $state;
			elif [ ${gameStorage[9]} -eq 0 ]
         then
            state=9;
            echo $state;
			#This is middle condition
			elif [ ${gameStorage[5]} -eq 0 ]
         then
            state=5;
            echo $state;
			#These Are side corner conditions
			elif [ ${gameStorage[2]} -eq 0 ]
         then
            state=2;
            echo $state;
			elif [ ${gameStorage[8]} -eq 0 ]
         then
            state=8;
            echo $state;
			elif [ ${gameStorage[4]} -eq 0 ]
         then
            state=4;
            echo $state;
			elif [ ${gameStorage[6]} -eq 0 ]
         then
            state=6;
            echo $state;
			fi;
	}

#==========================Winninng And Blocking is done by This Function============================

#This Function Will Give winning and blocking positions to user by passing different arguments
#like BlockAttack and Win Attack
	function iCanWin(){

		pair1=$(( ${gameStorage[1]} + ${gameStorage[2]} +  ${gameStorage[3]}  ));
		pair2=$(( ${gameStorage[1]} + ${gameStorage[4]} +  ${gameStorage[7]}  ));
		pair3=$(( ${gameStorage[1]} + ${gameStorage[5]} +  ${gameStorage[9]}  ));
		pair4=$(( ${gameStorage[2]} + ${gameStorage[5]} +  ${gameStorage[8]}  ));
		pair5=$(( ${gameStorage[4]} + ${gameStorage[5]} +  ${gameStorage[6]}  ));
		pair6=$(( ${gameStorage[3]} + ${gameStorage[5]} +  ${gameStorage[7]}  ));
		pair7=$(( ${gameStorage[3]} + ${gameStorage[6]} +  ${gameStorage[9]}  ));
		pair8=$(( ${gameStorage[7]} + ${gameStorage[8]} +  ${gameStorage[9]}  ));
		
		attack=$1;
		if [ $winAttack -eq $attack ]
		then
			#win Attack Check condition for winning Block 
			winsCondition=2;
			add=1;
			checker=1;
		else
			#But THis Win condition we are using for block also
			#This is Block condition
			winsCondition=200;
         add=1;
         checker=1;
		fi;

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
			fi;
	}


#=======================================THIS IS MAIN===========================================================
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
		#ICANWIN give Output only when winning condition

		tripletWin=$(iCanWin $winAttack);
		#If this condition Execute means 100% Winner
		if [ $tripletWin > 0 ]
		then
		cell1=$tripletWin;
		insertInStorage $cell1 $COMPUTERVALUE;
		board;
		checkWin $COMPUTERPLAY;
		printf "\n ";
		echo "COMPUTER WON";
		fi;
		
		#IF We Cannot Win Then We Are Blocking Opponents By this Condition
		#blocking condition we not win so we switching 
		tripletBlock=$(iCanWin $blockAttack);
		if [ $tripletBlock > 0 ]
		then
			cell1=$tripletBlock;
			insertInStorage $cell1 $COMPUTERVALUE;
      	board;
			switchFlag=1;
		else
			#If Winning And Blocking not possible then we Play Randomly And by giving priorities
      	cell1=$(computerPlaying);
      	insertInStorage $cell1 $COMPUTERVALUE;
      	board;
      	checkWin $COMPUTERPLAY;
      	switchFlag=1;
			fi;
	fi;

	done;
unset gameStorage;
unset symbolStorage;
==============================================THE END===========================================================
