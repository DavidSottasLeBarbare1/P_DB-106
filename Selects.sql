/*Requête 1*/
SELECT a.nom AS "nom", SUM(lc.quantite) AS "quantiteTotal"
FROM t_ligne_commande AS lc
JOIN t_article AS a ON lc.article_fk = a.article_id
WHERE a.type = 'pizza'
GROUP BY nom
ORDER BY quantiteTotal DESC
LIMIT 10; 

/*Requête 2*/
SELECT a.nom AS "nom", COUNT(*) AS "nombreTotal"
FROM t_ligne_commande AS lc
JOIN t_article AS a ON lc.article_fk = a.article_id
WHERE a.type = 'topping'
GROUP BY nom
ORDER BY nombreTotal DESC;

/*Requête 3*/
SELECT DATE(c.date_creation) AS "date", ROUND(SUM(c.montant), 2) AS "chiffreAffaire"
FROM t_commande AS c
WHERE c.statut = 'livrée'
GROUP BY date
ORDER BY date;

/*Requête 4*/
SELECT a.npa AS "npa", a.localite AS "localite", ROUND(SUM(c.montant), 2) AS "chiffreAffaire"
FROM t_commande AS c
JOIN t_adresse AS a ON c.adresse_fk = a.adresse_id
WHERE c.statut = 'livrée'
GROUP BY npa, localite
ORDER BY npa;

/*Requête 5*/
SELECT HOUR(c.date_creation) AS "heure", COUNT(*) AS "nbrCommande"
FROM t_commande AS c
GROUP BY HOUR(heure)
ORDER BY nbrCommande DESC;

/*Requête 6*/
SELECT cl.nom AS "nom",cl.prenom AS "prenom", COUNT(c.commande_id) AS "nbrCommande"
FROM t_commande AS c
JOIN t_client AS cl ON c.client_fk = cl.client_id
GROUP BY cl.client_id, nom, prenom
HAVING nbrCommande >= 5
ORDER BY nbrCommande DESC, nom ASC;

/*Requête 7*/
SELECT c.commande_id AS "commande", ROUND(SUM(lc.quantite * lc.prix_unitaire), 2) AS "montant"
FROM t_commande AS c
JOIN t_ligne_commande AS lc ON commande = lc.commande_fk
GROUP BY commande
ORDER BY commande ASC;

/*Requête 8*/
SELECT c.commande_id AS "commande", ROUND(SUM(p.montant), 2) AS "montant"
FROM t_commande AS c
JOIN t_paiement AS p ON p.commande_fk = commande
GROUP BY commande
ORDER BY commande ASC;

/*Requête 9*/
SELECT c.type AS "type", COUNT(*) AS "nbrCommande"
FROM t_commande AS c
GROUP BY type
ORDER BY nbrCommande DESC;

/*Requête 10*/
SELECT l.livreur_id AS "livreur", l.nom AS "nom", ROUND(AVG(TIMESTAMPDIFF(MINUTE, liv.date_depart, liv.date_arrivee)), 2) AS "delaiMoyen"
FROM t_livraison AS liv
JOIN t_livreur AS l ON liv.livreur_fk = livreur
WHERE liv.date_depart IS NOT NULL AND liv.date_arrivee IS NOT NULL
GROUP BY livreur, nom
ORDER BY delaiMoyen ASC;

