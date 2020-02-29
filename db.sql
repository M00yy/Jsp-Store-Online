create database db;
use db;
create table category(
	id varchar(100) primary key,
	name varchar(100) unique not null,
	description varchar(255)
);
create table book(
	id varchar(100) primary key,
	name varchar(100) not null,
	author varchar(100),
	price float(8,2),
	photo varchar(100),
	description varchar(255),
	categoryId varchar(100),
	constraint categoryId_fk foreign key(categoryId) references category(id)
);
create table user(
	id varchar(100) primary key,
	username varchar(100) unique not null,
	nick varchar(100) not null,
	password varchar(100) not null,
	phonenum varchar(100) not null,
	address varchar(100) not null,
	email varchar(100) not null,
	code varchar(100) unique,
	actived bit(1)
);
create table orders(
	id varchar(100) primary key,
	ordersnum varchar(100) unique not null,
	num int,
	money float(8,2),
	createtime timestamp,
	status int,
	userId varchar(100),
	constraint userId_fk foreign key(userId) references user(id)
);
create table orders_item(
	id varchar(100) primary key,
	num int,
	price float(8,2),
	bookId varchar(100),
	ordersId varchar(100),
	constraint bookId_fk foreign key(bookId) references book(id),
	constraint ordersId_fk foreign key(ordersId) references orders(id)
);

create table manager(
	id varchar(100) primary key,
	username varchar(100) unique not null,
	password varchar(100),
	nick varchar(100)
);
