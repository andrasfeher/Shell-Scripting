#!/bin/bash
# INDEX=1
# while [ $INDEX -lt 6 ]
# do
#   RANDOM_TAG=$RANDOM
#   echo "Creating project-${INDEX}-${RANDOM_TAG}"
#   mkdir ./project-${INDEX}-${RANDOM_TAG}
#   ((INDEX++)) # arithmetical expansion; enclose it in double parenthesis
# done

# while [ "$CORRECT" != "y" ]
# do
#   read -p "Enter your name: " NAME
#   read -p "Is ${NAME} correct? " CORRECT
# done


# return code of command
# while ping -c 1 localhost >/dev/null
# do
#   echo "app1 still up...."
#   sleep 5
# done
#
# echo "app1 down, continuing."

# reading a file line-by-line
# LINE_NUM=1
# while read LINE
# do
#   echo "${LINE_NUM}: ${LINE}"
#   ((LINE_NUM++))
# done < /etc/fstab

# get the input from the output of another command
# grep ext4 /etc/fstab | while read LINE
# do
#   echo "ext4: ${LINE}"
# done

# put parts of the line in different variables
# FS_NUM=1
# grep ext4 /etc/fstab | while read FS MP REST
# do
#   echo "${FS_NUM}: file system: ${FS}"
#   echo "${FS_NUM}: mount point: ${MP}"
#   ((FS_NUM++))
# done

# simple menu system
# while true
# do
#   read -p "1: Show disk usage. 2: Show uptime. " CHOICE
#   case "$CHOICE" in
#     1)
#       df -h
#       ;;
#     2)
#       uptime
#       ;;
#     *)
#       break # break the loop
#       ;;
#   esac
# done

# backup mysql databases that have not been backed up recently
# -B: disables ASCII table output
# -N: disables table headers
# -e: execute command
# mysql -BNe 'show databases' | while read DB
# do
#   db-backed-up-recently $DB
#   if [ "$?" -eq "0" ]
#   then
#     continue
#   fi
#   backup $DB
# done
