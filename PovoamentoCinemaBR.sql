--Inserindo Pessoa;

INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (0001, 'PNome', to_date('01/01/0001', 'dd/mm/yy'));
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (5103, 'Adiano', to_date('24/03/1998', 'dd/mm/yy'));
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (5276, 'Leao', to_date('19/03/1998', 'dd/mm/yy'));
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (4689, 'Jose', to_date('20/06/1996', 'dd/mm/yy'));
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (5319, 'Gabriel', to_date('22/06/1998', 'dd/mm/yy'));
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (4371, 'Xuliano', to_date('07/09/1994', 'dd/mm/yy'));
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (5036, 'Mendonco', to_date('06/03/1997', 'dd/mm/yy'));
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (3206, 'Vaval', to_date('30/07/1978', 'dd/mm/yy'));
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (0000, 'Jesus', to_date('25/12/0001', 'dd/mm/yy'));
INSERT INTO Pessoa (CPF,Nome_Pessoa,Data_Nasc) VALUES (5678, 'SereiExcluido', to_date('25/12/0021', 'dd/mm/yy'));

--Inserindo Telefone_Pessoa;

INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5276,999258866);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5276,999256688);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5276,988669925);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5319,998074926);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (4689,979109563);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5103,997693261);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (5036,983270414);
INSERT INTO Telefone_Pessoa (CPF_Telefone,telefone) VALUES (0000,940028922);
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

INSERT INTO Snack_Bar (ID_Snack_Bar,CNPJ,Horario_Abre,Horario_Fecha) VALUES (0006,8971,timestamp '2019-04-23 8:00:00',timestamp '2019-04-23 21:00:00');
INSERT INTO Snack_Bar (ID_Snack_Bar,CNPJ,Horario_Abre,Horario_Fecha) VALUES (1002,1001,timestamp '2019-04-23 6:00:00',timestamp '2019-04-23 23:00:00');

--Inserindo Produto;

INSERT INTO Produto (ID_Produto,ID_Snack_Bar,CNPJ_Snack_Bar,Nome_Produto,Preco) VALUES (ID_Produto.NEXTVAL,0006,8971,'Pipoca',56.99);
INSERT INTO Produto (ID_Produto,ID_Snack_Bar,CNPJ_Snack_Bar,Nome_Produto,Preco) VALUES (ID_Produto.NEXTVAL,1002,1001,'Pao',00.05);
INSERT INTO Produto (ID_Produto,ID_Snack_Bar,CNPJ_Snack_Bar,Nome_Produto,Preco) VALUES (ID_Produto.NEXTVAL,0006,8971,'Lion Whey Bar',11.99);
INSERT INTO Produto (ID_Produto,ID_Snack_Bar,CNPJ_Snack_Bar,Nome_Produto,Preco) VALUES (ID_Produto.NEXTVAL,0006,8971,'Texero Acai',6.99);
INSERT INTO Produto (ID_Produto,ID_Snack_Bar,CNPJ_Snack_Bar,Nome_Produto,Preco) VALUES (ID_Produto.NEXTVAL,0006,8971,'Jose Little Marmita',9.99);
INSERT INTO Produto (ID_Produto,ID_Snack_Bar,CNPJ_Snack_Bar,Nome_Produto,Preco) VALUES (ID_Produto.NEXTVAL,0006,8971,'Xuliano Maizena Cookie',3.99);
INSERT INTO Produto (ID_Produto,ID_Snack_Bar,CNPJ_Snack_Bar,Nome_Produto,Preco) VALUES (ID_Produto.NEXTVAL,0006,8971,'Adiano Empty Bottle of Water',0.99);

--Inserindo Sala;

INSERT INTO Sala (ID_Sala,Capacidade) VALUES (4001,30);
INSERT INTO Sala (ID_Sala,Capacidade) VALUES (4002,30);
INSERT INTO Sala (ID_Sala,Capacidade) VALUES (4003,40);
INSERT INTO Sala (ID_Sala,Capacidade) VALUES (4004,50);

--Inserindo Filme;

INSERT INTO Filme (ID_Filme, Faixa_Etaria,Data_Inicio,Data_Fim,Nome_Filme) VALUES (1401,14,to_date('24/04/2019','dd/mm/yy'),to_date('27/06/2019','dd/mm/yy'),'Vingadores');
INSERT INTO Filme (ID_Filme, Faixa_Etaria,Data_Inicio,Data_Fim,Nome_Filme) VALUES (1413,18,to_date('17/05/2019','dd/mm/yy'),to_date('30/06/2019','dd/mm/yy'),'Cres Pusculus');
INSERT INTO Filme (ID_Filme, Faixa_Etaria,Data_Inicio,Data_Fim,Nome_Filme) VALUES (1416,10,to_date('14/04/2019','dd/mm/yy'),to_date('20/06/2019','dd/mm/yy'),'Bobe e o esponja');
INSERT INTO Filme (ID_Filme, Faixa_Etaria,Data_Inicio,Data_Fim,Nome_Filme) VALUES (1351,16,to_date('24/05/2019','dd/mm/yy'),to_date('10/06/2019','dd/mm/yy'),'Bang the Inuiashiki');

