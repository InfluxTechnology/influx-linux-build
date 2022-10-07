#!/bin/sh

FILES=$(cat /data/mender/shared-files | grep -v "#" )
tar -czf /data/mender/archived-files.tgz $FILES 