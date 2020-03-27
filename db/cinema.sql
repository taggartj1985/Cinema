DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;


CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customer(id) ON DELETE CASCADE,
  film_id INT REFERENCES film(id) ON DELETE CASCADE
  );

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  name VARCHAR (255),
  funds INT);



CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title VARCHAR (255),
  price INT
);



-- CREATE TABLE tickets(
--   id SERIAL PRIMARY KEY,
--   customers_id INT REFERENCES customers(id) ON DELETE CASCADE,
--   films_id INT REFERENCES films(id) ON DELETE CASCADE
--   );
