
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
switchFlag=" ";
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
			switchFlag=0;
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
			switchFlag=1;
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
 		declare -a forICanWin;
		forICanWin=([1]=1 [2]=2 [3]=3 [4]=1 [5]=4 [6]=7  [7]=1 [8]=5 [9]=9  [10]=3 [11]=6 [12]=9  [13]=7 [14]=8 [15]=9  [16]=3 [17]=5 [18]=7  [19]=2 [20]=5 [21]=8  [22]=4 [23]=5 [24]=6);
		for (( locate=1;locate <=22; locate=$nextPair ))
      do
     		nextByOne=$(( $locate + 1 ));
         nextByTwo=$(( $locate + 2 ));
         element1=${forICanWin[ locate ]};
         element2=${forICanWin[ nextByOne ]};
         element3=${forICanWin[ nextByTwo ]};
       	pair=$(( ${gameStorage[element1]} + ${gameStorage[element2]} +  ${gameStorage[element3]}  ));
			if [ $pair -eq  $whoIs ] 
			then
				if [ $switchFlag -eq 1 ]
        		then
         		printf "\n \n";
         		echo "-----------YOU WON------------";
         	else
         		echo "---------COMPUTER WON---------";
         	fi;
         	printf "\n \n ";
         	echo "-----------------------------";
         	echo "| WINNER WINNER CHIKEN DINNER |";
         	echo "------------------------------";
         	exit 1;
			fi;
			nextPair=$(( $locate + 3 ));
		done
	}

#==================================================================================================
#This fun activate if  winning and blocking positions are not there
	function computerPlaying(){
		#4 corner,Centre,side Corners
		automaticMove=( [1]=1 [2]=3 [3]=7  [4]=9 [5]=5 [6]=2  [7]=8 [8]=4 [9]=6 ); 
		for ((move=1;move<10;move++))
		do
			movePlay=${automaticMove[move]};
			if [ ${gameStorage[movePlay]} -eq 0 ]
         then
            echo $movePlay;
				break;
			fi;
		done
	}

#==========================Winninng And Blocking is done by This Function============================
#This Function Will Give winning and blocking To  Computer  by passing different arguments
#like BlockAttack and WinAttack

	function iCanWin(){
		attack=$1;
      if [ $winAttack -eq $attack ]
      then
         #win Attack Check condition for winning Block 
         winsCondition=2;
         checker=1;
      else
         #But THis Win condition we are using for block also
         #This is Block condition
         winsCondition=200;
         checker=1;
      fi;

 		declare -a forICanWin;
		forICanWin=([1]=1 [2]=2 [3]=3  [4]=1 [5]=4 [6]=7  [7]=1 [8]=5 [9]=9  [10]=3 [11]=6 [12]=9  [13]=7 [14]=8 [15]=9  [16]=3 [17]=5 [18]=7  [19]=2 [20]=5 [21]=8  [22]=4 [23]=5 [24]=6);
		for (( locate=1;locate <=22; locate=$nextPair ))
		do
			nextByOne=$(( $locate + 1 ));
         nextByTwo=$(( $locate + 2 ));
			element1=${forICanWin[ locate ]};
			element2=${forICanWin[ nextByOne ]};
			element3=${forICanWin[ nextByTwo ]};
   		pair=$(( ${gameStorage[element1]} + ${gameStorage[element2]} +  ${gameStorage[element3]}  ));

			if [ $pair -eq $winsCondition ]
         then
            if [ $((${gameStorage[element1]} + $checker )) -eq $checker ] 
            then
               echo $element1;
					break;
            elif [ $((${gameStorage[element2]} + $checker )) -eq $checker ]
            then
               echo $element2;        	       
					break;
            elif [ $((${gameStorage[element3]} + $checker )) -eq $checker ]
            then
               echo $element3;
					break;
            fi;
         fi;
			nextPair=$(( $locate + 3 ));
		done
	}

#============================Player Play From Here=======================================
	function playerFunction(){
		printf "\n ";
      echo "    *********";
      echo "     YOUR TURN";
    	echo "     SYMBOL=" $playerSymbol;
      printf "\n \n";
      #SUGGESTION TO USER
      #If Computer is winning then it will give  suggetstion
      tripletWin=$(iCanWin $winAttack);

      if [ $tripletWin > 0 ]
      then
      	printf "\n ";
         echo "SUGGESTION="$tripletWin;
     	fi;

      #Cell Choice From User
      read -p  "Enter VALID CELL=" cell;
      #calling to insert into array
      insertInStorage $cell $PLAYERVALUE;
      #Board Reflects here
      board;
      checkWin $PLAYERPLAY;
      switchFlag=0;
      printf "\n \n ";
	}

#==============================Computer Performs Operatins From Here======================================
	function computerFunction(){

		printf "\n ";
      echo "    **************";
      echo "     COMPUTER TURN";
      echo "      SYMBOL=" $computerSymbol;
      #computer Playing Give Cell Value
      #ICANWIN give Output only when winning condition
      tripletWin=$(iCanWin $winAttack );
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
      tripletBlock=$(iCanWin $blockAttack );
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
	}

#=======================================THIS IS MAIN===========================================================
#Player Switching Done Here
	while :
	do
		#GAME init execute only once to Assign generate Symbols And Toss
		if [ $GAMEINIT -eq 1 ]
		then
			assignSymbol;
			GAMEINIT=0;
		fi;

		#THIS LOGIC FOR SWITCHING PLAYERS
		if [ $switchFlag -eq 1 ]
		then
			playerFunction;
		elif [ $switchFlag -eq 0 ]
		then
			computerFunction;
		fi;

	done;
unset gameStorage;
unset symbolStorage;
#========================================================THE END===========================================================
