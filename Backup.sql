/*Creating a variable for the Date*/
DATE=$(date '+%Y-%m-%d')

/*Complete backup*/
mysqldump -u root -p db_thanos_pizza > scripts/db_thanos_pizza_entire.sql

/*Creating a variable for the Date*/
mysqldump -u root -p db_thanos_pizza t_client --where="last_update >= '$DATE 00:00:00'" > scripts/db_thanos_pizza_dif.sql

mysqldump -u root -p db_thanos_pizza t_article --where="last_update >= '$DATE 00:00:00'" >> scripts/db_thanos_pizza_dif.sql

mysqldump -u root -p db_thanos_pizza t_adresse --where="last_update >= '$DATE 00:00:00'" >> scripts/db_thanos_pizza_dif.sql

mysqldump -u root -p db_thanos_pizza t_livreur --where="last_update >= '$DATE 00:00:00'" >> scripts/db_thanos_pizza_dif.sql

mysqldump -u root -p db_thanos_pizza t_commande --where="last_update >= '$DATE 00:00:00'" >> scripts/db_thanos_pizza_dif.sql

mysqldump -u root -p db_thanos_pizza t_paiement --where="last_update >= '$DATE 00:00:00'" >> scripts/db_thanos_pizza_dif.sql

mysqldump -u root -p db_thanos_pizza t_livraison --where="last_update >= '$DATE 00:00:00'" >> scripts/db_thanos_pizza_dif.sql

mysqldump -u root -p db_thanos_pizza t_ligne_commande --where="last_update >= '$DATE 00:00:00'" >> scripts/db_thanos_pizza_dif.sql

/*Scenarios*/

/*A client changes his telephone number*/
UPDATE t_client 
SET telephone='+41 77 123 45 67'
WHERE nom = "patrick";

/*A client orders a pizza for the first time*/
INSERT INTO t_client (nom, prenom, email, telephone)
VALUES ('LeBlanc', 'Daniel', 'DanieLeBlanc@email.com', '+41 76 123 45 67')

/*Restoring the database in case any data has been lost.*/

/*Entire database*/
mysql -u root -p db_thanos_pizza < db_thanos_pizza_entire.sql

/*Differential database*/
mysql -u root -p db_thanos_pizza < db_thanos_pizza_dif.sql