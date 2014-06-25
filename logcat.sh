#!/bin/bash
. pretty-watch.sh

adb logcat | while read line
do
    batch_colorfy "$line" "" $skip_list && continue
    batch_colorfy "$line" -dim $dim_list && continue

    # echo "x $line"
       colorfy "${line:0:1}" ^E "$line" -red \
    && colorfy "${line:0:1}" ^W "$line" -yellow \
    && echo $line
done
