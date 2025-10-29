/*
Requète 1 : 
"SELECT c.commande_id, c.date_creation, c.statut, cl.nom AS client
FROM t_commande AS c
JOIN t_client AS cl ON c.client_fk = cl.client_id
WHERE c.statut = 'en_livraison' AND c.date_creation > '2025-01-01'
ORDER BY c.date_creation DESC;" : 
*/

/*Création d'un index composite sur statut et date_creation*/
CREATE INDEX commande_statut_date_idx
ON t_commande (statut, date_creation);

/*Création d'un index unique sur client_fk*/
CREATE INDEX commande_client_fk_idx
ON t_commande (client_fk);

/*
Requète 2 : 
"SELECT a.npa AS zone_npa, COUNT(c.commande_id) AS nb
FROM t_commande AS c
JOIN t_adresse AS a ON c.adresse_livraison_fk = a.adresse_id
WHERE c.type = 'livraison' AND HOUR(c.date_creation) BETWEEN 18 AND 21
GROUP BY a.npa
ORDER BY nb DESC;" :
*/

/*Création d'un index composite sur type  et date_creation*/
CREATE INDEX commande_type_date_idx
ON t_commande (type, date_creation);

/*Création d'un index unique sur adresse_fk*/
CREATE INDEX commande_adresse_fk_idx
ON t_commande (adresse_fk);

/*Création d'un index unique sur npa
CREATE INDEX adresse_npa_idx
ON t_adresse (npa);


