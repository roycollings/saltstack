#!/usr/bin/env bash
#
# This will run all test files in the folder specified.
#
# NOTE: copy to a local folder (i.e. ~/bin) and make it executable: `chmod u+x <filename>`

BOLD='\033[0;1m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ENDCOLOR='\033[0m'

IGNORE="^(?!.*@quarantine)"
DEPTHLIMIT="-maxdepth 1"

while getopts "rq" opt
do
  case "$opt" in
    r) DEPTHLIMIT="";;
    q) IGNORE="";;
  esac
done

FOLDERS=$(echo "$@" | awk -v OPTIND=$OPTIND '{for (i=OPTIND; i<=NF; i++) print $i}')

if [ "$FOLDERS" = "" ]
then
  printf "\e
Syntax: $0 ${BOLD}[-rq] <folder1> <folder2> ... <folderN>${ENDCOLOR}

  ${BOLD}-f${ENDCOLOR}	Folder to start search.
  ${BOLD}-r${ENDCOLOR}	Recursive search through all subfolders.
  ${BOLD}-q${ENDCOLOR}	Include quarantined tests.

"
  exit 1
fi

for FOLDER in "$(echo $FOLDERS)"
do
  find $FOLDER $DEPTHLIMIT -name '*.test.[tj]s' | while read TESTFILE
  do
    TAG="$(grep '@S' $TESTFILE | sed -e 's/.*\(@S[a-zA-Z0-9]*\).*/\1/')"

    printf "Running $(basename $TESTFILE) ($TAG) ... "

    (npm run pw -- --grep "(?=.*$TAG)$IGNORE" --profile sus1) >/dev/null 2>&1

    [ $? -eq 0 ] && printf "\e${GREEN}OK${ENDCOLOR}\n" || printf "\e${RED}FAILED${ENDCOLOR}\n"
  done
done
