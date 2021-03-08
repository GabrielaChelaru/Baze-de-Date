
--------------------------------------------------------
--   Table USERS_GAB.
--------------------------------------------------------
  CREATE TABLE users_CG 
   (	user_id number,
        nickname varchar2(25),
        hours_played number,
        vip_member char(3)
   );

SET DEFINE OFF;    
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (1, 'Arknous', 480, 'yes');
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (2, 'Texel997', 600, 'yes');
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (3, 'Ialiamoto', 200, 'yes');
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (4, 'Sirius', 350, 'no');
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (5, 'Azeroth', 700, 'yes');
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (6, 'LittleRaven5', 100, 'no');
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (7, 'Valerik', 120, 'no');
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (8, 'doomsayer', 250, 'yes');
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (9, 'valrob', 200, 'no');
Insert into users_CG (user_id, nickname, hours_played, vip_member) values (10, 'spink', 100, 'no');
 
   
alter table users_CG
add constraint user_CG_pk primary key(user_id);


-------Invoice-------
create table invoices_CG
    (
        invoice_id number not null,
        registration_id number,
        user_id number
    );
   
SET DEFINE OFF;    
insert into invoices_CG (invoice_id, registration_id, user_id) values(1, 4, 1);
insert into invoices_CG (invoice_id, registration_id, user_id) values(2, 4, 2);
insert into invoices_CG (invoice_id, registration_id, user_id) values(3, 4, 3);
insert into invoices_CG (invoice_id, registration_id, user_id) values(4, 7, 1);
insert into invoices_CG (invoice_id, registration_id, user_id) values(5, 8, 4);
insert into invoices_CG (invoice_id, registration_id, user_id) values(6, 1, 9);
insert into invoices_CG (invoice_id, registration_id, user_id) values(7, 9, 6);
insert into invoices_CG (invoice_id, registration_id, user_id) values(8, 3, 3);
insert into invoices_CG (invoice_id, registration_id, user_id) values(9, 3, 8);
insert into invoices_CG (invoice_id, registration_id, user_id) values(10, 6, 6);


alter table invoices_CG
add constraint invoice_id_CG_pk primary key(invoice_id);


-------Online Store------
create table online_store_CG
    (
        registration_id number not null,
        game_id number,
        publisher_id number,
        registration_date date not null,
        price number(6,2),
        discount number(2,2)
    );
    
SET DEFINE OFF;    
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(1, 14, 9, to_date('04-02-2016', 'dd-mm-yyyy'), 25, 0.2);
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(2, 1, 1, to_date('20-09-2013', 'dd-mm-yyyy'), 59.99, 0.37);
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(3, 3, 2, to_date('30-10-2017', 'dd-mm-yyyy'), 40.00, 0.23);
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(4, 4, 2, to_date('27-10-2014', 'dd-mm-yyyy'), 20.00, 0.30);
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(5, 6, 3, to_date('20-09-2016', 'dd-mm-yyyy'), 37.00, 0.25);
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(6, 9, null, to_date('20-05-2009', 'dd-mm-yyyy'), 15.00, null);
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(7, 7, 4, to_date('27-10-2009', 'dd-mm-yyyy'), null, null);
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(8, 11, 6, to_date('31-03-1998', 'dd-mm-yyyy'), 0.00, null);
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(9, 12, 6, to_date('28-07-2010', 'dd-mm-yyyy'), 0, null);
insert into online_store_CG (registration_id, game_id, publisher_id, registration_date, price, discount) values(10, 13, 6, to_date('23-11-2004', 'dd-mm-yyyy'), 59.99, 0.1);
    
alter table online_store_CG
add constraint registration_id_CG_pk primary key(registration_id);


--------Games---------
create table games_CG
    (
        game_id number not null,
        title varchar2(40),
        publisher_id number,
        release_date date not null,
        genre varchar2(20),
        multiplayer varchar2(3)
    );
    
SET DEFINE OFF;    
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(1, 'GTA 5', 1, to_date('17-09-2013', 'dd-mm-yyyy'), 'action rpg', 'yes');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(2, 'Red Dead Redemption 2', 1, to_date('26-10-2018', 'dd-mm-yyyy'), 'action adventure', null);
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(3, 'Assassin Creed Origins', 2, to_date('27-10-2017', 'dd-mm-yyyy'), 'stealth action', null);
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(4, 'Watch Dogs', 2, to_date('27-05-2014', 'dd-mm-yyyy'), 'action adventure', 'no');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(5, 'Assassin Creed Odyssey', 2, to_date('05-05-2018', 'dd-mm-yyyy'), 'stealth action', 'no');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(6, 'Witcher 3', 3, to_date('19-05-2015', 'dd-mm-yyyy'), 'rpg adventure', 'no');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(7,'League of Legends', 4, to_date('27-10-2009', 'dd-mm-yyyy'), 'MOBA', 'yes');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(8, 'Asphalt 8', 5, to_date('22-08-2013', 'dd-mm-yyyy'), 'Racing', 'yes');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(9, 'Minecraft', null, to_date('17-05-2009', 'dd-mm-yyyy'), 'sandbox', null);
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(10, 'World of Warcraft Classic', 6, to_date('26-08-2019', 'dd-mm-yyyy'), 'MMORPG', 'yes');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(11, 'StarCraft', 6, to_date('31-03-1998', 'dd-mm-yyyy'), 'Strategy', 'yes');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(12, 'StarCraft 2', 6, to_date('27-07-2010', 'dd-mm-yyyy'), 'Strategy', 'yes');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(13, 'World of Warcraft', 6, to_date('23-11-2004', 'dd-mm-yyyy'), 'MMORPG', 'yes');
insert into games_CG (game_id, title, publisher_id, release_date, genre, multiplayer) values(14, 'Naruto Ultimate Ninja Storm', 9, to_date('04-02-2016', 'dd-mm-yyyy'), 'fighting', 'no');

    
alter table games_CG
add constraint game_id_CG_pk primary key(game_id);