--Inserindo Filme_Sala;

INSERT INTO Filme_Sala (ID_Filme,ID_Sala) VALUES (1401,4004);
INSERT INTO Filme_Sala (ID_Filme,ID_Sala) VALUES (1401,4002);
INSERT INTO Filme_Sala (ID_Filme,ID_Sala) VALUES (1401,4003);
INSERT INTO Filme_Sala (ID_Filme,ID_Sala) VALUES (1413,4001);
INSERT INTO Filme_Sala (ID_Filme,ID_Sala) VALUES (1416,4003);
INSERT INTO Filme_Sala (ID_Filme,ID_Sala) VALUES (1351,4001);

--Inserindo Genero;

INSERT INTO Genero (ID_Filme,Nome_Genero) VALUES (1401,'Acao');
INSERT INTO Genero (ID_Filme,Nome_Genero) VALUES (1413,'Drama');
INSERT INTO Genero (ID_Filme,Nome_Genero) VALUES (1416,'Acao');
INSERT INTO Genero (ID_Filme,Nome_Genero) VALUES (1351,'Violencia');

--Inserindo Diretor;

INSERT INTO Diretor (ID_Filme,Nome_Diretor) VALUES (1413,'Edo Ardo');
INSERT INTO Diretor (ID_Filme,Nome_Diretor) VALUES (1416,'Tarantino');
INSERT INTO Diretor (ID_Filme,Nome_Diretor) VALUES (1351,'Japaum');
INSERT INTO Diretor (ID_Filme,Nome_Diretor) VALUES (1401,'Russian Brothers');

--Inserindo Ator;

INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1416,'Bob o esponjo');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1416,'Patrico Estrelo');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1416,'Lula do PT');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1416,'Sand e Jr');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1401,'Iron Maiden');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1401,'Capetao South America');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1401,'Maquina de Combatman');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1413,'Edoardo');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1401,'Mina Palida');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1351,'Inuiashiki');
INSERT INTO Ator (ID_Filme,Nome_Ator) VALUES (1351,'Shiba Inu');

--Inserindo Ingresso;

INSERT INTO Ingresso (ID_Ingresso,ID_Filme,Preco_Ingresso,Horario) VALUES (3991,1416,14.90,timestamp '2019-04-24 13:30:00');
INSERT INTO Ingresso (ID_Ingresso,ID_Filme,Preco_Ingresso,Horario) VALUES (3992,1401,30.00,timestamp '2019-05-20 15:00:00');
INSERT INTO Ingresso (ID_Ingresso,ID_Filme,Preco_Ingresso,Horario) VALUES (3993,1413,04.90,timestamp '2019-04-16 13:15:00');
INSERT INTO Ingresso (ID_Ingresso,ID_Filme,Preco_Ingresso,Horario) VALUES (3994,1351,10.00,timestamp '2019-05-24 13:40:00');

--Inserindo Vende_Ingresso;

INSERT INTO Vende_Ingresso (ID_Ingresso, CPF, ID_Funcionario) VALUES (3992,5319,0002);
INSERT INTO Vende_Ingresso (ID_Ingresso, CPF, ID_Funcionario) VALUES (3993,5103,0002);
INSERT INTO Vende_Ingresso (ID_Ingresso, CPF, ID_Funcionario) VALUES (3994,5276,0002);
INSERT INTO Vende_Ingresso (ID_Ingresso, CPF, ID_Funcionario) VALUES (3991,5036,0002);
INSERT INTO Vende_Ingresso (ID_Ingresso, CPF, ID_Funcionario) VALUES (3992,4689,0002);
INSERT INTO Vende_Ingresso (ID_Ingresso, CPF, ID_Funcionario) VALUES (3991,0001,0002);
INSERT INTO Vende_Ingresso (ID_Ingresso, CPF, ID_Funcionario) VALUES (3993,3206,0001);
INSERT INTO Vende_Ingresso (ID_Ingresso, CPF, ID_Funcionario) VALUES (3994,0001,0001);

--Inserindo Exibe;

INSERT INTO Exibe (ID_Sala, ID_Filme, CPF) VALUES (4001,1401,5319);
INSERT INTO Exibe (ID_Sala, ID_Filme, CPF) VALUES (4001,1401,5103);
INSERT INTO Exibe (ID_Sala, ID_Filme, CPF) VALUES (4001,1401,5276);
INSERT INTO Exibe (ID_Sala, ID_Filme, CPF) VALUES (4001,1401,5036);
INSERT INTO Exibe (ID_Sala, ID_Filme, CPF) VALUES (4002,1416,0001);
INSERT INTO Exibe (ID_Sala, ID_Filme, CPF) VALUES (4003,1413,3206);
INSERT INTO Exibe (ID_Sala, ID_Filme, CPF) VALUES (4004,1351,0001);
