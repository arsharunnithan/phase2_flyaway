
create database flyaway;
use flyaway;
create table flights(flight_id int primary key auto_increment, sourceOfFlight varchar(20), destination varchar(20), numberOfSeatsLeft varchar(50));
ALTER TABLE flights ADD COLUMN dateofflight DATE;
INSERT INTO flights (sourceOfFlight, destination, numberOfSeatsLeft, dateofflight) VALUES ('New York', 'London', 50, '2023-04-10');

ALTER TABLE flights ADD COLUMN ticketPrice DECIMAL(10,2);
UPDATE flights SET ticketPrice = 150.00 WHERE flight_id = 1;

INSERT INTO flights (sourceOfFlight, destination, numberOfSeatsLeft, dateofflight, ticketPrice) VALUES ('New York', 'London', 20, '2023-04-10', '200.00');
INSERT INTO flights (sourceOfFlight, destination, numberOfSeatsLeft, dateofflight, ticketPrice) VALUES ('New York', 'London', 40, '2023-04-10', '400.00');
select * from flights;
create table admin(adminName varchar(20), adminPassword varchar(20));
INSERT INTO admin (adminName, adminPassword) VALUES ('adminUser', 'flyAwayPwd');

ALTER TABLE flights ADD COLUMN airline varchar(30);
UPDATE flights SET airline = 'American Airlines' WHERE flight_id = 1;
UPDATE flights SET airline = 'Emirates' WHERE flight_id = 2;
UPDATE flights SET airline = 'American Airlines' WHERE flight_id = 3;

select * from flights;
INSERT INTO flights (sourceOfFlight, destination, numberOfSeatsLeft, dateofflight, ticketPrice, airline) VALUES ('Miami', 'Paris', 60, '2023-04-15', '1400.00','Delta Airlines');
INSERT INTO flights (sourceOfFlight, destination, numberOfSeatsLeft, dateofflight, ticketPrice, airline) VALUES ('Miami', 'Rome', 40, '2023-04-15', '400.00','Lufthansa');
INSERT INTO flights (sourceOfFlight, destination, numberOfSeatsLeft, dateofflight, ticketPrice, airline) VALUES ('Houston', 'Mexico', 70, '2023-04-15', '4500.00','United Airlines');
INSERT INTO flights (sourceOfFlight, destination, numberOfSeatsLeft, dateofflight, ticketPrice, airline) VALUES ('Miami', 'Paris', 60, '2023-04-11', '1400.00','Delta Airlines');
INSERT INTO flights (sourceOfFlight, destination, numberOfSeatsLeft, dateofflight, ticketPrice, airline) VALUES ('New York', 'London', 20, '2023-04-11', '200.00','Delta Airlines');
INSERT INTO flights (sourceOfFlight, destination, numberOfSeatsLeft, dateofflight, ticketPrice, airline) VALUES ('Miami', 'Rome', 40, '2023-04-11', '400.00','Lufthansa');


