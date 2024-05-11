CREATE TABLE users (
 id_users BIGSERIAL,
 email VARCHAR,
 password VARCHAR
);


ALTER TABLE users ADD CONSTRAINT users_pkey PRIMARY KEY (id_users);

CREATE TABLE lines (
 line_number BIGSERIAL,
 user INTEGER
);


ALTER TABLE lines ADD CONSTRAINT lines_pkey PRIMARY KEY (line_number);

CREATE TABLE tasks (
 id_task BIGSERIAL,
 manual INTEGER,
 user INTEGER,
 line INTEGER,
 isFinished? BOOLEAN
);


ALTER TABLE tasks ADD CONSTRAINT tasks_pkey PRIMARY KEY (id_task);

CREATE TABLE manuals (
 id_manual BIGSERIAL,
 product INTEGER,
 file INTEGER,
 description VARCHAR
);


ALTER TABLE manuals ADD CONSTRAINT manuals_pkey PRIMARY KEY (id_manual);

CREATE TABLE products (
 id_product BIGSERIAL,
 type VARCHAR,
 name VARCHAR,
 title VARCHAR
);


ALTER TABLE products ADD CONSTRAINT products_pkey PRIMARY KEY (id_product);

CREATE TABLE files (
 id_file BIGSERIAL,
 type VARCHAR,
 file_path VARCHAR
);


ALTER TABLE files ADD CONSTRAINT files_pkey PRIMARY KEY (id_file);

ALTER TABLE lines ADD CONSTRAINT lines_user_fkey FOREIGN KEY (user) REFERENCES users(id_users);
ALTER TABLE tasks ADD CONSTRAINT tasks_manual_fkey FOREIGN KEY (manual) REFERENCES manuals(id_manual);
ALTER TABLE tasks ADD CONSTRAINT tasks_user_fkey FOREIGN KEY (user) REFERENCES users(id_users);
ALTER TABLE tasks ADD CONSTRAINT tasks_line_fkey FOREIGN KEY (line) REFERENCES lines(line_number);
ALTER TABLE manuals ADD CONSTRAINT manuals_product_fkey FOREIGN KEY (product) REFERENCES products(id_product);
ALTER TABLE manuals ADD CONSTRAINT manuals_file_fkey FOREIGN KEY (file) REFERENCES files(id_file);