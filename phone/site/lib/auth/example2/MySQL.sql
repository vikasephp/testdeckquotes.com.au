DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,

    username CHAR(32) NOT NULL,
    password CHAR(32) NOT NULL,
    email VARCHAR(255) NOT NULL,
    fullname VARCHAR(255) NOT NULL,

    UNIQUE (username),
    UNIQUE (email),
    PRIMARY KEY(user_id)
);
INSERT INTO users (username, password, email, fullname) VALUES ('adnoctum', '0d39755ef41510da4a95cb6c9d63b92a', 'jcesar@phreaker.net', 'Adnoctum');
INSERT INTO users (username, password, email, fullname) VALUES ('jcesar', '7519f8cf921cc0a5ba1cf0a6f5c94505', 'jcesar@icreativa.net', 'Julio César Carrascal Urquijo');
INSERT INTO users (username, password, email, fullname) VALUES ('guest', '084e0343a0486ff05530df6c705c8bb4', 'guest@example.com', 'Guest user');
INSERT INTO users (username, password, email, fullname) VALUES ('god', 'a4757d7419ff3b48e92e90596f0e7548', 'god@heaven.net', 'God in it\'s Heaven');


DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
	group_id INT NOT NULL AUTO_INCREMENT,

	name CHAR(32) NOT NULL,
	title VARCHAR(255) NOT NULL,	# this is for internationalization purposes.

	PRIMARY KEY(group_id)
);
INSERT INTO groups (name, title) VALUES ('members', 'Miembros');
INSERT INTO groups (name, title) VALUES ('admins', 'Administradores');


DROP TABLE IF EXISTS users_groups;
CREATE TABLE users_groups (
	user_id INT NOT NULL,
	group_id INT NOT NULL,

	KEY user_id(group_id),
	KEY group_id(user_id)
);
INSERT INTO users_groups (user_id, group_id) VALUES (1, 1);
INSERT INTO users_groups (user_id, group_id) VALUES (2, 1);
INSERT INTO users_groups (user_id, group_id) VALUES (3, 1);
INSERT INTO users_groups (user_id, group_id) VALUES (4, 2);
