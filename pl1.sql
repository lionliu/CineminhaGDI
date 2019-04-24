--=================================
--criação de tipo usando record 
DECLARE
TYPE TYPE_CINEMA IS RECORD(
	CNPJ NUMBER,
	NUMERO_SALAS NUMBER,
	NOME VARCHAR2(30)
);
cineminha TYPE_CINEMA;
--=================================
--uso de estrutura tipo table + %rowtype + IF ELSIF + CASE WHEN 
DECLARE

TYPE listaPessoas IS TABLE OF Pessoa%rowtype;

lista listaPessoas :=listaPessoas();

BEGIN

    FOR HUMANO IN (
        SELECT * FROM PESSOA P 
    ) LOOP

        lista.EXTEND;

		IF HUMANO.CPF < 4000 THEN
        	CASE HUMANO.NOME_PESSOA
        	    WHEN 'Leao' THEN
        	        lista(lista.LAST).nome_pessoa :='GATINHO';
        	    ELSE
			        lista(lista.LAST).nome_pessoa :=HUMANO.nome_pessoa;
                END CASE;
                lista(lista.LAST).cpf :=HUMANO.cpf;
                lista(lista.LAST).Data_Nasc :=HUMANO.Data_Nasc;
		ELSIF HUMANO.NOME_PESSOA LIKE 'Adiano%' THEN
			lista(lista.LAST).nome_pessoa :='Vegeta';
			lista(lista.LAST).cpf :=8001;
        	lista(lista.LAST).Data_Nasc :=to_date('12/12/1212','dd/mm/yy');
		END IF;
        
    END LOOP;

END;
--=================================
--create procedure (adiciona um novo cinema no banco de dados)
CREATE OR REPLACE PROCEDURE ARMAZENA_CINEMAS(v_CNPJ NUMBER,
v_Numero_Salas NUMBER,
v_Nome_Cinema VARCHAR2(30)) IS
BEGIN
     INSERT INTO Cinema (CNPJ,Numero_Salas,Nome_Cinema) VALUES (v_CNPJ,v_Numero_Salas,v_Nome_Cinema);
END ARMAZENA_CINEMAS;
/
--=================================
--bloco anonimo (utiliza procedure criado acima)
BEGIN
ARMAZENA_CINEMAS(0100,666,'aSSEMBLEIA DE sATAANAS');
ARMAZENA_CINEMAS(0101,123,'UFC-INEMAS');
END;
--=================================
--create function + %type
	--funcao que retorna o nome do setor da pessoa passada como parametro
CREATE OR REPLACE FUNCTION setor_onde_trabalha
( nome_p Pessoa.Nome_pessoa%TYPE) 
RETURN SETOR.NOME_SETOR%TYPE
IS 
    V_SETOR SETOR.NOME_SETOR%TYPE;
    cpfPessoa Pessoa.CPF%TYPE;
    
BEGIN

	SELECT P.CPF INTO cpfPessoa 
	FROM Pessoa P
	WHERE P.Nome_Pessoa = nome_p;

	IF nome_p IS NULL THEN 
		v_setor := 'inexistente';
	ELSE
		SELECT S.Nome_Setor INTO v_setor
		FROM Setor S, Setor_Funcionario SF, Pessoa_Funcionario PF  
		WHERE S.ID_Setor = SF.ID_Setor
		AND SF.ID_Funcionario = PF.ID_Funcionario
		AND PF.CPF = cpfPessoa;

		IF v_setor IS NULL THEN
			v_setor := 'inexistente';
		END IF;
	END IF;
	RETURN v_setor;
	
END setor_onde_trabalha;
/
--=================================
--while loop (fibbonacci)
DECLARE
	TYPE FIBO IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
	i INTEGER;
	
	MEMO FIBO := FIBO();
BEGIN 
	MEMO(0):=1;
	MEMO(1):=1;
	i:=2;
	WHILE i<3000 LOOP
	MEMO(i) := MEMO(i-1)+MEMO(i-2);
	i:=i+1;
	END LOOP;
END;