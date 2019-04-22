--Inserindo Pessoa;

INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (0001, 'PNome', '01/01/0001', 'dd/mm/yy');
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (5103, 'Adiano', '24/03/1998', 'dd/mm/yy');
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (5276, 'Leao', '19/03/1998', 'dd/mm/yy');
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (4689, 'Jose', '20/06/1996', 'dd/mm/yy');
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (5319, 'Gabriel', '22/06/1998', 'dd/mm/yy');
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (4371, 'Xuliano', '07/09/1994', 'dd/mm/yy');
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (5036, 'Mendonco', '06/03/1997', 'dd/mm/yy');
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (3206, 'Vaval', '30/07/1978', 'dd/mm/yy');
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (0000, 'Jesus', '25/12/0000', 'dd/mm/yy');

--Inserindo Telefone_Pessoa;

INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5276,999258866);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5276,999256688);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5276,988669925);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5319,998074926);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (4689,979109563);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5103,997693261);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5036,983270414);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (0000,940028922);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (8932,999890929);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (0001,000000001);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (3206,932429666);

--Inserindo Endereco_Pessoa;

INSERT INTO Endereco_Pessoa (CPF_Endereco,CEP,Rua,Bairro,Cidade,Numero_Endereco) VALUES (0001,0001,'Teste','De','Endereco',001);
INSERT INTO Endereco_Pessoa (CPF_Endereco,CEP,Rua,Bairro,Cidade,Numero_Endereco) VALUES (5276,4232,'Lincoln Road','Miami Beach','Miami',786);
INSERT INTO Endereco_Pessoa (CPF_Endereco,CEP,Rua,Bairro,Cidade,Numero_Endereco) VALUES (4371,4216,'Das dores','Casa Forte','Recife',786);
INSERT INTO Endereco_Pessoa (CPF_Endereco,CEP,Rua,Bairro,Cidade,Numero_Endereco) VALUES (4689,4891,'Teste','De','Endereco',001);
INSERT INTO Endereco_Pessoa (CPF_Endereco,CEP,Rua,Bairro,Cidade,Numero_Endereco) VALUES (5319,7843,'Tejucupapo','San Martin','Recife',533);
INSERT INTO Endereco_Pessoa (CPF_Endereco,CEP,Rua,Bairro,Cidade,Numero_Endereco) VALUES (4371,5123,'SQN102','Norte','Brasilia',133);
INSERT INTO Endereco_Pessoa (CPF_Endereco,CEP,Rua,Bairro,Cidade,Numero_Endereco) VALUES (5036,3321,'Das gracas','Varzea','Recife',421);
INSERT INTO Endereco_Pessoa (CPF_Endereco,CEP,Rua,Bairro,Cidade,Numero_Endereco) VALUES (3206,1521,'Setubal','Boa Viagem','Recife',6616);
INSERT INTO Endereco_Pessoa (CPF_Endereco,CEP,Rua,Bairro,Cidade,Numero_Endereco) VALUES (0000,0000,'Fazendinha','De','Jerusalem',404);

--Inserindo Funcionario;

INSERT INTO Funcionario (ID_Funcionario,ID_Supervisor,Salario) VALUES (0001,NULL,4050.25);
INSERT INTO Funcionario (ID_Funcionario,ID_Supervisor,Salario) VALUES (0002,0001,2025.12);
INSERT INTO Funcionario (ID_Funcionario,ID_Supervisor,Salario) VALUES (0003,0001,1012.62);
INSERT INTO Funcionario (ID_Funcionario,ID_Supervisor,Salario) VALUES (0004,NULL,3268.15);

--Inserindo Setor;

INSERT INTO Setor (ID_Setor,Nome_Setor) VALUES (0001,'Administracao');
INSERT INTO Setor (ID_Setor,Nome_Setor) VALUES (0002,'Caixa');
INSERT INTO Setor (ID_Setor,Nome_Setor) VALUES (0003,'Seguranca');
INSERT INTO Setor (ID_Setor,Nome_Setor) VALUES (0004,'ALGO');
INSERT INTO Setor (ID_Setor,Nome_Setor) VALUES (0005,'Operacoes Estruturadas');

--Inserindo Setor_Funcionario

INSERT INTO Setor_Funcionario (ID_Setor,ID_Funcionario) VALUES (0001,0001);
INSERT INTO Setor_Funcionario (ID_Setor,ID_Funcionario) VALUES (0003,0001);
INSERT INTO Setor_Funcionario (ID_Setor,ID_Funcionario) VALUES (0002,0002);
INSERT INTO Setor_Funcionario (ID_Setor,ID_Funcionario) VALUES (0004,0003);
INSERT INTO Setor_Funcionario (ID_Setor,ID_Funcionario) VALUES (0001,0004);
INSERT INTO Setor_Funcionario (ID_Setor,ID_Funcionario) VALUES (0002,0004);
INSERT INTO Setor_Funcionario (ID_Setor,ID_Funcionario) VALUES (0005,0004);

--Inserindo Pessoa_Funcionario;

INSERT INTO Pessoa_Funcionario (CPF,ID_Funcionario) VALUES (0000,0001);
INSERT INTO Pessoa_Funcionario (CPF,ID_Funcionario) VALUES (4371,0002);
INSERT INTO Pessoa_Funcionario (CPF,ID_Funcionario) VALUES (5036,0003);
INSERT INTO Pessoa_Funcionario (CPF,ID_Funcionario) VALUES (3206,0004);

--Inserindo Cinema;

INSERT INTO Cinema (CNPJ,Numero_Salas,Nome_Cinema) VALUES (1001,12,'Disney');
INSERT INTO Cinema (CNPJ,Numero_Salas,Nome_Cinema) VALUES (8971,1,'Assembleia de Deus');

--Inserindo Endereco_Cinema;

INSERT INTO Endereco_Cinema (CNPJ_Endereco, CEP, Rua,Bairro, Cidade, Numero_Endereco) VALUES (1001,4171,'Da Paz','Nuvem 2','Ceu','8969');
INSERT INTO Endereco_Cinema (CNPJ_Endereco, CEP, Rua,Bairro, Cidade, Numero_Endereco) VALUES (8971,9821,'Paranaue','Paranaua','Recife','697');

--Inserindo Telefone_Cinema;

INSERT INTO Telefone_Cinema (CNPJ_Telefone,telefone) VALUES (8971,32429666);
INSERT INTO Telefone_Cinema (CNPJ_Telefone,telefone) VALUES (8971,32452135);

--Inserindo Trabalha;

INSERT INTO Trabalha (CNPJ_Trabalha,ID_Funcionario) VALUES (8971,0001);
INSERT INTO Trabalha (CNPJ_Trabalha,ID_Funcionario) VALUES (8971,0002);
INSERT INTO Trabalha (CNPJ_Trabalha,ID_Funcionario) VALUES (8971,0003);
INSERT INTO Trabalha (CNPJ_Trabalha,ID_Funcionario) VALUES (8971,0004);
INSERT INTO Trabalha (CNPJ_Trabalha,ID_Funcionario) VALUES (1001,0001);

--Inserindo Snack_Bar;

INSERT INTO Snack_Bar (ID_Snack_Bar,CNPJ,Horario_Abre,Horario_Fecha) VALUES ()







--Inserindo Produto;









--Inserindo Sala;








--Inserindo Filme;









--Inserindo Filme_Sala;









--Inserindo Genero;








--Inserindo Diretor;











--Inserindo Ator;












--Inserindo Ingresso;











--Inserindo Vende_Ingresso;











--Inserindo Exibe;








