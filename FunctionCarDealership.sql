--FUNCTION 1
INSERT INTO customer (first_name, last_name, address, billing_info)
VALUES 
	('Lucas', 'Smith', '123 Main St', '94857');
CREATE OR REPLACE PROCEDURE insertCustomer(_first_name varchar, _last_name varchar, _address varchar, _billing_info varchar)
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO customer (first_name, last_name, address, billing_info)
	VALUES 
		(_first_name, _last_name, _address, _billing_info);
END;
$$

CALL insertCustomer('Jane', 'Smith', '111 Main St', '94857')


--FUNCTION 2
CREATE OR REPLACE FUNCTION priceComparison (_last_name varchar)
RETURNS TABLE (
	first_name varchar,
	last_name varchar,
	make varchar,
	model varchar,
	"year" integer,
	price float
)
LANGUAGE plpgsql AS $$
BEGIN
	RETURN QUERY (
		SELECT DISTINCT customer.first_name, customer.last_name, car.make, car.model, car."year", invoice.price
		FROM car
		JOIN invoice
		ON invoice.invoice_id = car.invoice_id 
		JOIN customer
		ON customer.customer_id = invoice.customer_id 
		WHERE customer.last_name = _last_name
	);	
END;
$$

SELECT priceComparison('Leung');



