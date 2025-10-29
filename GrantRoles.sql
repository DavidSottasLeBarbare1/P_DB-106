/*Création des roles et des utilisateurs*/

/*Création du role "admin"*/
CREATE ROLE 'admin';

GRANT ALL PRIVILEGES ON db_thanos_pizza.* TO 'admin' WITH GRANT OPTION;
GRANT CREATE USER, DROP, GRANT OPTION ON *.* TO 'admin';

/*Création du role "manager"*/
CREATE ROLE 'manager';

GRANT SELECT, INSERT, UPDATE, DELETE ON db_thanos_pizza.t_commande, db_thanos_pizza.t_livraison, db_thanos_pizza.t_article TO 'manager';
GRANT SELECT ON db_thanos_pizza.t_paiement TO 'manager';

/*Création du role "pizzaiolo"*/
CREATE ROLE 'pizzaiolo';

GRANT SELECT ON db_thanos_pizza.t_commande TO 'pizzaiolo';
GRANT UPDATE (statut) ON db_thanos_pizza.t_commande TO 'pizzaiolo';
GRANT SELECT, UPDATE ON db_thanos_pizza.t_ligne_commande TO 'pizzaiolo';

/*Création du role "livreur"*/
CREATE ROLE 'livreur';

GRANT SELECT ON db_thanos_pizza.t_commande TO 'livreur';
GRANT SELECT, UPDATE (statut) ON db_thanos_pizza.t_livraison TO 'livreur';

/*Création du role "agent_caisse"*/
CREATE ROLE 'agent_caisse';

GRANT SELECT ON db_thanos_pizza.t_commande TO 'agent_caisse';
GRANT SELECT, INSERT, UPDATE ON db_thanos_pizza.t_paiement TO 'agent_caisse';

/*Création du role "analyste"*/
CREATE ROLE 'analyste';

GRANT SELECT ON db_thanos_pizza.* TO 'analyste';

/*Création de tout les utilisateurs*/
CREATE USER 'admin_man'@'localhost' IDENTIFIED BY 'password_ironman';
CREATE USER 'captain_manager'@'localhost' IDENTIFIED BY 'password_captainamerica';
CREATE USER 'thor_pizzaiolo'@'localhost' IDENTIFIED BY 'password_thor';
CREATE USER 'hulk_livreur'@'localhost' IDENTIFIED BY 'password_hulk';
CREATE USER 'wonder_caisse'@'localhost' IDENTIFIED BY 'password_wonderwoman';
CREATE USER 'black_analyste'@'localhost' IDENTIFIED BY 'password_blackpanther';

/*Assignation des roles*/
GRANT 'admin' TO 'admin_man'@'localhost';
GRANT 'manager' TO 'captain_manager'@'localhost';
GRANT 'pizzaiolo' TO 'thor_pizzaiolo'@'localhost';
GRANT 'livreur' TO 'hulk_livreur'@'localhost';
GRANT 'agent_caisse' TO 'wonder_caisse'@'localhost';
GRANT 'analyste' TO 'black_analyste'@'localhost';