--Coleta CPF, NOME, e os seus números de telefone (isso em ARRAY)
SELECT P.CPF,P.NOME_PESSOA, T.*
FROM TB_PESSOA P, TABLE(P.L_FONES) T;

SELECT F.ID_Filme, F.Faixa_Etaria, F.Data_Inicio, F.Data_Fim, F.Diretor, F.Genero, F.Nome_Filme, T.*
FROM TB_FILME F, TABLE(F.Atores) T;

SELECT DEREF(SB.CINEMA) AS CINEMA FROM TB_SNACK_BAR SB;

SELECT VALUE(p) AS mp FROM TB_PRODUTO p;


-- Não tá funcionando:
DECLARE
mp TP_PRODUTO;
m DECIMAL;

BEGIN
SELECT VALUE(p) INTO mp FROM TB_PRODUTO p
WHERE p.ID_Produto = 50; -- Pipoca

SELECT d.comparaPreco(mp) INTO m FROM TB_PRODUTO d WHERE
d.ID_Produto = 52; -- Texero Acai

IF m > 0 THEN DBMS_OUTPUT.PUT_LINE('Texero Acai' || ' tem preco MAIOR do que '
||TO_CHAR(mp.Nome_Produto) ); END IF;

IF m = 0 THEN DBMS_OUTPUT.PUT_LINE('Texero Acai' || ' tem preco IGUAL ao '
||TO_CHAR(mp.Nome_Produto) ); END IF;

IF m < 0 THEN DBMS_OUTPUT.PUT_LINE('Texero Acai' || ' tem preco MENOR do que '
||TO_CHAR(mp.Nome_Produto) );END IF;

END;