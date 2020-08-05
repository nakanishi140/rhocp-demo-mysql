#!/bin/sh

run-mysqld &

sleep 10

if [ ! -d /var/lib/mysql/data/mysql ]; then
 ./initialize.sh
fi

tail -f /dev/null
