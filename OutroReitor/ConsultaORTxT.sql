--Coleta CPF, NOME, e os seus números de telefone (isso em ARRAY)
SELECT P.CPF,P.NOME_PESSOA, T.*
FROM TB_PESSOA P, TABLE(P.L_FONES) T;

SELECT F.ID_Filme, F.Faixa_Etaria, F.Data_Inicio, F.Data_Fim, F.Diretor, F.Genero, F.Nome_Filme, T.*
FROM TB_FILME F, TABLE(F.Atores) T;

CREATE OR REPLACE TYPE TP_FILM AS OBJECT( 
    ID_Filme INTEGER, 
    Faixa_Etaria NUMBER, 
    Data_Inicio DATE, 
    Data_Fim DATE, 
    Diretor VARCHAR(30), 
    Genero VARCHAR(30), 
    Nome_Filme VARCHAR(30), 
    Atores TP_NT_ATOR 
); 
/

SELECT DEREF(SB.CINEMA) AS CINEMA FROM TB_SNACK_BAR;