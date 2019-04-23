--criação de tipo usando record 
DECLARE
TYPE TYPE_CINEMA IS RECORD(
	CNPJ NUMBER,
	NUMERO_SALAS NUMBER,
	NOME VARCHAR2(30)
);
cineminha TYPE_CINEMA := TYPE_CINEMA();
--uso de estrutura tipo table
TYPE TYPE_CINEMA_TABLE IS TABLE OF TYPE_CINEMA
INDEX BY BINARY_INTEGER;
--bloco anonimo

--create procedure

--create function
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
		dbms_output.put_line('pessoa nao cadastrada');
		v_setor := 'inexistente';
	ELSE
		SELECT S.Nome_Setor INTO v_setor
		FROM Setor S, Setor_Funcionario SF, Pessoa_Funcionario PF  
		WHERE S.ID_Setor = SF.ID_Setor
		AND SF.ID_Funcionario = PF.ID_Funcionario
		AND PF.CPF = cpfPessoa;

		IF v_setor IS NULL THEN
			dbms_output.put_line('pessoa nao eh funcionaria');
			v_setor := 'inexistente';
		END IF;
	END IF;
	RETURN v_setor;
	
END setor_onde_trabalha;
/
/*
BEGIN
SETORJESUS SETOR.NOME_SETOR%TYPE;
SETORJESUS := SETOR_ONDE_TRABALHA('Jesus');
END
*/
