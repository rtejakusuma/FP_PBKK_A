/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/27/2019 12:57:42 AM                        */
/*==============================================================*/


/*==============================================================*/
/* Dumping data for table `users`*/
/*==============================================================*/

INSERT INTO `users` (`id`, `discounts_id`, `username`, `email`, `password`, `role`) VALUES
(1, NULL, 'admin', 'admin@gmail.com', 'd82494f05d6917ba02f7aaa29689ccb444bb73f20380876cb05d1f37537b7892', '1'),
(2, NULL, 'user1', 'user1@gmail.com', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', '0');


/*==============================================================*/
/* Dumping data for table `discounts`*/
/*==============================================================*/
INSERT INTO `discounts` (`id`, `description`, `start_time`, `end_time`, `discount_value`) VALUES
(1, 'PiknikYuk Promo #1', '2019-04-01', '2019-04-30', '50'),
(2, 'PiknikYuk Promo #2', '2019-03-01', '2019-03-29', '15'),
(3, 'PiknikYuk Promo #3', '2019-05-01', '2019-06-01', '20');

/*==============================================================*/
/* Dumping data for table `tour_locations`*/
/*==============================================================*/
INSERT INTO `tour_locations` (`id`, `opening_hours_id`, `pricings_id`, `name`, `description`, `location`, `capacity`) VALUES
(1, 1, 1, 'Kalikepiting', 'Kali tempat berbagai macam spesies tinggal.', 'Surabaya', 400),
(2, 2, 2, 'Batu', 'Keras lho.', 'Malang', 150),
(3, 3, 3, 'Rumah Makan', 'Tempat beristirahat sembari mengisi perut.', 'Solo', 1000);
