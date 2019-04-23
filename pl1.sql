--criação de tipo usando record 

--uso de estrutura tipo table

--bloco anonimo

--create procedure

--create function
	--funcao que retorna o nome do setor da pessoa passada como parametro
CREATE FUNCTION setor_onde_trabalha(nome_p IN Pessoa.Nome_pessoa%TYPE) 
RETURN Setor.Nome_Setor%TYPE IS
Set serveroutput on;
DECLARE
	v_setor Setor.Nome_Setor%type;
	cpfPessoa Pessoa.CPF%type;
	
BEGIN

	SELECT P.CPF FROM Pessoa P 
	WHERE P.Nome_Pessoa = nome_p
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
END setor_onde_trabalha