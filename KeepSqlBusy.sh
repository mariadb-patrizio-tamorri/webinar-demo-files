#!/bin/bash

mysql -h 127.0.0.1 -P 3307 -u user -ppassword  mydatabase -e "create or replace table test (id integer)"

COUNTER=0
while :
do
    COUNTER=$[$COUNTER +1]
    mysql -h 127.0.0.1 -P 3307 -u user -ppassword mydatabase -e "insert into test (id) values($COUNTER)"	
	mysql -h 127.0.0.1 -P 3307 -u user -ppassword mydatabase -e "select max(id) from test"	
	mysql -h 127.0.0.1 -P 3307 -u user -ppassword mydatabase -e "select sleep(1)"	
	sleep 1
done