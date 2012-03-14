#!/bin/sh
DATE=`/bin/date '+%Y-%m-%d %H:%M:%S'`
echo "start watchting $1 ..."
sleep 2
cp -p $1 /tmp/file-watcher.tmp
clear
echo "[Refreshed date: $DATE] Ctrl-c to exit..."
echo ""
cat $1
while true
do
    if /bin/test /tmp/file-watcher.tmp -ot $1
    then
	clear
	DATE=`/bin/date '+%Y-%m-%d %H:%M:%S'`
	echo "[Refreshed date: $DATE] Ctrl-c to exit..."
	echo ""
	cat $1
	cp -p $1 /tmp/file-watcher.tmp
    fi
done
