create table ikon_users (
    user_id integer primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) unique not null,
    date_of_birth text,
    skill_level varchar(20) not null check (skill_level in ('Beginner', 'Intermediate', 'Advanced', 'Expert'))
);

create table ikon_resorts (
    resort_id integer primary key,
    name varchar(100) not null,
    location varchar(255) not null,
    elevation integer,
    total_trails integer
);

create table ikon_phone (
    phone_id integer primary key,
    entity_id integer not null,
    entity_type varchar(20) not null check (entity_type in ('User', 'Resort')),
    phone_number varchar(15) not null
);

create table ikon_address (
    address_id integer primary key,
    entity_id integer not null,
    entity_type varchar(20) not null check (entity_type in ('User', 'Resort')),
    street varchar(255) not null,
    city varchar(100) not null,
    state varchar(50) not null,
    zip_code varchar(20) not null
);

create table ikon_trails (
    trail_id integer primary key,
    resort_id integer not null,
    name varchar(100) not null,
    difficulty varchar(20) not null check (difficulty in ('Green', 'Blue', 'Black', 'Double Black')),
    length_km real,
    foreign key (resort_id) references ikon_resorts (resort_id)
);

create table ikon_rentals (
    rental_id integer primary key,
    user_id integer not null,
    equipment_type varchar(20) not null check (equipment_type in ('Ski', 'Snowboard', 'Boots', 'Helmet')),
    rental_date text not null,
    return_date text,
    cost real,
    foreign key (user_id) references ikon_users (user_id)
);

create table ikon_events (
    event_id integer primary key,
    resort_id integer not null,
    name varchar(100) not null,
    event_date text not null,
    description text,
    foreign key (resort_id) references ikon_resorts (resort_id)
);

create table ikon_lift_tickets (
    ticket_id integer primary key,
    user_id integer not null,
    resort_id integer not null,
    ticket_type varchar(20) not null check (ticket_type in ('Base', 'Session', 'Plus')),
    purchase_date text not null,
    price real,
    foreign key (user_id) references ikon_users (user_id),
    foreign key (resort_id) references ikon_resorts (resort_id)
);

create table ikon_weather_reports (
    report_id integer primary key,
    resort_id integer not null,
    report_date text not null,
    temperature_c real,
    snow_depth_cm integer,
    conditions varchar(20) not null check (conditions in ('Sunny', 'Cloudy', 'Snowing', 'Windy')),
    foreign key (resort_id) references ikon_resorts (resort_id)
);

create table ikon_reviews (
    review_id integer primary key,
    user_id integer not null,
    resort_id integer not null,
    rating integer check (rating >= 1 and rating <= 5),
    review_text text,
    review_date text not null,
    foreign key (user_id) references ikon_users (user_id),
    foreign key (resort_id) references ikon_resorts (resort_id)
);
