create table type_discount
(
    id integer primary key AUTO_INCREMENT,
    name_type varchar(7) not null
);

create table discounts
(
    id integer primary key AUTO_INCREMENT,
    type_discount_id integer not null references type_discount (id)
    description varchar(255) not null,
    image varchar(255) not null
);

create table type_product
(
    id integer primary key AUTO_INCREMENT,
    name varchar(10) not null
);

create table products
(
    id integer primary key AUTO_INCREMENT,
    name_product varchar(100) not null,
    type_product_id integer not null,
    price decimal(7,0) not null,
    description text null,
    rating decimal(1,1) not null,
    image varchar(255) not null,
    icon varchar(255) not null
);

create table haircuts
(
    id integer primary key AUTO_INCREMENT,
    name varchar(150) not null,
    price integer not null,
    icon varchar(255) null,
);

create table barber_position
(
    id integer primary key AUTO_INCREMENT,
    position varchar(12)
);

create table barbers
(
    id integer primary key AUTO_INCREMENT,
    name_barber varchar(20) not null,
    position_id integer not null,
    image varchar(255) not null unique,
    rating float(5) not null
);

create table free_days
(
    id integer primary key AUTO_INCREMENT,
    free_date date not null,
    free_time time not null
);

create table cities
(
    id integer primary key AUTO_INCREMENT,
    city varchar(45) not null,
);

create table branches
(
    id integer primary key AUTO_INCREMENT,
    city_id integer not null references cities (id),
    street varchar(100) not null,
    latitude float(20) not null,
    longitude float(20) not null,
    number_phone varchar(20) not null,
    working_mode varchar(20) not null,

);