COUNTER=0
for i in $(docker ps | grep maxscale | awk -F ' ' '{print $1}') 
do 
	COUNTER=$[$COUNTER +1]
	if [ "$COUNTER" -eq "1" ]; then
		echo "Setting it to active"
		docker exec $i bash -c "echo -n \"Maxscale $COUNTER Setting Status: \"; maxctrl alter maxscale passive false"
	else 
		echo "Setting it to passive"
		docker exec $i bash -c "echo -n \"Maxscale $COUNTER Setting Status: \"; maxctrl alter maxscale passive true"
	fi
done
COUNTER=0
for i in $(docker ps | grep maxscale | awk -F ' ' '{print $1}') 
do 
	COUNTER=$[$COUNTER +1]
	docker exec $i bash -c "echo \"Maxscale $COUNTER Current Status:\"; maxctrl show maxscale | grep passive"
done
