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

OUT_FILE="$FILE".sig

rm "$OUT_FILE"

CRC32=$(crc32 "$FILE")
MD5=$(md5sum "$FILE" | grep -o "^[0-9a-f]*")
SHA1=$(sha1sum "$FILE" | grep -o "^[0-9a-f]*")
SHA256=$(sha256sum "$FILE" | grep -o "^[0-9a-f]*")
SHA3=$(sha3sum "$FILE" | grep -o "^[0-9a-f]*")

echo "CRC-32: $CRC32" >>"$OUT_FILE"
echo "MD5: $MD5" >>"$OUT_FILE"
echo "SHA-1: $SHA1" >>"$OUT_FILE"
echo "SHA-256: $SHA256" >>"$OUT_FILE"
echo "SHA-3: $SHA3" >>"$OUT_FILE"
