#!/bin/sh
redis-cli -h $REDIS_HOST -p $REDIS_PORT rpush $QUEUE "Hello World from $(hostname) $(date)"
env