--DROPS

DROP TYPE TP_FONE FORCE;
DROP TYPE TP_ENDERECO FORCE;
DROP TYPE TP_PESSOA FORCE;
DROP TYPE TP_FUNCIONARIO FORCE;
DROP TYPE TP_CINEMA FORCE;
DROP TYPE TP_SETOR FORCE;
DROP TYPE TP_SETOR_FUNC FORCE;
DROP TYPE TP_TRABALHA FORCE;
DROP TYPE TP_SNACK_BAR FORCE;
DROP TYPE TP_PRODUTO FORCE;
DROP TYPE TP_SALA FORCE;
DROP TYPE TP_ATOR FORCE;
DROP TYPE TP_NT_ATOR FORCE;
DROP TYPE TP_FILME FORCE;
DROP TYPE TP_FILME_SALA FORCE;
DROP TYPE TP_INGRESSO FORCE;
DROP TYPE TP_VENDE_INGRESSO FORCE;
DROP TYPE TP_EXIBE FORCE;








--Criação de TIPOS

CREATE OR REPLACE TYPE TP_FONE AS OBJECT(--Criando o tipo de telefone para depois criar NT
    NUMERO NUMBER
);
/
CREATE OR REPLACE TYPE TP_FONES AS VARRAY(5) OF TP_FONE;
/
CREATE OR REPLACE TYPE TP_ENDERECO AS OBJECT(
    CEP VARCHAR2(9),
    RUA VARCHAR2(30),
    --BAIRRO ADICIONADO VIA ALTER TYPE
    CIDADE VARCHAR2(30),
    NUMERO_ENDERECO NUMBER
);
/
ALTER TYPE TP_ENDERECO
    ADD ATTRIBUTE (BAIRRO VARCHAR2(30))CASCADE;

CREATE OR REPLACE TYPE TP_PESSOA AS OBJECT(
    CPF NUMBER,
    NOME_PESSOA VARCHAR2(30),
    DATA_NASC DATE,
    ENDERECO TP_ENDERECO,
    L_FONES TP_FONES
)NOT FINAL;
/
CREATE OR REPLACE TYPE TP_FUNCIONARIO UNDER TP_PESSOA(
    ID_FUNCIONARIO NUMBER /*NOT NULL*/,
    ID_SUPERVISOR NUMBER,
    SALARIO DECIMAL(6,2)
);--Não tenho certeza se seria dessa forma, 
/
CREATE OR REPLACE TYPE TP_CINEMA AS OBJECT(
    CNPJ NUMBER,
    NUMERO_SALAS NUMBER,
    NOME_CINEMA VARCHAR2(30) /*NOT NULL*/,
    ENDERECO_CINE TP_ENDERECO
);
/
CREATE OR REPLACE TYPE TP_SETOR AS OBJECT(
    ID_SETOR NUMBER,
    NOME_SETOR VARCHAR2(30) /*NOT NULL*/,
    L_FONES TP_FONES
);
/
CREATE OR REPLACE TYPE TP_SETOR_FUNC AS OBJECT( --RELACAO SETOR-FUNC
    ID_SETOR_FUNC NUMBER,
    SETOR REF TP_SETOR, --refers tp_setor
    FUNCIONARIO REF TP_FUNCIONARIO --refers tp_funcionario
);
/
CREATE OR REPLACE TYPE TP_TRABALHA AS OBJECT(
    ID_TRABALHA NUMBER,
    CINEMA REF TP_CINEMA, --refers TP_CINEMA
    FUNCIONARIO REF TP_FUNCIONARIO --refers TP_FUNCIONARIO
);
/
CREATE OR REPLACE TYPE TP_SNACK_BAR AS OBJECT(
    ID_Snack_Bar NUMBER,
    CINEMA REF TP_CINEMA, --refers TP_CINEMA
    Horario_Abre TIMESTAMP, --no oracle live time nao é um tipo de dado caso forem fazer testes modificar.
    Horario_Fecha TIMESTAMP -- pode colocar timestamp pra rodar... mas ai esse tipo de dado tem a data + hora :/
);
/
CREATE OR REPLACE TYPE TP_PRODUTO AS OBJECT(
    ID_Produto NUMBER,
    --ID_Snack_Bar NUMBER, --refers TP_SNACK_BAR
    SNACK_BAR REF TP_SNACK_BAR, --refers TP_SNACK_BAR
    Nome_Produto VARCHAR2(30),
    Preco DECIMAL(6,2),
    MEMBER PROCEDURE alteraPreco(SELF TP_PRODUTO),
    ORDER MEMBER FUNCTION comparaPreco(X TP_PRODUTO) RETURN DECIMAL
);
/
CREATE OR REPLACE TYPE TP_SALA AS OBJECT(
    ID_SALA NUMBER,
    CAPACIDADE NUMBER
);
/
CREATE OR REPLACE TYPE TP_ATOR AS OBJECT( 
    NOME_ATOR VARCHAR(30) 
);
/
CREATE TYPE TP_NT_ATOR AS TABLE OF TP_ATOR;
/
CREATE OR REPLACE TYPE TP_FILME AS OBJECT( 
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
CREATE OR REPLACE TYPE TP_FILME_SALA AS OBJECT(
    ID_FILME_SALA NUMBER,
    FILME REF TP_FILME, --refers TP_FILME
    SALA REF TP_SALA --refers TP_SALA
);
/

CREATE OR REPLACE TYPE TP_INGRESSO AS OBJECT(
    ID_Ingresso NUMBER,
    FILME REF TP_FILME, --refers TP_FILME
    Preco_Ingresso DECIMAL(4, 2), --maior que 50c
    Horario TIMESTAMP
);
/
CREATE OR REPLACE TYPE TP_VENDE_INGRESSO AS OBJECT(
    ID_VENDE_INGRESSO NUMBER,
    INGRESSO REF TP_INGRESSO, --refers TP_INGRESSO
    PESSOA REF TP_PESSOA, --refers TP_PESSOA
    FUNCIONARIO REF TP_FUNCIONARIO --refers TP_FUNCIONARIO
);
/
CREATE OR REPLACE TYPE TP_EXIBE AS OBJECT(
    ID_EXIBE NUMBER,
    SALA REF TP_SALA, --refers TP_SALA
    FILME REF TP_FILME, --refers TP_FILME
    PESSOA REF TP_PESSOA --refers TP_PESSOA
);
/
CREATE OR REPLACE TYPE BODY TP_PRODUTO AS

MEMBER PROCEDURE alteraPreco(SELF TP_PRODUTO, novo_preco DECIMAL) IS
BEGIN
SELF.Preco := novo_preco;
END;

ORDER MEMBER FUNCTION comparaPreco(X TP_PRODUTO)
RETURN DECIMAL IS

BEGIN
RETURN SELF.Preco - X.Preco;
END;
END;
/




--Criacao de TABELAS --sendo feito no criacaoTabelasAUXZé
