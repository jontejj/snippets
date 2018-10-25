#!/bin/sh
echo "$(hostname) waiting for job..."
env
item=$(redis-cli -h $REDIS_HOST -p $REDIS_PORT --pipe-timeout 0 blpop $QUEUE 0)
echo "Processing $item"
echo "Done"
#echo $item > worker.py