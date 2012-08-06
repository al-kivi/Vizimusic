DROP TABLE IF EXISTS "comments";
CREATE TABLE `comments` (`id` integer PRIMARY KEY AUTOINCREMENT, `username` varchar(255) NULL, `comment` text NOT NULL, `created_at` timestamp, `post_id` integer REFERENCES `posts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE, `user_id` integer REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE);
INSERT INTO "comments" VALUES(2,NULL,'This post is all Greek to me.','2012-07-07 17:16:57.601319-0400',7,1);
DROP TABLE IF EXISTS "composers";
CREATE TABLE composers (
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(30),
  middle_name VARCHAR(30),
  last_name VARCHAR(30),
  birth_year INTEGER(4),
  death_year INTEGER(4),
  country CHAR(2)
);
INSERT INTO "composers" VALUES(1,'Ludwig','van','Beethoven',1770,1827,'DE');
INSERT INTO "composers" VALUES(2,'Johannes','','Brahms',1833,1897,'DE');
INSERT INTO "composers" VALUES(3,'Charles-Camille','','Saint-Saens',1835,1921,'FR');
INSERT INTO "composers" VALUES(4,'Johann','Sebastian','Bach',1685,1750,'DE');
INSERT INTO "composers" VALUES(5,'George','Frideric','Handel',1685,1747,'DE');
DROP TABLE IF EXISTS "editions";
CREATE TABLE editions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(100),
  description VARCHAR(30),
  publisher_id INTEGER NOT NULL,
  year INT(4),
  price FLOAT
);
INSERT INTO "editions" VALUES(1,NULL,'2nd',1,1977,10.95);
INSERT INTO "editions" VALUES(2,NULL,'revised',3,1985,15.95);
INSERT INTO "editions" VALUES(3,NULL,'transposed',2,1985,15.95);
INSERT INTO "editions" VALUES(4,NULL,'(unknown)',1,1985,15.95);
INSERT INTO "editions" VALUES(5,NULL,'3rd',2,1985,15.95);
INSERT INTO "editions" VALUES(6,NULL,'Urtext',3,1985,15.95);
INSERT INTO "editions" VALUES(7,NULL,'facsimile',1,1985,15.95);
INSERT INTO "editions" VALUES(8,NULL,'Authorized',2,1985,15.95);
INSERT INTO "editions" VALUES(9,NULL,'facsimile',3,1985,15.95);
INSERT INTO "editions" VALUES(10,NULL,'3rd',1,1985,15.95);
INSERT INTO "editions" VALUES(11,NULL,'4th',2,1985,15.95);
INSERT INTO "editions" VALUES(12,NULL,'facsimile',1,1985,15.95);
INSERT INTO "editions" VALUES(13,NULL,'Urtext',2,1985,15.95);
INSERT INTO "editions" VALUES(14,'Bach Cello Suites','Peters',2,1941,15.95);
DROP TABLE IF EXISTS "editions_works";
CREATE TABLE editions_works (
  edition_id INTEGER NOT NULL,
  work_id INTEGER NOT NULL
);
INSERT INTO "editions_works" VALUES(1,1);
INSERT INTO "editions_works" VALUES(2,1);
INSERT INTO "editions_works" VALUES(3,3);
INSERT INTO "editions_works" VALUES(4,11);
INSERT INTO "editions_works" VALUES(5,10);
INSERT INTO "editions_works" VALUES(6,10);
INSERT INTO "editions_works" VALUES(7,10);
INSERT INTO "editions_works" VALUES(8,10);
INSERT INTO "editions_works" VALUES(9,12);
INSERT INTO "editions_works" VALUES(10,11);
INSERT INTO "editions_works" VALUES(11,11);
INSERT INTO "editions_works" VALUES(12,12);
INSERT INTO "editions_works" VALUES(13,12);
INSERT INTO "editions_works" VALUES(14,4);
INSERT INTO "editions_works" VALUES(14,5);
INSERT INTO "editions_works" VALUES(14,6);
INSERT INTO "editions_works" VALUES(14,7);
INSERT INTO "editions_works" VALUES(14,8);
INSERT INTO "editions_works" VALUES(14,9);
DROP TABLE IF EXISTS "instruments";
CREATE TABLE instruments (
  id INTEGER PRIMARY KEY,
  name VARCHAR(20),
  family VARCHAR(15)
);
INSERT INTO "instruments" VALUES(1,'violin','strings');
INSERT INTO "instruments" VALUES(2,'cello','strings');
INSERT INTO "instruments" VALUES(3,'piano','keyboard');
INSERT INTO "instruments" VALUES(4,'harpsichord','keyboard');
INSERT INTO "instruments" VALUES(5,'flute','woodwinds');
INSERT INTO "instruments" VALUES(6,'french horn','brass');
INSERT INTO "instruments" VALUES(7,'orchestra','orchestra');
DROP TABLE IF EXISTS "instruments_works";
CREATE TABLE instruments_works (
  instrument_id INTEGER NOT NULL,
  work_id INTEGER NOT NULL
);
INSERT INTO "instruments_works" VALUES(1,2);
INSERT INTO "instruments_works" VALUES(1,3);
INSERT INTO "instruments_works" VALUES(2,1);
INSERT INTO "instruments_works" VALUES(2,2);
INSERT INTO "instruments_works" VALUES(2,3);
INSERT INTO "instruments_works" VALUES(3,7);
INSERT INTO "instruments_works" VALUES(4,2);
INSERT INTO "instruments_works" VALUES(5,2);
INSERT INTO "instruments_works" VALUES(6,2);
INSERT INTO "instruments_works" VALUES(7,2);
INSERT INTO "instruments_works" VALUES(8,2);
INSERT INTO "instruments_works" VALUES(9,2);
INSERT INTO "instruments_works" VALUES(10,7);
INSERT INTO "instruments_works" VALUES(11,7);
INSERT INTO "instruments_works" VALUES(11,2);
DROP TABLE IF EXISTS "orders";
CREATE TABLE "orders" ("id" INTEGER PRIMARY KEY ,"edition_id" INTEGER,"user_id" INTEGER,"created_at" DATETIME,"status" CHAR(4));
INSERT INTO "orders" VALUES(3,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(4,3,1,NULL,'paid');
INSERT INTO "orders" VALUES(5,3,1,NULL,'paid');
INSERT INTO "orders" VALUES(6,3,1,NULL,'paid');
INSERT INTO "orders" VALUES(7,3,1,NULL,'paid');
INSERT INTO "orders" VALUES(8,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(9,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(10,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(11,14,4,NULL,'open');
INSERT INTO "orders" VALUES(12,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(13,3,1,NULL,'paid');
INSERT INTO "orders" VALUES(14,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(15,2,1,NULL,'paid');
INSERT INTO "orders" VALUES(16,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(17,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(18,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(19,14,1,NULL,'paid');
INSERT INTO "orders" VALUES(20,14,1,NULL,'paid');
DROP TABLE IF EXISTS "posts";
CREATE TABLE `posts` (`id` integer PRIMARY KEY AUTOINCREMENT, `title` varchar(255) NOT NULL, `body` text NOT NULL, `created_at` timestamp, `updated_at` timestamp, `user_id` integer REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE);
INSERT INTO "posts" VALUES(7,'This is the first post ...','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."','2012-07-07 17:07:44.238180-0400','2012-07-07 17:17:22.326805-0400',1);
INSERT INTO "posts" VALUES(8,'This the second post ...','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2012-07-07 17:09:20.049775-0400','2012-07-07 17:17:37.100769-0400',1);
INSERT INTO "posts" VALUES(9,'This is the third post ...','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2012-07-07 17:12:45.778865-0400','2012-07-07 17:17:52.943589-0400',1);
INSERT INTO "posts" VALUES(10,'This is the fourth post','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2012-07-07 17:13:13.005063-0400','2012-07-07 17:18:12.862166-0400',1);
INSERT INTO "posts" VALUES(11,'This is the fifth post','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2012-07-07 17:13:47.115463-0400','2012-07-07 17:18:26.819391-0400',1);
DROP TABLE IF EXISTS "publishers";
CREATE TABLE publishers (
  id INTEGER PRIMARY KEY,
  name VARCHAR(60),
  city VARCHAR(30),
  country CHAR(2)
);
INSERT INTO "publishers" VALUES(1,'RubyTunes, Inc.','New York','US');
INSERT INTO "publishers" VALUES(2,'D.Black Music','Paris','FR');
INSERT INTO "publishers" VALUES(3,'ActionMusic','Chicago','US');
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" ("id" integer PRIMARY KEY ,"email" varchar DEFAULT (null) ,"crypted_password" varchar DEFAULT (null) ,"salt" text DEFAULT (null) ,"username" varchar, "first_name" VARCHAR, "last_name" VARCHAR);
INSERT INTO "users" VALUES(1,'admin','eccbbd2239261f0d16f5ea4810a32b35747c03e9','a1ff7a0ebbd04cd70b1f5f389094b68d46a55a90','Administrator','admin',NULL);
INSERT INTO "users" VALUES(2,'test@gmail.com','8b5c97e38dbbe1416bed0bc90d2b67d6d17dad8b','0245d6ad472ccebcc08d5afbf8403112154659ac','Test User','tester',NULL);
DROP TABLE IF EXISTS "works";
CREATE TABLE "works" (
  id INTEGER PRIMARY KEY,
  composer_id INTEGER REFERENCES composer,
  title VARCHAR(100),
  year INTEGER(4),
  kee CHAR(9),
  opus VARCHAR(20)
);
INSERT INTO "works" VALUES(1,2,'Sonata #2',1886,'F major','99');
INSERT INTO "works" VALUES(2,1,'Trio #1',1795,'C minor','1, no. 3');
INSERT INTO "works" VALUES(3,3,'Symphony #3',1886,'C minor','78');
INSERT INTO "works" VALUES(4,4,'Suite #1',1720,'G major','BWV1007');
INSERT INTO "works" VALUES(5,4,'Suite #2',1720,'D minor','BWV1008');
INSERT INTO "works" VALUES(6,4,'Suite #3',1720,'C major','BWV1009');
INSERT INTO "works" VALUES(7,4,'Suite #4',1720,'Eb major','BWV1010');
INSERT INTO "works" VALUES(8,4,'Suite #5',1720,'C minor','BWV1011');
INSERT INTO "works" VALUES(9,4,'Suite #6',1720,'D major','BWV1012');
INSERT INTO "works" VALUES(10,3,'Symphony #4',1897,'E minor','97');
INSERT INTO "works" VALUES(11,3,'Concerto #1',1873,'A minor','33');
INSERT INTO "works" VALUES(12,5,'Messiah',1742,NULL,NULL);
