COUNTER=0
for i in $(docker ps | grep maxscale | awk -F ' ' '{print $1}') 
do 
	COUNTER=$[$COUNTER +1]
	if [ "$COUNTER" -eq "1" ]; then
		docker exec $i bash -c "echo -n \"Maxscale $COUNTER Setting monitor_interval on monitor1 to new RANDOM value: \"; maxctrl alter monitor monitor1 monitor_interval $((3000 + RANDOM % 2000))ms"
		docker exec $i bash -c "echo \"Maxscale $COUNTER Current monitor_interval monitor1 new value: \"; maxctrl show monitors | grep monitor_interval"
	fi
done
sleep 5
COUNTER=0
for i in $(docker ps | grep maxscale | awk -F ' ' '{print $1}') 
do 
	COUNTER=$[$COUNTER +1]
	if [ "$COUNTER" -ne "1" ]; then
		docker exec $i bash -c "echo \"Maxscale $COUNTER Current monitor_interval monitor1 new value: \"; maxctrl show monitors | grep monitor_interval"
	fi
done