--------Publishers--------
create table publishers_CG
    (
        publisher_id number not null,
        location_id number,
        start_colaboration_date date not null,
        origin_country varchar2(25),
		name varchar2(30)
    );
 
SET DEFINE OFF;    
insert into publishers_CG (publisher_id, location_id, start_colaboration_date, origin_country, name) values(1, 1, to_date('21-03-2000', 'dd-mm-yyyy'), 'USA', 'Rockstar Games');
insert into publishers_CG (publisher_id, location_id, start_colaboration_date, origin_country, name) values(2, 2, to_date('15-06-2008', 'dd-mm-yyyy'), 'Canada', 'Ubisoft');
insert into publishers_CG (publisher_id, location_id, start_colaboration_date, origin_country, name) values(3, 3, to_date('11-11-2011', 'dd-mm-yyyy'), 'Poland', 'CD Projekt Red');
insert into publishers_CG (publisher_id, location_id, start_colaboration_date, origin_country, name) values(4, 4, to_date('23-12-2007', 'dd-mm-yyyy'), 'USA', 'Riot');
insert into publishers_CG (publisher_id, location_id, start_colaboration_date, origin_country, name) values(5, 2, to_date('17-02-2014', 'dd-mm-yyyy'), 'France', 'Gameloft');
insert into publishers_CG (publisher_id, location_id, start_colaboration_date, origin_country, name) values(6, 5, to_date('02-10-1998', 'dd-mm-yyyy'), 'USA', 'Blizzard');
insert into publishers_CG (publisher_id, location_id, start_colaboration_date, origin_country, name) values(7, 6, to_date('15-09-2006', 'dd-mm-yyyy'), null, 'King');
insert into publishers_CG (publisher_id, location_id, start_colaboration_date, origin_country, name) values(8, 7, to_date('15-06-2004', 'dd-mm-yyyy'), null, 'Amber');
insert into publishers_CG (publisher_id, location_id, start_colaboration_date, origin_country, name) values(9, 8, to_date('27-12-2013', 'dd-mm-yyyy'), 'Japan', 'Bandai'); 
    
alter table publishers_CG
add constraint publisher_id_CG_pk primary key(publisher_id);

-------Locations--------
create table locations_CG
    (
        location_id number not null,
        country varchar2(25),
        city varchar2(25)

    );
    
SET DEFINE OFF;    
insert into locations_CG (location_id, country, city) values(1, 'USA', 'New York');
insert into locations_CG (location_id, country, city) values(2, 'France', 'Paris');
insert into locations_CG (location_id, country, city) values(3, 'Poland', 'Warsaw');
insert into locations_CG (location_id, country, city) values(4, 'USA', 'Los Angeles');
insert into locations_CG (location_id, country, city) values(5, 'USA', 'California');
insert into locations_CG (location_id, country, city) values(6, 'Malta', null);
insert into locations_CG (location_id, country, city) values(7, 'Romania', 'Bucharest');
insert into locations_CG (location_id, country, city) values(8, 'Japan', 'Tokyo');
    
alter table locations_CG
add constraint location_id_CG_pk primary key(location_id);



-----------Foreign keys---------------

--------Here I created foreign keys for Invoices table-------
alter table invoices_CG
add constraint user_id_CG_fk foreign key(user_id) REFERENCES users_CG (user_id)
on delete cascade;

alter table invoices_CG
add constraint registration_id_CG_fk foreign key(registration_id) references online_store_CG (registration_id)
on delete cascade;

------Here I created foreign keys for Online Store table-------
alter table online_store_CG
add constraint game_id_CG_fk foreign key(game_id) references games_CG(game_id)
on delete cascade;

alter table online_store_CG
add constraint publisher_id_CG_fk foreign key(publisher_id) references publishers_CG(publisher_id)
on delete cascade;

------Here I created foreign keys for Games table-------

alter table games_CG
add constraint games_publisher_id_CG_fk foreign key(publisher_id) references publishers_CG(publisher_id)
on delete cascade;

------Here I created foreign keys for Publishers table-------

alter table publishers_CG
add constraint location_id_CG_fk foreign key(location_id) references locations_CG(location_id)
on delete cascade;

commit;