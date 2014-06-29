#!/bin/bash
. pretty-watch.sh

if test $? -ne 0; then
    echo "error happened when initializing context"
    exit 1
fi

if_flag --clear && echo "adb clean" && adb logcat -c

adb logcat | while read line
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
