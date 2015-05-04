#!/usr/bin/env awk -f

/send/ { print "\033[92m" $0 "\033[0m"; next; }
/receive/ { print "\033[91m" $0 "\033[0m"; next; }
/./ { print $0 }
