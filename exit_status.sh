# $? contains the return code of the previously executed command
ls /not/here
echo "$?"

HOST="google.com"
ping -c 1 $HOST
if [ "$?" -eq "0" ]
then
  echo "$HOST reachable"
else
  echo "$HOST unreachable"
fi


# && = AND the command only runs when the previous command succeeds (returns 0 status)
# mkdir /tmp/bak && cp text.txt /tmp/bak/

# || = OR the command only executes if the previous command fails; only one of the commands
# will be successfully executed
# cp text.txt /tmp/bak/ || cp test.txt /tmp

ping -c 1 $HOST && echo "$HOST reachable"
ping -c 1 $HOST || echo "$HOST unreachable"

# separate commands with ";" in the same line; exit status not checked; same as
# putting the commands in a separate line
# cp test.txt /tmp/bak ; cp test.txt /tmp

# explicitly define the return code
# exit 0
# exit 1
# ...
# exit 255
# the default value is that of the last command executed

# HOST="google.com"
# ping -c 1 $HOST
# if [ "$?" -ne "0" ]
# then
#   echo "$HOST unreachable"
#   exit 1
# fi
# exit 0

# echo "This script will exit with a 0 exit status"
# exit 0

# PATH=$1
# if [ -f $PATH ]
# then
#   exit 0
# elif [ -d $PATH ]
# then
#   exit 1
# else
#   exit 2
# fi

cat /etc/shadow
if [ $? -eq 0 ]
then
  echo "Command succeeded"
  exit 0
else
  echo "Command failed"
  exit 1
fi
