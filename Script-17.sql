create table vehicle (
	vehicle_id int primary key,
	make varchar(45),
	model varchar(45),
	year int,
	liscense_plate varchar(20)
);

create table if not exists drivers (
	driver_id int primary key,
	vehicle_id_fk int references vehicle(vehicle_id),
	first_name varchar(45),
	last_name varchar(45),
	license_number varchar(50)
);

create table maintenanceRecords(
	record_id int primary key,
	vehicle_id int references vehicle(vehicle_id),
	maintenance_type varchar(45),
	date date,
	cost decimal(5,2),
	description char(100)
);

create table if not exists parts(
	part_id int primary key,
	vehicle_id_fk int references vehicle(vehicle_id),
	name varchar(50),
	description char(100),
	unit_price decimal(4,2)
);

create table if not exists fuellogs (
	log_id int primary key,
	vehicle_id int references vehicle(vehicle_id),
	date date,
	mileage int,
	fuel_type varchar(40),
	quantity decimal(4,2),
	location_id int references location(location_id)
);

create table serviceHistory (
	service_id int primary key,
	vehicle_id int references vehicle(vehicle_id),
	service_type varchar(50),
	date date,
	description char(100)
)

create table location (
	location_id int primary key,
	name varchar(45),
	address char(100),
	type varchar(45)
);

alter table parts 
add column vehicle_id_fk int references vehicle(vehicle_id);

alter table drivers 
add column vehicle_id_fk int references vehicle(vehicle_id);
