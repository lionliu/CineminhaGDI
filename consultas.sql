SELECT MAX (C.Numero_Salas) FROM Cinema C;

SELECT AVG (I.Preco_Ingresso) FROM Ingresso I;

SELECT MIN (I.Preco_Ingresso) FROM Ingresso I;

SELECT *
FROM Ingresso I 
WHERE I.Preco_Ingresso < COLOCARVALOR; 

SELECT COUNT(I.ID_Filme), I.Horario 
FROM Ingresso I 
WHERE I.Preco_Ingresso > COLOCARVALOR 
AND I.Horario IN ('METRICA1', 'METRICA2')
AND I.ID_Filme BETWEEN METRICA1 AND METRICA2;

SELECT EP.Bairro, EP.Cidade 
FROM Endereco_Pessoa EP 
WHERE EP.Cidade 
LIKE 'Rec%';

UPDATE Pessoa  
SET Data_Nasc = to_date('23/02/1997', 'dd/mm/yyyy')
WHERE Nome_Pessoa = 'Xuliano'; 

DELETE FROM Pessoa
WHERE Nome_Pessoa = 'PNome';

SELECT * 
FROM PESSOA
ORDER BY Nome_Pessoa;

SELECT TC.CNPJ_Telefone 
FROM Telefone_Cinema TC
WHERE TC.CNPJ_Telefone
IS NOT NULL; --aqui poderia ser null tb, para resgatar os cnpj de cinemas que nao tivessem telefone.

SELECT C.Nome_Cinema, TC.telefone
FROM Cinema C 
LEFT OUTER JOIN Telefone_Cinema TC
ON C.CNPJ=TC.CNPJ_Telefone;

SELECT C.Nome_Cinema, TC.telefone
FROM Cinema C 
INNER JOIN Telefone_Cinema TC
ON C.CNPJ=TC.CNPJ_Telefone;
