--Coleta CPF, NOME, e os seus números de telefone (isso em ARRAY)
SELECT P.CPF,P.NOME_PESSOA, T.*
FROM TB_PESSOA P, TABLE(P.L_FONES) T;
