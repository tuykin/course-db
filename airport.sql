PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS "Countries";
CREATE TABLE Countries (
  ID INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(50));

INSERT INTO "Countries" VALUES(1,'USA');
INSERT INTO "Countries" VALUES(2,'Italy');
INSERT INTO "Countries" VALUES(3,'Angola');
INSERT INTO "Countries" VALUES(4,'Russia');
INSERT INTO "Countries" VALUES(5,'Беларуссия');
INSERT INTO "Countries" VALUES(6,'КНДР');
INSERT INTO "Countries" VALUES(7,'Albany');
INSERT INTO "Countries" VALUES(8,'Sweden');
INSERT INTO "Countries" VALUES(9,'Japan');
INSERT INTO "Countries" VALUES(10,'England');

DROP TABLE IF EXISTS "Cities";
CREATE TABLE Cities (
  ID INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(30),
  country_id INTEGER REFERENCES Countries(ID));

INSERT INTO "Cities" VALUES(1,'Moskow',4);
INSERT INTO "Cities" VALUES(2,'Rome',2);
INSERT INTO "Cities" VALUES(3,'London', 10);
INSERT INTO "Cities" VALUES(4,'Minsk',5);
INSERT INTO "Cities" VALUES(5,'Pekin',6);
INSERT INTO "Cities" VALUES(6,'Kazan',4);
INSERT INTO "Cities" VALUES(7,'Washington',1);
INSERT INTO "Cities" VALUES(8,'Stokgolm',8);
INSERT INTO "Cities" VALUES(9,'Tokyo',9);
INSERT INTO "Cities" VALUES(10,'Tver',4);

DROP TABLE IF EXISTS "Airports";
CREATE TABLE Airports (
  ID PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL,
  code VARCHAR(3) UNIQUE NOT NULL,
  city_id INTEGER NOT NULL REFERENCES Cities(ID),
  country_id INTEGER NOT NULL REFERENCES Countries(ID));

INSERT INTO "Airports" VALUES(1,'Домодедово', 'DME',1,4);
INSERT INTO "Airports" VALUES(2,'Вашингтонский аэропорт имени Даллеса','WAS',7,1);
INSERT INTO "Airports" VALUES(3,'Минск','MNS',4,5);
INSERT INTO "Airports" VALUES(4,'Leonardo da Vinci International (Fiumicino)','FCO',2,2);
INSERT INTO "Airports" VALUES(5,'Ciampino','CIA',2,2);
INSERT INTO "Airports" VALUES(6,'Хитроу','HIT',2,10);
INSERT INTO "Airports" VALUES(7,'Казань','KZN',6,4);
INSERT INTO "Airports" VALUES(8,'Внуково','VNO',1,4);
INSERT INTO "Airports" VALUES(9,'Шереметьево','SHE',1,4);
INSERT INTO "Airports" VALUES(10,'Пулково','PLK',1,4);

DROP TABLE IF EXISTS "Companies";
CREATE TABLE Companies (
  ID INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(100));

INSERT INTO "Companies" VALUES(1,'Алёша');
INSERT INTO "Companies" VALUES(2,'Аэрофлот');
INSERT INTO "Companies" VALUES(3,'Печенька');
INSERT INTO "Companies" VALUES(4,'Катрина');
INSERT INTO "Companies" VALUES(5,'Алказельцер');
INSERT INTO "Companies" VALUES(6,'Казань_1');
INSERT INTO "Companies" VALUES(7,'Пегас');
INSERT INTO "Companies" VALUES(8,'Венгр');
INSERT INTO "Companies" VALUES(9,'Ростелепорт');
INSERT INTO "Companies" VALUES(10,'ХЗ');

DROP TABLE IF EXISTS "Passengers";
CREATE TABLE Passengers(
  person_id INTEGER NOT NULL REFERENCES Persons(ID),
  flight_id INTEGER NOT NULL REFERENCES Flights(ID));

DROP TABLE IF EXISTS "Persons";
CREATE TABLE Persons ("id" INTEGER PRIMARY KEY NOT NULL ,"name" VARCHAR(50),"class" VARCHAR(10));
INSERT INTO "Persons" VALUES(1,'Петров Иван Викторович','эконом');
INSERT INTO "Persons" VALUES(2,'Сидоров Антон Иванович','эконом');
INSERT INTO "Persons" VALUES(3,'Пушкин Александр Федорович','первый');
INSERT INTO "Persons" VALUES(4,'Симушкина Людмила Михайловна','первый');
INSERT INTO "Persons" VALUES(5,'Карпова Регина Юрьевна','эконом');
INSERT INTO "Persons" VALUES(6,'Самойлова Антонина Эммануиловна','эконом');
INSERT INTO "Persons" VALUES(7,'Кудрявцев Валерий Антонович','первый');
INSERT INTO "Persons" VALUES(8,'Калиниченко Ольга Александровна','эконом');
INSERT INTO "Persons" VALUES(9,'Туйкин Анвар Маратович','первый');
INSERT INTO "Persons" VALUES(10,'Валерьев Василий Васильевич','первый');

