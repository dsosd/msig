#!/bin/bash

if [[ "$#" -ne "1" ]]; then
	>&2 echo "Incorrect argc"
	exit 1
fi

#setup aliases
shopt -s expand_aliases
. ~/.pub_aliases

#setup variables
FILE="$1"

./gen_msg.sh "$FILE"
./sign_msg.sh "$FILE".msg
