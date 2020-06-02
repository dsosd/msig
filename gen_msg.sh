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

OUT_FILE="$FILE.msg"

rm "$OUT_FILE"
echo $(gen_uuid) >>"$OUT_FILE"
echo >>"$OUT_FILE"

cat "$FILE" >>"$OUT_FILE"

echo >>"$OUT_FILE"
echo $(gen_uuid) >>"$OUT_FILE"
