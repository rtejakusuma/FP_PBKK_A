/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/27/2019 12:57:42 AM                        */
/*==============================================================*/

drop table if exists OPENING_HOURS;

drop table if exists ORDERS;

drop table if exists TOUR_LOCATIONS;

drop table if exists USERS;

drop table if exists DISCOUNTS;


/*==============================================================*/
/* Table: DISCOUNTS                                             */
/*==============================================================*/
create table DISCOUNTS
(
   id          			int not null auto_increment,
   description 			varchar(50) not null,
   code                 varchar(12) not null,
   discount_value       decimal(5,2) not null,
   start_time           date not null,
   end_time             date not null,
   primary key (id)
);

/*==============================================================*/
/* Table: OPENING_HOURSS                                 */
/*==============================================================*/
create table OPENING_HOURS
(
   id 				    int not null auto_increment,
   day                  numeric(1,0) not null,
   open_time            time not null,
   close_time           time not null,
   tour_location_id		int default null,
   primary key (id)
);


/*==============================================================*/
/* Table: TOUR_LOCATIONS                                        */
/*==============================================================*/
create table TOUR_LOCATIONS
(
   id 			        int not null auto_increment,
   name                 varchar(50) not null,
   description		    varchar(200) not null,
   location             varchar(50) not null,
   capacity             smallint not null,
   weekday_price        decimal(10,2) not null,
   weekend_price        decimal(10,2) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS
(
   user_id              int not null,
   tour_location_id     int not null,
   order_time           timestamp,
   primary key (user_id, tour_location_id)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS
(
   id         	        int not null auto_increment,
   discount_id          int default null,
   username             varchar(50) not null,
   email                varchar(50) not null,
   password             char(64) not null,
   role                 numeric(1,0) not null,
   primary key (id)
);

alter table OPENING_HOURS add constraint FK_TOUR_LOCATIONS foreign key (tour_location_id)
      references TOUR_LOCATIONS (id) on delete restrict on update cascade;

alter table ORDERS add constraint FK_ORDERS foreign key (user_id)
      references USERS (id) on delete restrict on update cascade;

alter table ORDERS add constraint FK_ORDERS2 foreign key (tour_location_id)
      references TOUR_LOCATIONS (id) on delete restrict on update cascade;

alter table USERS add constraint FK_DISCOUNTS foreign key (discount_id)
      references DISCOUNTS (id) on delete restrict on update cascade;

/*==============================================================*/
/* Dumping data for table `users`*/
/*==============================================================*/

INSERT INTO `users` (`id`, `discount_id`, `username`, `email`, `password`, `role`) VALUES
(1, NULL, 'admin', 'admin@gmail.com', 'd82494f05d6917ba02f7aaa29689ccb444bb73f20380876cb05d1f37537b7892', '1'),
(2, NULL, 'user1', 'user1@gmail.com', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', '0');


/*==============================================================*/
/* Dumping data for table `tour_locations`*/
/*==============================================================*/
INSERT INTO `tour_locations` (`id`, `name`, `description`, `location`, `capacity`, `weekday_price`, `weekend_price`) VALUES
(1, 'Kalikepiting', 'Kali tempat berbagai macam spesies tinggal.', 'Surabaya', 400, 5000, 7000),
(2, 'Batu', 'Keras lho.', 'Malang', 150, 15000, 17000),
(3, 'Rumah Makan', 'Tempat beristirahat sembari mengisi perut.', 'Solo', 1000, 30000, 35000);


/*==============================================================*/
/* Dumping data for table `discounts`*/
/*==============================================================*/
INSERT INTO `discounts` (`description`, `code`, `discount_value`, `start_time`, `end_time`) VALUES
('PiknikYuk Pengguna Baru', 'PYPROMOBARU', '50', '2019-03-01', '2019-05-31'),
('PiknikYuk Promo #1', 'PYPROMO1', '50', '2019-03-01', '2019-03-31'),
('PiknikYuk Promo #2', 'PYPROMO2', '15', '2019-04-01', '2019-04-30'),
('PiknikYuk Promo #3', 'PYPROMO3', '20', '2019-05-01', '2019-05-31');


/*==============================================================*/
/* Dumping data for table `opening_hours`*/
/*==============================================================*/
-- INSERT INTO `opening_hours` (`tour_location_id`, `day`,  `open_time`, `close_time`) VALUES
-- (1, 1, '07:00:00', '22:00:00'),
-- (1, 2, '07:00:00', '22:00:00'),
-- (1, 3, '07:00:00', '22:00:00'),
-- (1, 4, '07:00:00', '22:00:00'),
-- (1, 5, '07:00:00', '22:00:00'),
-- (1, 6, '07:00:00', '22:00:00'),
-- (1, 7, '07:00:00', '22:00:00'),

-- (2, 1, '10:00:00', '02:00:00'),
-- (2, 2, '10:00:00', '02:00:00'),
-- (2, 3, '10:00:00', '02:00:00'),
-- (2, 4, '10:00:00', '02:00:00'),
-- (2, 5, '10:00:00', '02:00:00'),
-- (2, 6, '10:00:00', '02:00:00'),
-- (2, 7, '10:00:00', '02:00:00'),

-- (3, 1, '10:00:00', '19:30:00'),
-- (3, 2, '10:00:00', '19:30:00'),
-- (3, 3, '10:00:00', '19:30:00'),
-- (3, 4, '10:00:00', '19:30:00'),
-- (3, 5, '10:00:00', '19:30:00'),
-- (3, 6, '10:00:00', '19:30:00'),
-- (3, 7, '10:00:00', '19:30:00');

