# webOnJSP
1. You need build 3 table:
create table goods(
	goodsId int not null PRIMARY KEY, 
	goodsName varchar(50) not null,
	price decimal(6, 2) NOT NULL,
	stock int NOT NULL
)

CREATE TABLE orders(
	orderid int NOT NULL PRIMARY KEY,
	userId varchar(12) NOT NULL,
	goodsId int NOT NULL,
	book int NOT NULL
)

CREATE TABLE usersTable(
	userId varchar(12) NOT NULL,
	userPs varchar(12) NOT NULL
)
You can see other SQL file in project root

2. Download and install tomcat.
Run the startup in apache-tomcat\bin to install and init.
The zip on the root has complete lib.

3. In WebContent you can see some jsp or html code, this is all, run it, I have debug already.
