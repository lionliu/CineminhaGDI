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

-- Trigger de linha que printa qual o nome da pessoa que foi atualizada
CREATE OR REPLACE TRIGGER nomePessoaAtualizada
AFTER UPDATE ON Pessoa
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(:NEW.Nome_Pessoa||' teve dados atualizados');
END;
/

-- Teste do trigger de linha
UPDATE Pessoa  
SET Data_Nasc = to_date('23/02/1997', 'dd/mm/yyyy')
WHERE Nome_Pessoa = 'Xuliano'; 