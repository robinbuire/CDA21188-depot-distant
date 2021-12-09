DROP DATABASE if EXISTS eval;
CREATE DATABASE eval;
USE eval;

CREATE TABLE clients
(
clients_num INT NOT NULL,
clients_nom VARCHAR(50),
clients_adresse VARCHAR(50),
clients_tel VARCHAR(30),
PRIMARY KEY (clients_num)
);

CREATE TABLE commande 
(
commande_num INT NOT NULL,
clients_num INT NOT NULL,
commande_date DATETIME,
commande_obs VARCHAR(50),
PRIMARY KEY (commande_num),
FOREIGN KEY (clients_num) REFERENCES clients(clients_num)
);


CREATE TABLE produit 
(
produit_num INT NOT NULL,
produit_libelle VARCHAR(50),
produit_description VARCHAR(50),
PRIMARY KEY (produit_num)
);


CREATE TABLE est_compose
(
commande_num INT NOT NULL,
produit_num INT NOT NULL,
est_qte INT,
PRIMARY KEY (commande_num, produit_num),
FOREIGN KEY (commande_num) REFERENCES commande(commande_num),
FOREIGN KEY (produit_num) REFERENCES produit (produit_num)
);


CREATE INDEX index_client_nom
ON clients (clients_nom);

