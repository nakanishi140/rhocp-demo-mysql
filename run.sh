#!/bin/sh

run-mysqld &

sleep 20

mysql -u demo -pmysql -h localhost demo -e 'show tables like "demo";' | grep demo
if [ $? -ne 0 ]; then
  ./initialize.sh
fi

tail -f /dev/null