DROP TABLE IF EXISTS "Employees";
CREATE TABLE Employees (
  staff_id INTEGER PRIMARY KEY NOT NULL,
  full_name VARCHAR(100),
  position VARCHAR(100));

INSERT INTO "Employees" VALUES(1,'Петров Петр Петрович','Пилот');
INSERT INTO "Employees" VALUES(2,'Сидоров Александр Иванович','Пилот');
INSERT INTO "Employees" VALUES(3,'Тихонов Антон Сергеевич','Пилот');
INSERT INTO "Employees" VALUES(4,'Скворцов Виктор Семенович','Пилот');
INSERT INTO "Employees" VALUES(5,'Карнилов Владимир Владимироович','Пилот');
INSERT INTO "Employees" VALUES(6,'Карчевский Михаил Петрович','Пилот');
INSERT INTO "Employees" VALUES(7,'Гардеев Олег Александрович','Пилот');
INSERT INTO "Employees" VALUES(8,'Гладков Николай Николаевич','Пилот');
INSERT INTO "Employees" VALUES(9,'Иванов Иван Иванович','Пилот');
INSERT INTO "Employees" VALUES(10,'Александров Максим Петрович','Пилот');

DROP TABLE IF EXISTS "Models";
CREATE TABLE Models (
  ID INTEGER PRIMARY KEY NOT NULL,
  model VARCHAR(50) UNIQUE NOT NULL);

INSERT INTO "Models" VALUES(1,'ТУ-134');
INSERT INTO "Models" VALUES(2,'ТУ-132');
INSERT INTO "Models" VALUES(3,'Иж-25');
INSERT INTO "Models" VALUES(4,'ИЛ-6');
INSERT INTO "Models" VALUES(5,'ИЛ-2');
INSERT INTO "Models" VALUES(6,'Кукурузник');
INSERT INTO "Models" VALUES(7,'КА-52');
INSERT INTO "Models" VALUES(8,'Boing-747');
INSERT INTO "Models" VALUES(9,'Туполев');
INSERT INTO "Models" VALUES(10,'Русел');

DROP TABLE IF EXISTS "Airplanes";
CREATE TABLE Airplanes (
  ID INTEGER PRIMARY KEY NOT NULL,
  serial_number VARCHAR(20) UNIQUE NOT NULL,
  model_id INTEGER NOT NULL REFERENCES Models(ID),
  company_id INTEGER NOT NULL REFERENCES Companies(ID),
  created_at DATE DEFAULT("2000-01-01"));

INSERT INTO "Airplanes" VALUES(1,'1000001',1,6,'19.05.2001');
INSERT INTO "Airplanes" VALUES(2,'1000002',6,8,'20.02.2001');
INSERT INTO "Airplanes" VALUES(3,'100003',5,10,'31.12.2001');
INSERT INTO "Airplanes" VALUES(4,'1000004',8,2,'4.07.2020');
INSERT INTO "Airplanes" VALUES(5,'1000005',10,4,'20.12.2008');
INSERT INTO "Airplanes" VALUES(6,'100000',2,1,'30.01.2009');
INSERT INTO "Airplanes" VALUES(7,'1000006',9,3,'20.02.2001');
INSERT INTO "Airplanes" VALUES(8,'1000007',3,5,'01.03.2005');
INSERT INTO "Airplanes" VALUES(9,'1000008',7,7,'04.05.2006');
INSERT INTO "Airplanes" VALUES(10,'1001',4,9,'20.12.2015');

DROP TABLE IF EXISTS "Flights";
CREATE TABLE Flights (
  ID INTEGER PRIMARY KEY NOT NULL,
  airplane_id INTEGER REFERENCES Airplanes(ID),
  arrival_id INTEGER REFERENCES Airports(ID),
  departure_id INTEGER REFERENCES Airports(ID));

INSERT INTO "Flights" VALUES(1,11,3,103);
INSERT INTO "Flights" VALUES(2,12,3,103);
INSERT INTO "Flights" VALUES(3,13,5,108);
INSERT INTO "Flights" VALUES(4,14,8,106);
INSERT INTO "Flights" VALUES(5,15,10,101);
INSERT INTO "Flights" VALUES(6,16,7,102);
INSERT INTO "Flights" VALUES(7,17,6,101);
INSERT INTO "Flights" VALUES(8,18,1,101);
INSERT INTO "Flights" VALUES(9,19,1,101);
INSERT INTO "Flights" VALUES(10,20,1,101);

DROP TABLE IF EXISTS "Staff";
CREATE TABLE Staff (
  employee_id INTEGER NOT NULL REFERENCES Employees(ID),
  flight_id INTEGER NOT NULL REFERENCES Flights(ID));

INSERT INTO "Staff" VALUES(1,1);
INSERT INTO "Staff" VALUES(2,2);
INSERT INTO "Staff" VALUES(3,3);
INSERT INTO "Staff" VALUES(4,4);
INSERT INTO "Staff" VALUES(1,5);
INSERT INTO "Staff" VALUES(2,6);
INSERT INTO "Staff" VALUES(3,7);
INSERT INTO "Staff" VALUES(4,8);
INSERT INTO "Staff" VALUES(5,9);
INSERT INTO "Staff" VALUES(5,10);
