#!/bin/bash -xev

# x stands for xtrace
# the commands that have + sign before are the ones that executed by the script
TEST_VAR="test"
echo "$TEST_VAR"

# + TEST_VAR=test
# + echo test
# test

# turn on debugging only for a portion
# set -x
# ....
# set +x

# -e = Exit on error (exit status != 0). Can be cobined with other
# options: -ex, -xe, -e -x, -x -e
# shebang -e
# FILE_NAME="/not/here"
# ls $FILE_NAME
# echo $FILE_NAME

# -v: prints shell input lines as they are read; can be combined with other
# options

# get help for the other options: help set | less

# DEBUG is not a built in variable, it is a naming convention only
DEBUG=true

if $DEBUG
then
  echo "Debug mode ON"
else
  echo "Debug mode OFF"
fi

$DEBUG && echo "Debug mode ON"

DEBUG=false
$DEBUG || echo "Debug mode OFF"

# disable a command if DEBUG is true
DEBUG=true
$DEBUG || echo "Debug mode OFF"

# another way to turn debugging on or OFF
DEBUG="echo"
$DEBUG ls

#DEBUG="echo"
$DEBUG ls

# debug function that displays everything passed by
function debug(){
  echo "Executing: $@"
  $@
}

debug ls

# PS4 is extended before each step in the exectution trace
# whenever a command under -x is executed the value of the PS4 variable is
# printed on the screen. The default value is '+'
# $BASH_SOURCE and $LINENO are built-in bash variables
PS4='+ $BASH_SOURCE :$LINENO:${FUNCNAME[0]}()'
TEST_VAR="test"
echo "$TEST_VAR"
