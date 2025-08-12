while true; do
	read -p "Choose Command: (1- Add Task, 2- List Tasks, 3- Mark Task as Done, 4- List Tasks Done, 5- Delete Task, 6- Exit) " cmd

	case "$cmd" in
	  1)
	    read -p "Enter Task: " task
	    echo "$task:Pending" >> tasklist.txt
	    ;;
	  2)
	    if [ -f tasklist.txt ]; then
		    grep ":Pending" tasklist.txt | nl
		   
	    else
	      echo "No tasks found."
	    fi
	    ;;
	  3)	
		  echo "Current Tasks: "
		  grep ":Pending" tasklist.txt | nl
		  declare -i i=0
		  while(( i < 3 )); do
			read -p "Enter task number to mark as done: " taskno
			if ! [[ "$taskno" =~ ^[0-9]+$ ]]; then
				echo "Invalid input. Must be a number."
				((i++))
			else
				task=$(sed -n "${taskno}p" tasklist.txt)
				task="${task%:Pending}"
				echo "$task"
				if [ -f tasklist.txt ]; then
					
					sed -i "${taskno}d" tasklist.txt
					echo "$task:Done" >> taskdone.txt
					echo "Marked Task "$task" as Done."
					echo "Tasks Done: "
					grep "$task:Done" taskdone.txt | nl
				else
					echo "No tasks found"
				fi
				
				break
			fi
			done
		if [ "$i" -eq 3 ]; then
			echo "Invalid input for 3 times. Exiting..."
			exit 1
			fi
		;;
    4)	
	    if [ -f taskdone.txt ]; then                                
                                  echo "Tasks Done: "
                                  nl taskdone.txt
                          else
                                  echo "No tasks found"
                          fi
	 ;;



	  5)  
		
		  echo "Current Tasks: "
		  grep ":Pending" tasklist.txt | nl
		  declare -i i=0
		  while (( i < 3 )); do 
		  	read -p "Enter task number to delete: " taskno
			if ! [[ "$taskno" =~ ^[0-9]+$ ]]; then
				echo "Invalid input. Must be a number. Try Again."
				((i++))

			else
				task=$(sed -n "${taskno}p" tasklist.txt)
				if [ -s tasklist.txt ]; then	  
					sed -i "${taskno}d" tasklist.txt
					echo "Task "$task" Deleted."
				else
					echo "No tasks found"
				fi
				break
			fi
		  done
		if [ "$i" -eq 3 ]; then
			echo "Invalid input for 3 times. Exiting..."
			exit 1
			fi
		;;

    6)		echo "Exiting..."
			break
		;;
	    *)
		    echo "Invalid option."
		    ;;
		esac
done
