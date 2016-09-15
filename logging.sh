#!/bin/bash
# default user.notice messages

logger "Message"
logger -p local0.info "Message" # facility.severity
logger -t myscript -p local0.info "Message" # tag the message typically with the name of the script
logger -i -t myscript "Message" # include the PID in the message
logger -s -p local0.info "Message" # display message on the screen in addition to the logging system

# handling logging
# parameters: log_level, message
function logit(){
  local LOG_LEVEL=$1
  shift # shift the positional parameters to the left
  MSG=$@
  TIMESTAMP=$(date +"%Y-%m-%d %T")
  if [ $LOG_LEVEL = 'ERROR' ] || $VERBOSE
  then
    echo "${TIMESTAMP} ${HOST} ${PROGRAM_NAME} [${PID}]: ${LOG_LEVEL} ${MSG}"
  fi
}

function my_logging(){
  local LOG_LEVEL=$1
  local MESSAGE=$2
  logger -s -i -t $RANDOM user.${LOG_LEVEL} $MESSAGE
}

logit INFO "Processing data."

logger -p user.info $RANDOM # facility.severity
my_logging info "my message"
