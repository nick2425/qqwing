#!/bin/sh

set -e
set -o pipefail

test/helper/solve.sh $0 \
    "29...3.7..5......2....1..5.....62.....35.9...........4..71...3.164.2......9.76..." \
    "291653478358947162746218359975462813413589726682731594827194635164325987539876241"
