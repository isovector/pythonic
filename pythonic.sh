#!/bin/sh

FILENAME=/tmp/programming.py

touch $FILENAME
scite $FILENAME &
inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w %f' \
-e close_write $FILENAME | while read date time dir file; do
    FILECHANGE=${dir}${file}
    clear
    python2 $FILECHANGE &
    PID=$!
    sleep 1s && kill $PID 2> /dev/null
done
