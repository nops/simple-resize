#!/bin/sh
# simple-resize | https://github.com/nops/simple-resize
#title        :simple-resize.sh
#description: :Main file
#author       :nops <https://github.com/nops>
#version      :0.1

source config.cfg

SR_TIME=`date`

SR_LOG=$SR_LOG_DIRECTORY'/sr.log'

SR_EFILE=$SR_LOG_DIRECTORY'/sr_error.log'

if [ ! -d "$SR_LOG_DIRECTORY" ]; then
    mkdir "$SR_LOG_DIRECTORY"
    touch $SR_LOG
    touch $SR_EFILE
    echo 'Creating directory: '$SR_LOG_DIRECTORY >> $SR_LOG
fi

if [ ! -f "$SR_LOG" ]; then
    touch $SR_LOG
fi

if [ ! -f "$SR_EFILE" ]; then
    touch $SR_EFILE
fi

echo 'Starting resize: '$SR_TIME >> $SR_LOG


for i in $(seq 0 $((${#$SR_SIZES[@]} - 1))); do
    convert -resize 28 $i thumb/$i;
done
