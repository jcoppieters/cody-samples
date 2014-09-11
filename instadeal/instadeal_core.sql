use instadeal;

drop table if exists `categories`;
create table `categories` (
    `id` int not null auto_increment,
    `name` varchar(128) not null,
    primary key(`id`)
) default charset=utf8;

insert into `categories` values(1, 'Entertainment');
insert into `categories` values(2, 'Beauty & Wellness');
insert into `categories` values(3, 'Horeca');

drop table if exists `locations`;
create table `locations` (
    `id` int not null auto_increment,
    `region` varchar(128) not null default '',
    primary key(`id`)
) default charset=utf8;

insert into `locations` values(1, 'Gent');


drop table if exists `companies`;
create table `companies` (
    `id` int not null auto_increment,
    `name` varchar(128) not null,
    `btw` varchar(128) not null default '',
    `image_ext` varchar(128) not null default '',
    `description` varchar(255) not null default '',
    `user_id` int not null unique,
    `location_id` int not null,
    `category_id` int not null,
    primary key(`id`)
) default charset=utf8;

drop table if exists `buyers`;
create table `buyers` (
    `id` int not null auto_increment,
    `name` varchar(128) not null,
    `family_name` varchar(128) not null,
    `user_id` int not null unique,
    primary key(`id`)
) default charset=utf8;

replace into `users` values
    (10,'koper@gmail.com','Koper','password','buyer',50,0,99,'Y','koper@gmail.com','','N',0),
    (11,'tim@gmail.com','Acek','password','buyer',50,0,99,'Y','tim@gmail.com','','N',0),
    (12,'verkoper@gmail.com','Verkoper','password','seller',50,0,99,'Y','verkoper@gmail.com','','N',0),
    (13,'mantype@gmail.com','Mantype','password','seller',50,0,99,'Y','mantype@gmail.com','','N',0);

insert into `buyers` values
    (1,'Voornaam', 'Achternaam', 10),
    (2,'Tim', 'Coppieters', 11);

insert into `companies` values
    (1,'Naam Bedrijf', 'BE 0123.345.678','jpg','beschrijving van verkoper',12,1,12),
    (2,'Mantype', 'BE 9876.543.210','jpg','kapsalon voor mannen door mannen zonder afspraak',13,1,12);


drop table if exists `deal_templates`;
create table `deal_templates` (
    `id` int not null auto_increment,
    `title` varchar(255) not null default '',
    `description` varchar(255) not null default '',
    `image_ext` varchar(255) not null default '',
    `price` decimal(8,2) not null default 0,
    `normal_price` decimal(8,2) not null default 0,
    `seller_id` int not null default 0,
    primary key(`id`)
) default charset=utf8;

insert into deal_templates values
    (1, 'Titel van deal 1', 'Beschrijving van deal 1.', 'jpg', 10, 20, 1),
    (2, 'Titel van deal 2', 'Beschrijving van deal 2.', 'jpg', 100, 200, 1),
    (3, 'Frisse snit voor mannen', 'Een frisse snit voor mannen, uitzonderlijk op afspraak voor deze deal. Studentenkaart verplicht', 'jpg', 15, 21, 2);


drop table if exists `deals`;
create table `deals` (
    `id` int not null auto_increment,
    `deal_template_id` int not null default 0,
    `date` datetime not null,
    primary key(`id`)
) default charset=utf8;

replace into `deals` values
    (1, 1, '2013-09-20'),
    (2, 1, '2013-09-22'),
    (3, 1, DATE_ADD(DATE(NOW()), INTERVAL ((15 * 60) + 30) MINUTE)),
    (4, 3, DATE_ADD(DATE(NOW()), INTERVAL ((16 * 60) + 30) MINUTE)),
    (5, 3, DATE_ADD(DATE(DATE_ADD(NOW(), INTERVAL 1 DAY)), INTERVAL ((15 * 60) + 30) MINUTE)),
    (6, 3, DATE_ADD(DATE(DATE_ADD(NOW(), INTERVAL 2 DAY)), INTERVAL ((15 * 60) + 30) MINUTE)),
    (7, 3, DATE_ADD(DATE(DATE_ADD(NOW(), INTERVAL 3 DAY)), INTERVAL ((15 * 60) + 30) MINUTE)),
    (8, 3, DATE_ADD(DATE(DATE_ADD(NOW(), INTERVAL 4 DAY)), INTERVAL ((15 * 60) + 30) MINUTE));



drop table if exists `deal_slots`;
create table `deal_slots` (
    `id` int not null auto_increment,
    `deal_id` int not null default 0,
    `start_time` char(5) not null,
    `end_time` char(5) not null,
    `quantity` int not null default 1,
    primary key(`id`)
) default charset=utf8;

insert into `deal_slots` values
    (1, 1, '14:00', '14:30', 5),
    (2, 1, '14:30', '15:00', 2),
    (3, 1, '15:00', '15:30', 1),
    (4, 2, '16:00', '16:30', 1),
    (5, 3, '15:00', '15:30', 5),
    (6, 3, '15:30', '16:30', 5),
    (7, 4, '15:00', '15:30', 4),
    (8, 5, '15:00', '15:30', 3),
    (9, 6, '15:00', '15:30', 1),
    (10, 7, '15:00', '15:30', 2),
    (11, 8, '15:00', '15:30', 10),
    (12, 8, '15:00', '15:30', 23),
    (13, 8, '15:00', '15:30', 1);




drop table if exists `reservations`;
create table `reservations` (
    `id` int not null auto_increment,
    `deal_slot_id` int not null,
    `buyer_id` int not null,
    `quantity` int not null,
    primary key(`id`)
) default charset=utf8;

insert into `reservations` values
    (1, 1, 1, 1),
    (2, 1, 1, 2),
    (3, 3, 1, 1),
    (4, 5, 1, 2),
    (5, 10, 1, 7);