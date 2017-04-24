#!/bin/bash

yes="y"
no="n"
E=E
E0=E0

NamingFunc()
{
    echo "______________________________________________________________"
    echo "_______________________RENAMING TIME__________________________"    
    echo "______________________________________________________________"
    printf "I'm about to rename $eps episodes of $show for you,\nwhat season is it?\n"
    printf "HINT:(Season 1 though 9 should be: 01, 02, 03, etc.)\n"
    echo "______________________________________________________________"
    printf "> "
    read season

    if [ $eps -lt 10 ]
    then
        printf "The set up will be $show.S$season$E(01-0$eps)$ext\n"
    
    else
        printf "The set up will be $show.S$season$E(01-$eps)$ext\n"
    fi

    printf "is this ok?(y/n)\n>"
    read answer

    if [ $answer = $no ]
    then
        echo "______________________________________________________________"
        printf "Currently you're in the folder '$show'\nand you set Season to '$season' what's wrong?\n"
        printf "make sure this folder name is only the name of show that you\n"
        printf "want to rename and that you entered the right season number.\n"
        echo "______________________________________________________________"

        #Renaming $show for different folder names
        printf "would you like to reset the show name?(y/n)\n>"
        read reseta

        if [ $resta=$yes ]
        then
        	echo "______________________________________________________________"
        	printf "What would you like to reset the show name: $show to?\n>"
        	read show

			
    		if [ $eps -lt 10 ]
    		then
     			printf "The set up will be $show.S$season$E(01-0$eps)$ext\n"
    
    		else
        		printf "The set up will be $show.S$season$E(01-$eps)$ext\n"
    		fi

    		printf "is this ok?(y/n)\n>"
    		read answer

		else
            echo "______________________________________________________________"
        	printf "okay then, goodbye.\n"
        	echo "______________________________________________________________"
			exit
		fi
	fi
			
	if [ $answer = $yes ]
	then
        echo "______________________________________________________________"
        count=1
        for e in *$ext
        do  
            #episodes 1 through 9 get a 0 added before the count
            if [ $count -lt 10 ]
            then
                mv "$e" "$show.S$season$E0$count$ext"
                echo "$show.S$season$E0$count$ext ... DONE"
                (( count++ ))
            #else just count upp
            else
                mv "$e" "$show.S$season$E$count$ext"
                 echo "$show.S$season$E$count$ext ... DONE"
                (( count++ ))
            fi
        done
        echo "______________________________________________________________"
        printf "Files have been renamed\n"
        echo "______________________________________________________________"
    
    else
        set +e
        echo "______________________________________________________________"  
        printf "don't speak your booga booga language I quit\n"
        echo "______________________________________________________________"
        exit
    fi
}
#######Main###########
echo "______________________________________________________________"
printf "\n\nThis is a shell script to help you rename name TV show files\n"
printf "specifically for a plex server.\n\nA few things to note:\n"
printf "  -This script will only work if your files are in order\n"
printf "   * If there is numbering it needs to start with 01 not 1\n"
printf "   * This is because eps are set by an int each iteration\n"
printf "  -This only works if all the videofiles are the same file type\n"
printf "   * Still working on how to fix this\n"
printf "  -As of now this script only works up to 99 episodes\n"
printf "   * I know how to fix this I just have no need right now\n"
echo "______________________________________________________________"


echo "______________________________________________________________"
printf "we are in directory: /${PWD##*/}\nThis contains:\n$(ls)\n"
printf "\nDo you want to clean up folders white space?(y/n)\n"
echo "______________________________________________________________"
read clean
if [ $clean = $yes ]
then
	#gets rid of whitespace for folder names
	for f in *\ *; do mv "$f" "${f// /}"; done
	printf "All Clean:\n$(ls)\n"
else
	printf "okay moving on\n"
fi
echo "______________________________________________________________"
printf "Move into a directory?(y/n)\n>"
read cda

if [ $cda = $no ]
then
    echo "______________________________________________________________"
    printf "Okay staying here:\n\n$(ls)\n"
    echo "______________________________________________________________"
    arr=( $(ls) )
    filename=$(echo $(ls) | head -1)
    filename="${filename//" "/""}"
    ext=$(echo "$filename" | tail -c 5)
    arr=( *$ext )
    eps=${#arr[@]}
    #GET RID OF WHITE SPACE IN FOLDER NAME IF THERE
    show=${PWD##*/}        
    NamingFunc

elif [ $cda = $yes ]
then
    printf "where are we going?\n>"
    read cdd
    cd ${PWD}/$cdd
    echo "______________________________________________________________"
    printf "we are now in directory: /${PWD##*/}\nThis contains:\n$(ls)\n"
    echo "______________________________________________________________"
    arr=( $(ls) )
    filename=$(echo $(ls) | head -1)
    filename="${filename//" "/""}"
    ext=$(echo "$filename" | tail -c 5)
    arr=( *$ext )
    eps=${#arr[@]}
    #GET RID OF WHITE SPACE IN FOLDER NAME IF THERE
    show=${PWD##*/}        

    NamingFunc

    
else
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "The Fuck man I haven't gotten this far"
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	exit
fi
