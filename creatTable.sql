create table usersTable(
	userId varchar(12) not null primary key,
	userPs varchar(12) not null,
);
create table goods(
	goodsId int not null primary key,
	goodsName varchar(50) not null,
	price decimal(6,2) not null ,
	stock int not null,
	book int
);

create table orders(
	orderid int not null primary key,
	userId varchar(12) not null,
	goodsId int not null,
	book int not null
);