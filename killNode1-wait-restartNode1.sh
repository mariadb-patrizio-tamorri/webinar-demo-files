mysql -h 127.0.0.1 -P 3307 -u user -ppassword  mydatabase -e "create or replace table test (id integer)"
mysql -h 127.0.0.1 -P 3307 -u user -ppassword mydatabase -e "insert into test (id) values(1)"	
POD_ID=$(docker ps | grep mariadb_node_one | awk -F ' ' '{print $1}')
read -p "Press any key to resume ..."
docker stop $POD_ID
read -p "Press any key to resume ..."
mysql -h 127.0.0.1 -P 3307 -u user -ppassword mydatabase -e "insert into test (id) values(1)"	
#mysql -h 127.0.0.1 -P 3307 -u user -ppassword  mydatabase -e "create or replace table test (id integer)"
#mysql -h 127.0.0.1 -P 3307 -u user -ppassword mydatabase -e "insert into test (id) values($COUNTER)"	
sleep 10
docker start $POD_ID
read -p "Press any key to resume ..."
mysql -h 127.0.0.1 -P 3307 -u user -ppassword mydatabase -e "insert into test (id) values(1)"	