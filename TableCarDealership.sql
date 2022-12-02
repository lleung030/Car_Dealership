CREATE TABLE customer (
	customer_id serial PRIMARY KEY,
	first_name varchar(45) NOT NULL,
	last_name varchar(45) NOT NULL,
	address varchar(255),
	billing_info varchar(255)
);

CREATE TABLE mechanic ( 
	mechanic_id serial PRIMARY KEY,
	first_name varchar(45) NOT NULL,
	last_name varchar(45) NOT NULL
);

CREATE TABLE salesperson (
	salesperson_id serial PRIMARY KEY,
	first_name varchar(45) NOT NULL,
	last_name varchar(45) NOT NULL
);

CREATE TABLE invoice (
	invoice_id serial PRIMARY KEY,
	price float NOT NULL,
	customer_id integer REFERENCES customer(customer_id),
	mechanic_id integer REFERENCES mechanic(mechanic_id),
	salesperson_id integer REFERENCES salesperson(salesperson_id)
);

CREATE TABLE car ( 
	car_id serial PRIMARY KEY,
	make varchar(50) NOT NULL,
	model varchar(50) NOT NULL,
	year integer NOT NULL,
	customer_id integer REFERENCES customer(customer_id),
	mechanic_id integer REFERENCES mechanic(mechanic_id),
	salesperson_id integer REFERENCES salesperson(salesperson_id),
	invoice_id integer REFERENCES invoice(invoice_id)	
);

CREATE TABLE service_ticket (
	service_ticket serial PRIMARY KEY,
	car_id integer REFERENCES car(car_id), 
	customer_id integer REFERENCES customer(customer_id)
);



