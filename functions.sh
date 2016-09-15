#!/bin/bash
GLOBAL_VAR=1 # also available in the functions

function hello(){
  echo "Hello $1" # $1 is a positional parameter; $0 is the scrpt's name
  now
}

function hello_all(){
  for NAME in $@
  do
    echo "Hello $NAME"
  done
}

# don't put "hello" here; the script is not pre-compiled; it is a best practice
# to put all function definition at the top of the script

function now(){
  echo "It's $(date +%r)"
}

hello Andras
hello_all Jason Dan Ryan Johnson

# exit status of the last function
now
echo $?


function backup_file() {
  if [ -f $1 ]
  then
    # local: the variable is local to the function
    # basename: returns any directory components and returns just the file name
    # $$: process id whish is different every time I start the script
    local BACK="/tmp/$(basename ${1}).$(date +%F).$$"
    echo "Backing up $1 to ${BACK}"

    # The exit status of the function will be the exit status of the cp command
    cp $1 $BACK
  else
    # The file does not exist
    return 1
  fi
}

backup_file /etc/hosts

if [ $? -eq 0 ]
then
  echo "Backup succeeded!"
else
  echo "Backup failed!"
  # return non-zero exit status
  exit 1
fi

function file_count(){
  # echo "The current directory contains $(ls | wc -l) files"
  local DIR=$1
  echo "$DIR:"
  echo $(ls $DIR | wc -l)
}

file_count /etc
file_count /var
file_count /usr/bin
