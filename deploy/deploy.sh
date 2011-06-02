#webserver deploy
#run as deploy user

cd /var/www.gdgt
git fetch

git co app/lib/AppController.php
git co <tag>
make cc
#expect rm -Rf ./tmp/*
./present migrate
#expect Database schema is up to date. HOORJ!

cd /app/web/css
wget "http://beta.gdgt.com/css/master.css

mv master.css master_<tag>.css
cd /var/www/gdgt/app/lib

#now edit the AppController.php file as follows
#find ViewQueue::queueStylesheet('master'); and replace with
# ViewQueue::queueStylesheet('master_<tag>');
sed /summat/summatelse

cd /var/www/gdgt
make cc




#gearman deploy as web

cd /var/www/gdgt
git fetch

make workers-stop
#ps aux | grep gear
make cc
git co 2.0b40
make workers
#ps auz | grep gear


#sphinx

cd /var/www/gdgt
git fetch
make cc
git co <tag>
make sphinx-all
#output output


#cache

