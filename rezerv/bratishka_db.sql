create table type_discount
(
    id integer primary key AUTO_INCREMENT,
    name_type varchar(7) not null
);

create table discounts
(
    id integer primary key AUTO_INCREMENT,
    type_discount_id integer not null references type_discount (id),
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
    icon varchar(255) null
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
    city varchar(45) not null
);

create table branches
(
    id integer primary key AUTO_INCREMENT,
    city_id integer not null,
    street varchar(100) not null,
    latitude float(20) not null,
    longitude float(20) not null,
    number_phone varchar(20) not null,
    working_mode varchar(20) not null,
    foreign key(city_id) references cities (id) on delete cascade on update cascade
);

create table branch_barber_list (
	id integer PRIMARY KEY AUTO_INCREMENT,
    branch_id integer not null,
    barber_id integer not null
);

create table branch_product_list
(
    id integer primary key AUTO_INCREMENT,
    branch_id integer not null references branches (id),
    product_id integer not null references products (id)
);

create table branch_free_day_list
(
    id integer primary key AUTO_INCREMENT,
    branch_id integer not null ,
    free_day_id integer not null
);

create table branch_info_id (
    id integer primary key AUTO_INCREMENT,
    branch_id integer not null,
    free_days_branches_id integer not null,
    barbers_branch_id integer not null
);

create table record_appointment
(
    id integer primary key AUTO_INCREMENT,
    date_record date not null,
    haircut varchar(30) not null,
    branch_id integer not null,
    free_day_id integer not null,
    barber_id integer not null,
    price decimal(7, 0) not null,
    promocode varchar(25) null
);

create table past_record
(
    id integer primary key AUTO_INCREMENT,
    date_past_record date not null,
    branch_id integer not null,
    barber_id integer not null,
    free_day_id integer not null,
    price decimal(7,0) not null
);

create table basket
(
    id integer primary key AUTO_INCREMENT,
    image varchar(255) not null,
    name_product varchar(100) not null,
    price decimal(7,0) not null,
    count integer not null
);


create table time_for_live_queue (
    id integer primary key AUTO_INCREMENT,
    time_live_queue time not null
);


create table live_queue
(
    id integer primary key AUTO_INCREMENT,
    date_record date not null,
    branch_id integer not null,
    time_record integer not null,
    haircut_id integer not null,
    price decimal(7,0) not null,
    promocode varchar(35) null
);

create table records
(
    id integer primary key AUTO_INCREMENT,
    recorde_date date not null,
    upcoming_records integer not null,
    past_records integer not null
);

create table users
(
    id integer primary key AUTO_INCREMENT,
    surname varchar(50) null,
    name varchar(50) null,
    fathername varchar(50) null,
    email varchar(100) null unique,
    date_birth date null,
    city varchar(30) null,
    number_phone varchar(20) not null,
    password varchar(255) not null,
    code varchar(5) null,
    image varchar(255) null,
    record_id integer null,
    basket_id integer null
);


drop table cities;
drop table branches;
drop table basket;
drop table barber_position;
drop table branch_barber_list;
drop table branch_free_day_list;
drop table branch_product_list;
drop table discounts;
drop table free_days;
DROP TABLE haircuts;
drop table live_queue;
drop table past_record;
drop TABLE records;
drop table record_appointment;
drop TABLE time_for_live_queue;
drop TABLE type_product;
drop TABLE type_product;
DROP TABLE users;






