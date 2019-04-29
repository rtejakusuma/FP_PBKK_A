/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/27/2019 12:57:42 AM                        */
/*==============================================================*/


drop table if exists DISCOUNTS;

drop table if exists OPENING_HOURS;

drop table if exists ORDERS;

drop table if exists PRICINGS;

drop table if exists TOUR_LOCATIONS;

drop table if exists USERS;

/*==============================================================*/
/* Table: DISCOUNTS                                             */
/*==============================================================*/
create table DISCOUNTS
(
   id          			int not null,
   description 			varchar(50) not null,
   start_time           date not null,
   end_time             date not null,
   discount_value       decimal(5,2) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: OPENING_HOURS                                         */
/*==============================================================*/
create table OPENING_HOURS
(
   id 				    int not null,
   tour_locations_id    int,
   day                  numeric(1,0) not null,
   open_time            time not null,
   close_time           time not null,
   primary key (id, day)
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS
(
   users_id              int not null,
   tour_locations_id     int not null,
   order_time            timestamp,
   primary key (users_id, tour_locations_id)
);

/*==============================================================*/
/* Table: PRICINGS                                              */
/*==============================================================*/
create table PRICINGS
(
   id                   int not null,
   tour_locations_id    int,
   weekday_price        decimal(10,2) not null,
   weekend_price        decimal(10,2) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: TOUR_LOCATIONS                                        */
/*==============================================================*/
create table TOUR_LOCATIONS
(
   id 			        int not null,
   opening_hours_id     int not null,
   pricings_id          int not null,
   name                 varchar(50) not null,
   description		    varchar(200) not null,
   location             varchar(50) not null,
   capacity             smallint not null,
   primary key (id)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS
(
   id         	        int not null,
   discounts_id         int,
   username             varchar(50) not null,
   email                varchar(50) not null,
   password             char(64) not null,
   role                 numeric(1,0) not null,
   primary key (id)
);

alter table OPENING_HOURS add constraint FK_IN_OPENINGHOURS foreign key (tour_locations_id)
      references TOUR_LOCATIONS (id) on delete restrict on update restrict;

alter table ORDERS add constraint FK_ORDERS foreign key (users_id)
      references USERS (id) on delete restrict on update restrict;

alter table ORDERS add constraint FK_ORDERS2 foreign key (tour_locations_id)
      references TOUR_LOCATIONS (id) on delete restrict on update restrict;

alter table PRICINGS add constraint FK_IN_PRICINGS foreign key (tour_locations_id)
      references TOUR_LOCATIONS (id) on delete restrict on update restrict;

alter table TOUR_LOCATIONS add constraint FK_IN_OPENINGHOURS2 foreign key (opening_hours_id)
      references OPENING_HOURS (id) on delete restrict on update restrict;

alter table TOUR_LOCATIONS add constraint FK_IN_PRICINGS2 foreign key (pricings_id)
      references PRICINGS (id) on delete restrict on update restrict;

alter table USERS add constraint FK_USE foreign key (discounts_id)
      references DISCOUNTS (id) on delete restrict on update restrict;

