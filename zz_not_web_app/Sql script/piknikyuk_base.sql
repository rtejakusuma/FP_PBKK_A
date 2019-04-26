/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/26/2019 11:31:03 PM                        */
/*==============================================================*/


drop table if exists OPENING_HOURS;

drop table if exists ORDERS;

drop table if exists PRICINGS;

drop table if exists TOUR_LOCATIONS;

drop table if exists USERS;

/*==============================================================*/
/* Table: OPENING_HOURS                                         */
/*==============================================================*/
create table OPENING_HOURS
(
   ID_OPENINGHOURS      int not null,
   ID_TOURLOCATION      int,
   DAY                  numeric(1,0),
   OPEN_TIME            time,
   CLOSE_TIME           time,
   primary key (ID_OPENINGHOURS)
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS
(
   USER_ID              int not null,
   ID_TOURLOCATION      int not null,
   ORDER_TIME           timestamp,
   primary key (USER_ID, ID_TOURLOCATION)
);

/*==============================================================*/
/* Table: PRICINGS                                              */
/*==============================================================*/
create table PRICINGS
(
   ID_PRICINGS          int not null,
   ID_TOURLOCATION      int,
   WEEKDAY_PRICE        decimal(10,2),
   WEEKEND_PRICE        decimal(10,2),
   SPECIAL_PRICE        decimal(10,2),
   primary key (ID_PRICINGS)
);

/*==============================================================*/
/* Table: TOUR_LOCATIONS                                        */
/*==============================================================*/
create table TOUR_LOCATIONS
(
   ID_TOURLOCATION      int not null,
   ID_OPENINGHOURS      int not null,
   ID_PRICINGS          int not null,
   NAME                 varchar(50),
   DESCRIPTION          varchar(200),
   LOCATION             varchar(50),
   CAPACITY             smallint,
   primary key (ID_TOURLOCATION)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS
(
   USER_ID              int not null,
   USERNAME             varchar(50),
   EMAIL                varchar(50),
   PASSWORD             varchar(60),
   ROLE                 numeric(1,0),
   primary key (USER_ID)
);

alter table OPENING_HOURS add constraint FK_IN_OPENINGHOURS foreign key (ID_TOURLOCATION)
      references TOUR_LOCATIONS (ID_TOURLOCATION) on delete restrict on update restrict;

alter table ORDERS add constraint FK_ORDERS foreign key (USER_ID)
      references USERS (USER_ID) on delete restrict on update restrict;

alter table ORDERS add constraint FK_ORDERS2 foreign key (ID_TOURLOCATION)
      references TOUR_LOCATIONS (ID_TOURLOCATION) on delete restrict on update restrict;

alter table PRICINGS add constraint FK_IN_PRICINGS foreign key (ID_TOURLOCATION)
      references TOUR_LOCATIONS (ID_TOURLOCATION) on delete restrict on update restrict;

alter table TOUR_LOCATIONS add constraint FK_IN_OPENINGHOURS2 foreign key (ID_OPENINGHOURS)
      references OPENING_HOURS (ID_OPENINGHOURS) on delete restrict on update restrict;

alter table TOUR_LOCATIONS add constraint FK_IN_PRICINGS2 foreign key (ID_PRICINGS)
      references PRICINGS (ID_PRICINGS) on delete restrict on update restrict;

