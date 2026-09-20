DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
    account_key INT NOT NULL AUTO_INCREMENT,

    login CHAR(32) NOT NULL,
    pass CHAR(32) NOT NULL,
    email VARCHAR(255) NOT NULL,
    fullname VARCHAR(255) NOT NULL,

    UNIQUE (login),
    UNIQUE (email),
    PRIMARY KEY(account_key)
);
INSERT INTO accounts (login, pass, email, fullname) VALUES ('adnoctum', '0d39755ef41510da4a95cb6c9d63b92a', 'jcesar@phreaker.net', 'Adnoctum');
INSERT INTO accounts (login, pass, email, fullname) VALUES ('jcesar', '7519f8cf921cc0a5ba1cf0a6f5c94505', 'jcesar@icreativa.net', 'Julio César Carrascal Urquijo');
INSERT INTO accounts (login, pass, email, fullname) VALUES ('guest', '084e0343a0486ff05530df6c705c8bb4', 'guest@example.com', 'Guest user');
INSERT INTO accounts (login, pass, email, fullname) VALUES ('god', 'a4757d7419ff3b48e92e90596f0e7548', 'god@heaven.net', 'God in it\'s Heaven');
