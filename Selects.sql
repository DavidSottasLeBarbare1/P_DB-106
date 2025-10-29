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

