--Coleta CPF, NOME, e os seus números de telefone (isso em ARRAY)
SELECT P.CPF,P.NOME_PESSOA, T.*
FROM TB_PESSOA P, TABLE(P.L_FONES) T;

SELECT F.ID_Filme, F.Faixa_Etaria, F.Data_Inicio, F.Data_Fim, F.Diretor, F.Genero, F.Nome_Filme, T.*
FROM TB_FILME F, TABLE(F.Atores) T;

SELECT DEREF(SB.CINEMA) AS CINEMA FROM TB_SNACK_BAR SB;