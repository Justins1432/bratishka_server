create table haircuts(
    id integer primary key AUTO_INCREMENT,
    name varchar(150) not null,
    price integer not null,
    icon varchar(255) null
);

create table type_message(
    id integer primary key AUTO_INCREMENT,
    name varchar(10) not null
);

create table messages(
    id integer primary key AUTO_INCREMENT,
    type_id integer not null,
    name varchar(45) not null,
    image varchar(255) not null,
    foreign key (type_id) references type_message (id) on delete cascade on update cascade
);

create table cities(
    id integer primary key AUTO_INCREMENT,
    city varchar(30) not null
);

create table branches(
    id integer primary key AUTO_INCREMENT,
    street varchar(50) not null,
    city_id integer not null,
    latitude double not null,
    longitude double not null,
    number_phone varchar(16) not null,
    working_mode varchar(40) not null,
    foreign key (city_id) references cities (id) on delete cascade on update cascade
);

create table positions(
    id integer primary key AUTO_INCREMENT,
    position varchar(15) not null
);

create table barbers(
    id integer primary key AUTO_INCREMENT,
    position_id integer not null,
    name varchar(15) not null,
    rating double not null,
    image varchar(255) not null,
    branch_id integer not null,
    foreign key (position_id) references positions (id) on delete cascade on update cascade,
    foreign key (branch_id) references branches (id) on delete cascade on update cascade
);

create table types_product(
    id integer primary key AUTO_INCREMENT,
    type varchar(10) not null
);

create table products(
    id integer primary key AUTO_INCREMENT,
    name varchar(100) not null,
    type_id integer not null,
    price decimal(7,0) not null,
    description text not null,
    rating double not null,
    image varchar(255) not null,
    icon varchar(255) not null,
    foreign key (type_id) references types_product (id) on delete cascade on update cascade
);

create table free_times(
    id integer primary key AUTO_INCREMENT,
    day date not null,
    time_s time not null
);

create table branch_free_times_list(
    id integer primary key AUTO_INCREMENT,
    branch_id integer not null,
    free_time_id integer not null,
    foreign key (branch_id) references branches (id) on delete cascade on update cascade,
    foreign key (free_time_id) references free_times (id) on delete cascade on update cascade
);

create table basket(
    id integer primary key AUTO_INCREMENT,
    image varchar(255) not null,
    product varchar(100) not null,
    type_product varchar(10) not null,
    count_product integer not null,
    price decimal(7,0) not null
);

create table users(
    id integer primary key AUTO_INCREMENT,
    surname varchar(100) null,
    name varchar(100) null,
    fathername varchar(100) null,
    email varchar(100) not null unique,
    date_birth date null,
    city varchar(40) null,
    number_phone varchar(16) null unique,
    password varchar(255) null,
    image varchar(255) null,
    basket_id integer null,
    foreign key (basket_id) references basket (id) on delete cascade on update cascade
);

create table record(
    id integer primary key AUTO_INCREMENT,
    date_record date not null,
    user_id integer not null,
    branch_id integer not null,
    haircut_id integer not null,
    free_times_id integer not null,
    barber_id integer not null,
    promocode varchar(50) null,
    foreign key (user_id) references users (id) on delete cascade on update cascade,
    foreign key (branch_id) references branches (id) on delete cascade on update cascade,
    foreign key (haircut_id) references haircuts (id) on delete cascade on update cascade,
    foreign key (free_times_id) references branch_free_times_list (id) on delete cascade on update cascade,
    foreign key (barber_id) references barbers (id) on delete cascade on update cascade
);

create table times_for_live_queue(
    id integer primary key AUTO_INCREMENT,
    t_times time not null
);

create table live_queue(
    id integer primary key AUTO_INCREMENT,
    date_record date not null,
    user_id integer not null,
    branch_id integer not null,
    haircut_id integer not null,
    time_id integer not null,
    promocode varchar(50) null,
    foreign key (user_id) references users (id) on delete cascade on update cascade,
    foreign key (branch_id) references branches (id) on delete cascade on update cascade,
    foreign key (time_id) references times_for_live_queue (id) on delete cascade on update cascade,
    foreign key (haircut_id) references haircuts (id) on delete cascade on update cascade
);

create table users_code(
    id integer primary key AUTO_INCREMENT,
    email varchar(40) not null unique,
    code varchar(4) not null
);

/**/