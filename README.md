pretty-watch
============

view adb logcat with pretty color

## USAGE ##

in bash/zsh environment

##### adb logcat

> $ chmod +x ./logcat.sh

> $ ./logcat.sh

## BEHAVIOUR ##

1.  skip line matches keyword in skip list, default is empty
2.  dim line matches keyword in dim list, default is empty
3.  if line start with E ( match ``grep ^E`` ), print in red color
3.  if line start with W ( match ``grep ^W`` ), print in yellow color
3.  otherwise, print line in default color


## PARAMS ##

> -c | --clear    : run adb logcat -c at begining

> -d | --dim      : add (grep) keyword to dim list, line will be colored dim/black 

> -s | --skip     : add (grep) keyword to skip list, line will be skipped

> <postpend params> : if provided, script will run in positive mode, which filter postpend array out first

## EXAMPLE ##

> $ ./logcat.sh -c -s ^T -s ^I -d SocketStream

will

1.  run adb logcat -c at beginning
2.  skip T(Trace) log
3.  skip I(Info) log
4.  when line contains "SocketStream", dim it
5.  print ^E in red, ^W in yellow, others in default color

> $ ./logcat.sh asi

will

1. fliter line contians asi, skip the other
2. print ^E in red, ^W in yellow, others in default color

## modify at your convenience :) ##
