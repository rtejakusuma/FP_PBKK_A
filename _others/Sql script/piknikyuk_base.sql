/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/27/2019 12:57:42 AM                        */
/*==============================================================*/


drop table if exists OPENING_HOURS;

drop table if exists ORDERS;

drop table if exists USERS;

drop table if exists DISCOUNTS;

drop table if exists PRICINGS;

drop table if exists TOUR_LOCATIONS;


/*==============================================================*/
/* Table: DISCOUNTS                                             */
/*==============================================================*/
create table DISCOUNTS
(
   id                   int not null auto_increment,
   description          varchar(50) not null,
   code                 varchar(12) not null,
   discount_value       decimal(5,2) not null,
   start_time           date not null,
   end_time             date not null,
   primary key (id)
);

/*==============================================================*/
/* Table: OPENING_HOURS                                         */
/*==============================================================*/
create table OPENING_HOURS
(
   tour_location_id     int,
   day                  numeric(1,0) not null,
   open_time            time not null,
   close_time           time not null,
   primary key (day, tour_location_id)
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS
(
   user_id              int not null,
   tour_location_id     int not null,
   order_time            timestamp,
   primary key (user_id, tour_location_id)
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
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS
(
   id         	        int not null auto_increment,
   discount_id          int,
   username             varchar(50) not null,
   email                varchar(50) not null,
   password             char(64) not null,
   role                 numeric(1,0) not null,
   primary key (id)
);

alter table OPENING_HOURS add constraint FK_OPENINGHOURS foreign key (tour_location_id)
      references TOUR_LOCATIONS (id) on delete restrict on update cascade;

alter table ORDERS add constraint FK_ORDERS foreign key (user_id)
      references USERS (id) on delete restrict on update cascade;

alter table ORDERS add constraint FK_ORDERS2 foreign key (tour_location_id)
      references TOUR_LOCATIONS (id) on delete restrict on update cascade;

alter table USERS add constraint FK_DISCOUNTS foreign key (discount_id)
      references DISCOUNTS (id) on delete restrict on update cascade;

