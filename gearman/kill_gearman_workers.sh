#ghet gearman parent pid from /var/www/gdgt/app/config/gearmanager.pid

GEARMANPID=`cat /var/www/gdgt/app/config/gearmanmanager.pid

for i in `ps -fo pid --ppid $GEARMANPID` 
do 

echo kill -9 $i

done 
