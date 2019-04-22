SELECT MAX (C.Numero_Salas) FROM Cinema C;

SELECT AVG (I.Preco_Ingresso) FROM Ingresso I;

SELECT MIN (I.Preco_Ingresso) FROM Ingresso I;

SELECT COUNT I.ID_Filme, I.Horario 
FROM Ingresso I 
WHERE I.Preco_Ingresso > COLOCARVALOR 
AND I.Horario IN ('METRICA1', 'METRICA2')
AND I.ID_Filme BETWEEN METRICA1 AND METRICA2;
