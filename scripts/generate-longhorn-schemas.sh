#!/bin/bash
set -e -x

usage()
{
   echo "Usage: $0 <url_to_schema>"
   exit 1
}

cd $(dirname $0)/../generator

URL_BASE='http://localhost:8080'

if [ "$#" -gt 1 ]
then
  usage
fi

if [ "$1" != "" ]; then
    URL_BASE=$1
fi

source ../scripts/common_functions

gen "${URL_BASE}/v1" longhorn rename

rm -rf ../longhorn/*.go-e

echo Success
