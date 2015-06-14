#!/bin/bash

adbparams=

while test $# -gt 0; do
    case $1 in
        -s )
            shift
            adbparams="$adbparams -s $1"
            ;;
        * ) break;;
    esac
    shift
done


. pretty-watch.sh

if test $? -ne 0; then
    echo "error happened when initializing context"
    exit 1
fi

if_flag --clear && echo "adb clean" && adb $adbparams logcat -c

adb $adbparams logcat | while read line
do
    if [ "$list" != "" ]; then
        # echo -n "filter $list"
        batch_test "$line" $list && continue
    fi

    batch_colorfy "$line" "" $skip_list && continue
    batch_colorfy "$line" -dim $dim_list && continue

    # echo "x $line"
       colorfy "${line:0:1}" ^E "$line" -red \
    && colorfy "${line:0:1}" ^W "$line" -yellow \
    && colorfy "${line:0:1}" ^I "$line" -green \
    && echo $line
done
