db = db.getSiblingDB("cineminha");
db.movies.drop();
db.movies.insertOne([{"ID_Filme": 1401, "Faixa_Etaria": 14, "Data_Inicio": "24/04/2019", "Data_Fim": "27/06/2019", "Nome_Filme": "Vingadores"}]);