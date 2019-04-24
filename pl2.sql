-- Cursor para printar os telefones da pessoa que tem o cpf 5276
-- Ele lançará uma exceção caso o cursor não tiver sido manipulado corretamente.
DECLARE
v_telefone Telefone_Pessoa.telefone%TYPE,
v_CPF_Telefone Telefone_Pessoa.CPF_telefone%TYPE:=5276,

CURSOR c_telefone IS 
SELECT telefone
FROM Telefone_Pessoa
WHERE CPF_telefone=v_CPF_telefone;

BEGIN
    OPEN c_telefone;
    LOOP
        FETCH c_telefone INTO v_telefone;
        EXIT WHEN c_telefone%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_telefone));
    END LOOP;
    CLOSE c_telefone;
EXCEPTION
    WHEN INVALID_CURSOR THEN
        DBMS_OUTPUT.PUT_LINE('Voce chamou um FETCH antes do OPEN; ou voce chamou um CLOSE antes do OPEN; ou chamou um CLOSE antes do FETCH');
END;
/

-- Cursor com FOR que mostra os atores do filme 1401
DECLARE
CURSOR c_atores IS
SELECT Nome_Ator FROM Ator
WHERE ID_Filme=1401;

BEGIN
FOR v_reg IN c_atores LOOP
    DBMS_OUTPUT.PUT_LINE(v_reg.Nome_Ator);
END LOOP;
END;
/

-- Trigger de linha que não deixa apagar Jesus
CREATE OR REPLACE TRIGGER JesusNoCoracao
BEFORE DELETE ON Pessoa
FOR EACH ROW
BEGIN
    IF :OLD.Nome_Pessoa='Jesus' THEN
        RAISE_APPLICATION_ERROR(-20011, 'Nao se pode deletar JESUS!');
    END IF;
END;
/

-- Teste do trigger de linha
DELETE FROM Pessoa
WHERE Nome_Pessoa = 'Jesus';

-- Trigger de Comando que informa quantas pessoas a tabela ainda possui depois que uma pessoa é apagada
CREATE OR REPLACE TRIGGER qtDePessoas
AFTER DELETE ON Pessoa
DECLARE
v_qtPessoa INTEGER;
BEGIN
SELECT COUNT(*) INTO v_qtPessoa
FROM Pessoa;
    DBMS_OUTPUT.PUT_LINE('Tabela Pessoa agora possui '|| v_qtPessoa || ' pessoa(s)');
END;
/

-- Teste do trigger de comando
DELETE FROM Pessoa
WHERE Nome_Pessoa = 'SereiExcluido';

-- Package cadastroCinema

CREATE OR REPLACE CadastroCinema AS

END CadastroCinema;
/