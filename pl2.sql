-- Guardar em qtSalasMaiorMediaCapacidade a quantidade de salas 
-- que tem capacidade acima da média.
SELECT COUNT(*) INTO qtSalasMaiorMediaCapacidade
FROM Sala
WHERE Capacidade > (SELECT AVG(Capacidade) 
    FROM Sala);

