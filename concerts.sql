--/*Table structure for table tours */
create table tours
(
    tours_id serial
        constraint tours_pk
            primary key,
    title    varchar(100)
);


--/*Table structure for table artists */
create table artists
(
    artist_id serial
        constraint artists_pk
            primary key,
    name      varchar(100)
);


--/*Table structure for table venues */
create table venues
(
    venue_id      serial
        constraint venues_pk
            primary key,
    name          varchar(100) not null,
    isindoor      boolean not null,
    streetaddress varchar(100) not null,
    city          varchar(100) not null,
    state         varchar(100) not null,
    zipcode       integer not null,
    constraint venues_uk
        unique (streetaddress, city, state, zipcode)
);


--/*Table structure for table concerts */
create table concerts
(
    concert_id serial
        constraint concerts_pk
            primary key,
    title      varchar(100) not null,
    start      timestamp    not null,
    tour_id    integer default nextval('concerts_tour_id_seq'::regclass)
        constraint concerts_tours_tours_id_fk
            references tours,
    venue_id   serial
        constraint concerts_venues_venue_id_fk
            references venues,
    constraint concerts_uk
        unique (venue_id, start)
);


--/*Table structure for table sections */
create table sections
(
    section_id serial
        constraint sections_pk
            primary key,
    title      varchar(100) not null,
    venue_id   integer not null
        constraint sections_venues_venue_id_fk
            references venues
);


--/*Table structure for table seatlabels */
create table seatlabels
(
    label_id serial
        constraint seatlabels_pk
            primary key,
    label    varchar(100)
        constraint seatlabels_uk
            unique
);


--/*Table structure for table seats */
create table seats
(
    seat_id    serial
        constraint seats_pk
            primary key,
    title      varchar(20),
    maxticket  integer not null,
    section_id integer
        constraint seats_sections_section_id_fk
            references sections,
    venue_id   integer
        constraint seats_venues_venue_id_fk
            references venues
);


--/*Table structure for table seatdescriptions */
create table seatdescriptions
(
    seat_id  integer not null
        constraint seatdescription_seats_seat_id_fk
            references seats,
    label_id integer not null
        constraint seatdescription_seatlabels_label_id_fk
            references seatlabels,
    constraint seatdescription_pk
        primary key (seat_id, label_id)
);


--/*Table structure for table performers */
create table performerlists
(
    artist_id  integer not null
        constraint performerlists_artists_artist_id_fk
            references artists,
    concert_id integer not null
        constraint performerlists_concerts_concert_id_fk
            references concerts,
    "order"    integer,
    constraint performerlists_pk
        primary key (concert_id, artist_id)
);


--/*Table structure for table users */
create table users
(
    user_id  serial
        constraint users_pk
            primary key,
    username varchar(100)
        constraint users_uk
            unique,
    birthday date
);


--/*Table structure for table tickets */
create table tickets
(
    ticket_id  serial
        constraint tickets_pk
            primary key,
    price      double precision,
    barcode    varchar(20)
        constraint tickets_uk1
            unique,
    seat_id    integer
        constraint tickets___fk2
            references seats,
    concert_id integer
        constraint tickets_concerts_concert_id_fk
            references concerts,
    user_id    integer
        constraint tickets_fk3
            references users
);

--/*Data for the table artists */
insert into artists (artist_id, name)
values  (1, 'LA Phil'),
        (2, 'Taylor Swift'),
        (3, 'Kendrick Lamar'),
        (4, 'Drake');


--/*Data for the table concerts */
insert into concerts (concert_id, title, start, tour_id, venue_id)
values  (4, 'The Eras Tour night 1', '2023-08-03 20:00:00.000000', 2, 2),
        (2, 'Dudamel Leads Beethoven 9', '2024-09-10 16:30:00.000000', 1, 1),
        (1, 'What If?', '2026-07-01 22:00:00.000000', null, 2),
        (3, 'The Eras Tour night 2', '2023-08-04 20:00:00.000000', 2, 2);


--/*Data for the table performerlists */
insert into performerlists (artist_id, concert_id, order)
values  (3, 1, 1),
        (4, 1, 2),
        (2, 4, 1),
        (2, 3, 1),
        (1, 2, 1);


--/*Data for the table seatdescriptions */
insert into seatdescriptions (seat_id, label_id)
values  (3, 1),
        (4, 1),
        (2, 2),
        (2, 3);


--/*Data for the table seatlabels */
insert into seatlabels (label_id, label)
values  (1, 'obstructed viewing'),
        (2, 'accessible seating'),
        (3, 'in-seat attendant');


--/*Data for the table seats */
insert into seats (seat_id, title, maxticket, section_id, venue_id)
values  (3, 'A1', 1, 3, 1),
        (2, 'Box B', 10, 1, 1),
        (1, 'Box A', 10, 1, 1),
        (4, 'A2', 1, 3, 1),
        (5, '22', 22, 4, 2),
        (6, 'Evermore', 17, 6, 2),
        (7, 'End Game', 1, 5, 2),
        (8, 'Fortnight', 31, 7, 2);


--/*Data for the table sections */
insert into sections (section_id, title, venue_id)
values  (1, 'Lower Box', 1),
        (2, 'Upper Box', 1),
        (3, 'A', 1),
        (4, 'Red', 2),
        (5, 'Reputation', 2),
        (6, 'Evermore', 2),
        (7, 'TTPD', 2);


--/*Data for the table tickets */
insert into tickets (ticket_id, price, barcode, seat_id, concert_id, user_id)
values  (2, 200, 'A1B2C3D4E5F6G7H8I9J0', 1, 2, 2),
        (4, 200, 'P0Q1R2S3T4U5V6W7X8Y9', 1, 2, 1),
        (1, 50, 'J3K9L5M7N1P0Q2R4S6T8', 3, 2, 1),
        (3, 200, 'Z9Y8X7W6V5U4T3S2R1Q0', 1, 2, 1),
        (7, 350, 'G0H1I2J3K4L5M6N7O8P9', 8, 4, 3),
        (8, 420, 'F1E2D3C4B5A6Z7Y8X9W', 3, 1, 6),
        (6, 1200, 'K9L8M7N6O5P4Q3R2S1T0', 7, 4, 5),
        (5, 800, 'A3B2C1D4E5F6G7H8I9J0', 5, 3, 5);


--/*Data for the table tours */
insert into tours (tours_id, title)
values  (1, 'LA Phil Summer Season'),
        (2, 'The Eras Tour');


--/*Data for the table users */
insert into users (user_id, username, birthday)
values  (2, 'Emily Chen', '1995-06-05'),
        (3, 'Noah Ramirez', '2001-02-13'),
        (5, 'Ava Lee', '1979-10-29'),
        (6, 'Ethan Carter', '2005-03-12'),
        (7, 'Sofia Rodriguez', '1998-07-26'),
        (8, 'Liam Johnson', '1989-12-28'),
        (9, 'Olivia Brown', '1997-01-17'),
        (1, 'Alex Turner', '2004-11-12');


--/*Data for the table venues */
insert into venues (venue_id, name, isindoor, streetaddress, city, state, zipcode)
values  (1, 'The Hollywood Bowl', false, '2301 Highland Ave', 'Los Angeles', 'California', 90068),
        (2, 'SoFi Stadium', true, '1001 Stadium Dr', 'Inglewood', 'California', 90301);

