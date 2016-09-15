#!/bin/bash

# Globbing expands the wildcard pattern into a list of files and/or directories
# *: matches zero of more characters
# ?: matches exactly one character
# [] : charcter class; matches exactly one character e.g. can[nt]* matches can,
#      candy, catch
# [!]: any of the characters NOT included between the brackets; matches exactly
#      one character; e.g. [!aeiou]* matches baseball, cricket because the
#      first character is not aeiou
# [a-g]*, [3-6]*: ranges
#
# pre-defined character classes:
# [[:alpha:]]
# [[:alnum:]]
# [[:digit:]]
# [[:lower:]]
# [[:space:]]
# [[:upper:]]
#
# \: escape character e.g. *\? matches all files that end with question mark
# don't create files with names containing * or ?


# ls v???????.sh
# variable.sh
# andras@andras-VirtualBox ~/Dropbox/Shell Scripting/01_first $ ls vari????.sh
# variable.sh
# andras@andras-VirtualBox ~/Dropbox/Shell Scripting/01_first $ ls vari????.*
# variable.sh
# andras@andras-VirtualBox ~/Dropbox/Shell Scripting/01_first $ ls [abv]ari????.*
# variable.sh
# andras@andras-VirtualBox ~/Dropbox/Shell Scripting/01_first $ ls [a-e]*
# exit_status.sh
# andras@andras-VirtualBox ~/Dropbox/Shell Scripting/01_first $ ls *[[:digit:]]*
# 2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-0b5e70d4c79358ce5c91f02193286e87.png
# 2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-2016-05-27-0fd11ff73ba5341ff796b5c7999f2fd5.png

for FILE in ./*.sh
do
  echo "Copying $FILE"
  cp $FILE /tmp
done

# shopt -s nullglob # enable nullglob shell option

# TODAY=$(date +%F)
# for FILE in ./*.jpg
# do   FILE_BASENAME=$(basename $FILE)
#   echo "Renaming $FILE to ${TODAY}-${FILE_BASENAME}"
#   mv $FILE "./${TODAY}-${FILE_BASENAME}"
# done

# shopt -u nullglob # disable nullglob shell option

PREFIX=$(date +%F)
# EXT="jpg"
read -p "Please enter a file extension: " EXT
read -p "Please enter a file prefix: (Press ENTER for ${PREFIX}) " PREFIX

for FILE in ./*.${EXT}
do
  FILE_BASENAME=$(basename $FILE)
  echo "Renaming ${FILE_BASENAME} to ${PREFIX}-${FILE_BASENAME}"
  mv $FILE "${PREFIX}-${FILE_BASENAME}"
done
