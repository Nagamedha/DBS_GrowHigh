node_modules needs to be added before you run AngularOMS in front end.
Just clone this DBS_growHigh Repository.
and you connect mariadb from dbeaver - db.sql script you can use
Add db to your backend, intellij - springboot
run main SpringBootWebOmsApplication.java to start backened then
you run your front end, ensure node_modules is there, use npm install command in your angular terminal to start frontend
localhost url will be generated , you can click on it to visit your application.
Make sure all connections and APi's are working else debug, test.


execution:
brew services start mariadb
dbs database should be there and all tables and stored procedures and data in tables should be there
run your main - resources - application.properties file in springboot
then Angualr terminal do "npm start"
click on localhost url and login page will be shown.
Make sure all configurations ,emails, properties, connections are intact for this to work
