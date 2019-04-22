DROP TABLE Pessoa;
DROP TABLE Telefone_Pessoa;
DROP TABLE Endereco_Pessoa;
DROP TABLE Funcionario;
DROP TABLE Setor;
DROP TABLE Funcionario_Supervisor;
DROP TABLE Pessoa_Funcionario;
DROP TABLE Cinema;
DROP TABLE Endereco_Cinema;
DROP TABLE Telefone_Cinema;
DROP TABLE Trabalha;
DROP TABLE Snack_Bar;
DROP TABLE Produto;
DROP TABLE Sala;
DROP TABLE Filme;
DROP TABLE Filme_Sala;
DROP TABLE Genero;
DROP TABLE Diretor;
DROP TABLE Ator;
DROP TABLE Ingresso;
DROP TABLE Vende_Ingresso;
DROP TABLE Exibe;

CREATE TABLE Pessoa (
    CPF NUMBER,
    Nome_Pessoa VARCHAR2(30) NOT NULL,
    Data_Nasc DATE,
    CONSTRAINT Pessoa_pk PRIMARY KEY (CPF)
);

CREATE TABLE Telefone_Pessoa (
    CPF_Telefone NUMBER,
    telefone NUMBER,
    CONSTRAINT Telefone_pk PRIMARY KEY (CPF_Telefone, telefone)
    CONSTRAINT Telefone_fk FOREIGN KEY (CPF_Telefone) REFERENCES Pessoa (CPF)
);

CREATE TABLE Endereco_Pessoa (
    CPF_Endereco NUMBER,
    CEP VARCHAR2(9),
    Rua VARCHAR2(30),
    Bairro VARCHAR2(30),
    Cidade VARCHAR2(30),
    Numero_Endereco NUMBER,
    CONSTRAINT Endereco_Pessoa_pk PRIMARY KEY (CPF_Endereco, CEP),
    CONSTRAINT Endereco_Pessoa_fk FOREIGN KEY (CPF_Endereco) REFERENCES Pessoa (CPF)
);

CREATE TABLE Funcionario (
    ID_Funcionario NUMBER,
    ID_Supervisor NUMBER
    Salario DECIMAL (4, 2),
    CONSTRAINT Funcionario_pk PRIMARY KEY (ID_Funcionario),
    CONSTRAINT Funcionario_pk2 FOREIGN KEY (ID_Supervisor) REFERENCES Funcionario (ID_Funcionario),
);

CREATE TABLE Setor(
    ID_Setor NUMBER,
    Nome_Setor VARCHAR2(30),
    CONSTRAINT Setor_pk PRIMARY KEY (ID_Setor)
);

CREATE TABLE Setor_Funcionario (
    ID_Funcionario NUMBER,
    ID_Setor NUMBER,
    CONSTRAINT Setor_pk PRIMARY KEY (ID_Funcionario, ID_Setor),
    CONSTRAINT Setor_fk FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario (ID_Funcionario),
    CONSTRAINT Setor_fk2 FOREIGN KEY (ID_Setor) REFERENCES Setor (ID_Setor)
);

CREATE TABLE Pessoa_Funcionario (
    CPF NUMBER,
    ID_Funcionario NUMBER,
    CONSTRAINT Pessoa_Funcionario_pk PRIMARY KEY (CPF, ID_Funcionario),
    CONSTRAINT Pessoa_Funcionario_fk FOREIGN KEY (CPF) REFERENCES Pessoa (CPF),
    CONSTRAINT Pessoa_Funcionario_fk2 FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario (ID_Funcionario)
);

CREATE TABLE Cinema (
    CNPJ NUMBER,
    Numero_Salas NUMBER,
    Nome_Cinema VARCHAR2(30),
    CONSTRAINT Cinema_pk PRIMARY KEY (CNPJ)
);

CREATE TABLE Endereco_Cinema (
    CNPJ_Endereco NUMBER,
    CEP VARCHAR2(9),
    Rua VARCHAR2(30),
    Bairro VARCHAR2(30),
    Cidade VARCHAR2(30),
    Numero_Endereco NUMBER,
    CONSTRAINT Endereco_Cinema_pk PRIMARY KEY (CNPJ_Endereco, CEP),
    CONSTRAINT Endereco_Cinema_fk FOREIGN KEY (CNPJ_Endereco) REFERENCES Cinema (CNPJ)
);

CREATE TABLE Telefone_Cinema (
    CNPJ_Telefone NUMBER,
    telefone NUMBER,
    CONSTRAINT Telefone_Cinema_pk PRIMARY KEY (CNPJ_Telefone, telefone)
    CONSTRAINT Telefone_Cinema_fk FOREIGN KEY (CNPJ_Telefone) REFERENCES Cinema (CNPJ)
);

