/*Changing variables*/
SET FOREIGN_KEY_CHECKS = 0;
SET GLOBAL local_infile = 'ON';

/*Loading every tsv files into the database*/
LOAD DATA LOCAL INFILE '/scripts/t_client.tsv'
INTO TABLE t_client
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(client_id, nom, prenom, email, telephone);

LOAD DATA LOCAL INFILE '/scripts/t_livreur.tsv'
INTO TABLE t_livreur
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(livreur_id, nom, actif);

LOAD DATA LOCAL INFILE '/scripts/t_article.tsv'
INTO TABLE t_article
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(article_id, type, nom, prix_ttc, tva, actif);

LOAD DATA LOCAL INFILE '/scripts/t_adresse.tsv'
INTO TABLE t_adresse
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(adresse_id, client_fk, rue, npa, localite, latitude, longitude);

LOAD DATA LOCAL INFILE '/scripts/t_commande.tsv'
INTO TABLE t_commande
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(commande_id, client_fk, type, @adresse_fk, date_creation, @statut)
SET adresse_fk = NULLIF(@adresse_fk, ''),
    statut = TRIM(@statut);

LOAD DATA LOCAL INFILE '/scripts/t_ligne_commande.tsv'
INTO TABLE t_ligne_commande
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ligne_id, commande_fk, article_fk, quantite, prix_unitaire, parent_ligne_fk);

LOAD DATA LOCAL INFILE '/scripts/t_livraison.tsv'
INTO TABLE t_livraison
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(livraison_id, commande_fk, livreur_fk, statut, date_depart, date_arrivee);


LOAD DATA LOCAL INFILE '/scripts/t_paiement.tsv'
INTO TABLE t_paiement
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(paiement_id, commande_fk, mode, montant, date_paiement);