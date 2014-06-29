#!/bin/bash
. libs/cfont.sh

dim_list=""
skip_list=""
list=""
flags=""

function colorfy() {
    if grep -q $2 <<<$1; then
        if [ "$4" == "" ]; then return 1; fi
        cfont $4
        echo $3
        cfont -reset
        return 1
    fi
}

function batch_test() {
    line=$1
    shift
    while test $# -gt 0; do
        grep -q $1 <<< $line && shift && continue
        return 0
    done
    return 1
}

function batch_colorfy() {
    line=$1
    color=$2
    shift;shift
    while test $# -gt 0; do
        colorfy "$line" "$1" "$line" $color && shift && continue
        return 0
    done
    return 1
}

function if_flag() {
    grep -q "|$1" <<< $flags && return 0
    return 1
}

while test $# -gt 0; do
    case "$1" in
        -c | --clear )
            flags=$flags"|--clear"
        ;;
        -d | --dim )
            shift
            dim_list=$dim_list" $1"
        ;;
        -s | --skip )
            shift
            skip_list=$skip_list" $1"
        ;;
        * )
            list=$list" "$1
        ;;
    esac
    shift
done