CREATE TABLE Trabalha (
    CNPJ_Trabalha NUMBER,
    ID_Funcionario NUMBER,
    CONSTRAINT Trabalha_pk PRIMARY KEY (CNPJ_Trabalha, ID_Funcionario),
    CONSTRAINT Trabalha_fk FOREIGN KEY (CNPJ_Trabalha) REFERENCES Cinema (CNPJ),
    CONSTRAINT Trabalha_fk2 FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario (ID_Funcionario)
);

CREATE TABLE Snack_Bar (
    ID_Snack_Bar NUMBER,
    CNPJ NUMBER,
    Horario_Abre TIME,
    Horario_Fecha TIME,
    CONSTRAINT Snack_Bar_pk PRIMARY KEY (ID_Snack_Bar, CNPJ),
    CONSTRAINT Snack_Bar_fk FOREIGN KEY (CNPJ) REFERENCES Cinema (CNPJ)
);

CREATE TABLE Produto (
    ID_Produto NUMBER,
    ID_Snack_Bar NUMBER,
    Nome_Produto VARCHAR2(30),
    Preco DECIMAL(3, 2),
    CONSTRAINT Produto_pk PRIMARY KEY (ID_Produto, ID_Snack_Bar),
    CONSTRAINT Produto_fk FOREIGN KEY (ID_Snack_Bar) REFERENCES Snack_Bar (ID_Snack_Bar)
);

CREATE TABLE Sala (
    ID_Sala NUMBER,
    Capacidade NUMBER,
    CONSTRAINT Sala_pk PRIMARY KEY (ID_Sala)
);

CREATE TABLE Filme (
    ID_Filme NUMBER,
    Faixa_Etaria NUMBER,
    Data_Inicio DATE,
    Data_Fim DATE,
    Nome_Filme VARCHAR2(30),
    CONSTRAINT Filme_pk PRIMARY KEY (ID_Filme)
);

CREATE TABLE Filme_Sala (
    ID_Filme NUMBER,
    ID_Sala NUMBER,
    CONSTRAINT Filme_Sala_pk PRIMARY KEY (ID_Filme, ID_Sala),
    CONSTRAINT Filme_Sala_fk FOREIGN KEY (ID_Filme) REFERENCES Filme (ID_Filme),
    CONSTRAINT Filme_Sala_fk2 FOREIGN KEY (ID_Sala) REFERENCES Sala (ID_Sala),
);

CREATE TABLE Genero (
    ID_Filme NUMBER,
    Nome_Genero VARCHAR2(10),
    CONSTRAINT Genero_pk PRIMARY KEY (ID_Filme),
    CONSTRAINT Genero_fk FOREIGN KEY (ID_Filme) REFERENCES Filme (ID_Filme)
);

CREATE TABLE Diretor (
    ID_Filme NUMBER,
    Nome_Diretor VARCHAR2(30),
    CONSTRAINT Diretor_pk PRIMARY KEY (ID_Filme),
    CONSTRAINT Diretor_fk FOREIGN KEY (ID_Filme) REFERENCES Filme (ID_Filme)
);

CREATE TABLE Ator (
    ID_Filme NUMBER,
    Nome_Ator VARCHAR2(30),
    CONSTRAINT Ator_pk PRIMARY KEY (ID_Filme),
    CONSTRAINT Ator_fk FOREIGN KEY (ID_Filme) REFERENCES Filme (ID_Filme)
);

CREATE TABLE Ingresso (
    ID_Ingresso NUMBER,
    ID_Filme NUMBER,
    Preco_Ingresso DECIMAL(2, 2),
    Horario TIMESTAMP,
    CONSTRAINT Ingresso_pk PRIMARY KEY (ID_Ingresso),
    CONSTRAINT Ingresso_fk FOREIGN KEY (ID_Filme) REFERENCES Filme (ID_Filme)
);

CREATE TABLE Vende_Ingresso (
    ID_Ingresso NUMBER,
    CPF NUMBER,
    ID_Funcionario NUMBER,
    CONSTRAINT Vende_Ingresso_pk PRIMARY KEY (ID_Ingresso, CPF, ID_Filme, ID_Funcionario),
    CONSTRAINT Vende_Ingresso_fk FOREIGN KEY (ID_Ingresso) REFERENCES Ingresso (ID_Ingresso),
    CONSTRAINT Vende_Ingresso_fk2 FOREIGN KEY (CPF) REFERENCES Pessoa (CPF),
    CONSTRAINT Vende_Ingresso_fk4 FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario (ID_Funcionario)
);

CREATE TABLE Exibe (
    ID_Sala NUMBER,
    ID_Filme NUMBER,
    CPF NUMBER,
    CONSTRAINT Exibe_pk PRIMARY KEY (ID_Sala, ID_Filme, CPF),
    CONSTRAINT Exibe_fk FOREIGN KEY (ID_Sala) REFERENCES Sala (ID_Sala),
    CONSTRAINT Exibe_fk2 FOREIGN KEY (ID_Filme) REFERENCES Filme (ID_Filme),
    CONSTRAINT Exibe_fk3 FOREIGN KEY (CPF) REFERENCES Pessoa (CPF)
);

