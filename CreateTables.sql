DROP TABLE IF EXISTS t_client;
CREATE TABLE t_client(
   client_id INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   email VARCHAR(50),
   telephone VARCHAR(50),
   PRIMARY KEY(client_id)
);

DROP TABLE IF EXISTS t_article;
CREATE TABLE t_article(
   article_id INT,
   type ENUM('pizza' , 'topping' , 'boisson' , 'dessert'),
   nom VARCHAR(50),
   prix_ttc DECIMAL(19,4),
   tva DECIMAL(15,2),
   actif BOOLEAN,
   PRIMARY KEY(article_id)
);

DROP TABLE IF EXISTS t_livreur;
CREATE TABLE t_livreur(
   livreur_id INT,
   nom VARCHAR(50),
   actif BOOLEAN,
   PRIMARY KEY(livreur_id)
);

DROP TABLE IF EXISTS t_adresse;
CREATE TABLE t_adresse(
   adresse_id INT,
   rue VARCHAR(50),
   npa INT,
   localite VARCHAR(50),
   latitude FLOAT,
   longitude FLOAT,
   client_fk INT NOT NULL,
   PRIMARY KEY(adresse_id),
   FOREIGN KEY(client_fk) REFERENCES t_client(client_id)
);

/*!50503 SET character_set_client = utf8mb4 */;
DROP TABLE IF EXISTS t_commande;
CREATE TABLE t_commande(
   commande_id INT,
   date_creation DATETIME,
   type ENUM('emporter' , 'sur_place' , 'livraison'),
   montant DECIMAL(19,4),
   statut ENUM('reçue' , 'en_preparation' , 'en_livraison', 'livrée', 'annulée'),
   adresse_fk INT,
   client_fk INT NOT NULL,
   PRIMARY KEY(commande_id),
   FOREIGN KEY(adresse_fk) REFERENCES t_adresse(adresse_id),
   FOREIGN KEY(client_fk) REFERENCES t_client(client_id)
);

DROP TABLE IF EXISTS t_paiement;
CREATE TABLE t_paiement(
   paiement_id INT,
   mode ENUM('twint' , 'carte' , 'cash', 'bon'),
   montant VARCHAR(50),
   date_paiement VARCHAR(50),
   commande_fk INT NOT NULL,
   PRIMARY KEY(paiement_id),
   FOREIGN KEY(commande_fk) REFERENCES t_commande(commande_id)
);

	
DROP TABLE IF EXISTS t_ligne_commande;
CREATE TABLE t_ligne_commande(
   lignedecommande_id INT,
   quantite INT,
   prix_unitaire DECIMAL(19,4),
   eventuelstoppings VARCHAR(50),
   parent_ligne_fk INT,
   article_fk INT NOT NULL,
   commande_fk INT NOT NULL,
   PRIMARY KEY(lignedecommande_id),
   UNIQUE(parent_ligne_fk),
   FOREIGN KEY(parent_ligne_fk) REFERENCES t_ligne_commande(lignedecommande_id),
   FOREIGN KEY(article_fk) REFERENCES t_article(article_id),
   FOREIGN KEY(commande_fk) REFERENCES t_commande(commande_id)
);

DROP TABLE IF EXISTS t_livraison;
CREATE TABLE t_livraison(
   livraison_id INT,
   date_depart DATETIME,
   date_arrivee DATETIME,
   distance DECIMAL(15,2),
   statut ENUM('recue' , 'en_preparation' , 'en_livraison', 'livree', 'annulee'),
   commande_fk INT NOT NULL,
   livreur_fk INT NOT NULL,
   PRIMARY KEY(livraison_id),
   FOREIGN KEY(commande_fk) REFERENCES t_commande(commande_id),
   FOREIGN KEY(livreur_fk) REFERENCES t_livreur(livreur_id)
);
