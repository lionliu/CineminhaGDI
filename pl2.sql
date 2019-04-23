-- Guardar em qtSalasMaiorMediaCapacidade a quantidade de salas 
-- que tem capacidade acima da média.
SELECT COUNT(*) INTO qtSalasMaiorMediaCapacidade
FROM Sala
WHERE Capacidade > (SELECT AVG(Capacidade) 
    FROM Sala);

-- Cursor para printar os telefones da pessoa que tem o cpf 5276
set server output on;
DECLARE
v_telefone Telefone_Pessoa.telefone%TYPE;
v_CPF_Telefone Telefone_Pessoa.CPF_telefone%TYPE:=5267;

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
    END LOOP
    CLOSE c_telefone;
END;
/
