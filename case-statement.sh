# patterns are case sensitive
#
# case "$VAR" in
#   pattern_1)
#     # commands go here
#     ;;
#   pattern_n)
#     # commands go here
#     ;;
#   *)
#     # default command
#     ;;
# esac

# case "$1" in
#   start|START) # lowercase or uppercase, multiple pattern matching using pipe
#     echo "Starting process"
#     ;;
#   stop|STOP)
#     echo "Stopping process"
#     ;;
#   *)
#     echo "Usage: $0 start|stop" ; exit 1
#     ;;
# esac
#
#
# read -p "Enter y or n: " ANSWER
# case "$ANSWER" in
#   [yY]|[yY][eE][sS])
#     echo "You answered yes"
#     ;;
#   [nN]|[nN][oO])
#     echo "You answered no"
#     ;;
#   *)
#     echo "Invalid answer"
#     ;;
# esac
#
#
# read -p "Enter y or n: " ANSWER
# case "$ANSWER" in
#   [yY]*)
#     echo "You answered yes"
#     ;;
#   *)
#     echo "You answered something else"
#     ;;
# esac


case "$1" in
  start|START) # lowercase or uppercase, multiple pattern matching using pipe
    /tmp/sleepwalkingserver &
    ;;
  stop|STOP)
    kill $(cat /tmp/sleepwalkingserver.pid)
    ;;
  *)
    echo "Usage: $0 start|stop" ; exit 1
    ;;
esac
