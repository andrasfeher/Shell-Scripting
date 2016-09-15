#!/bin/bash
MY_SHELL="bash"
echo "I like the $MY_SHELL shell."
echo "I am ${MY_SHELL}ing on my keyboard."

SERVER_NAME=$(hostname)
# old syntax: SERVER_NAME=`hostname`
echo "You are running this script on ${SERVER_NAME}"

# testing a condition

# file operators (tests)
# -d FILE true if file is a directory
# -e FILE true if file exists
# -f FILE true if file exists and it is a regular file
# -r FILE true if file is readable to you
# -s FILE true if file exists and it is not empty
# -w FILE true if file is writable to you
# -x FILE true if file is executable to you

# string operators (tests)
# -z STRING true if string is empty
# -n STRING true if string is not empty
# STRING1 = STRING2
# STRING1 != STRING2

# arithmetic operators
# arg1 -eq|-ne|-lt|-le|-gt|-ge arg2

# if statement
# if [ condition-is-true ]
# then
#   command....
# elif [ condition-is-true ]
# then
#   command N
# else
#   other command....
# fi

# it is a best practice to use quotes around variables to avoid side effects at tests
# the space is emportant at []
if [ "$MY_SHELL" = "bash" ]
then
  echo "You seem to like the bash shell"
elif [ "$MY_SHELL" = "csh"]
then
  echo "You seem to like csh shell"
else
  echo "You don't seem to like bash shell"
fi


# for loop
# for VARIABLE_NAME in ITEM_1 ITEM_N
# do
#   command 1
#   command 2
#   command N
# done
for COLOR in red green blue
do
  echo "COLOR: $COLOR"
done

# it is common practice to store the list in a variable
COLORS="red green blue"
for COLOR in $COLORS
do
  echo "COLOR: $COLOR"
done

# PICTURES=$(ls *.png)
# DATE=$(date +%F)
#
# for PICTURE in $PICTURES
# do
#   echo "Renaming ${PICTURE} to ${DATE}-${PICTURE}"
#   mv ${PICTURE} ${DATE}-${PICTURE}
# done


# positional parameters
# script.sh param1 param2 param3
# $0:"script.sh"
# $1:"param1"
# $2:"param2"
# $3:"param3"

# USER=$1
#
# echo "Executing script: $0"
# echo "Archiving user: $USER"
#
# tar cf /home/${USER}/Documents/${USER}.tar.gz /home/${USER}/Dropbox/Shell\ Scripting/01_first

# $@: all positional parameters
# for USER in $@ ...

# read from standard user input
# read -p "Enter a user name: " USER
# echo "Archiving user: $USER"

MSG="Shell Scripting is Fun!"
HOSTNAME=$(hostname)

echo "This script is running on ${HOSTNAME}"

if [ -e /etc/shadow ]
then
  echo "Shadow passwords are enabled"
fi

if [ -w /etc/shadow ]
then
  echo "You have permissions to edit /etc/shadow"
else
  echo "You do NOT have permissions to edit /etc/shadow"
fi

for ANIMAL in man bear pig dog cat
do
  echo "${ANIMAL}"
done

# read -p "Enter file or directory path: " PATH
# if [ -f $PATH ]
# then
#   echo "Regular file"
#   /bin/ls -l $PATH
# elif [ -d $PATH ]
# then
#   echo "Directory"
#   /bin/ls -l $PATH
# else
#   echo "Other type of file"
# fi

# PATH=$1
#
# if [ -f $PATH ]
# then
#   echo "Regular file"
#   /bin/ls -l $PATH
# elif [ -d $PATH ]
# then
#   echo "Directory"
#   /bin/ls -l $PATH
# else
#   echo "Other type of file"
# fi


for PATH in $@
do
  if [ -f $PATH ]
  then
    echo "Regular file"
    /bin/ls -l $PATH
  elif [ -d $PATH ]
  then
    echo "Directory"
    /bin/ls -l $PATH
  else
    echo "Other type of file"
  fi
done
