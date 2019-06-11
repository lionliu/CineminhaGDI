//checklist 1: criacao de ma colecao de documentos
db = db.getSiblingDB("Cineminha");
db.movies.drop();
db.movies.insertOne({//Insert Zé
    "Faixa_Etaria" : "livre",
    "Data_Inicio" : "25/07/2003",
    "Data_Fim" : "30/08/2003",
    "Nome_Filme" : "Pequenos Espiões 3D",
    "Diretor":["Hey Leão", "Texera Macaxera"]
    
});
db.movies.insertOne({
    "Faixa_Etaria" : "livre",
    "Data_Inicio" : "17/12/1999",
    "Data_Fim" : "20/01/2000",
    "Nome_Filme" : "Dragon Ball Zé",
    "Diretor" : ["Sayazé"]
});


db.movies.insertOne({//Insert Texero
		"Faixa_Etaria" : "14",
		"Data_Inicio" : "21/06/2004",
		"Data_Fim" : "23/07/2004",
		"Nome_Filme" : "A história do IPoop."
});
db.movies.insertOne({
		"Faixa_Etaria" : "16",
		"Data_Inicio" : "11/08/2006",
		"Data_Fim" : "23/10/2006",
		"Nome_Filme" : "Ana, a Bele"
});


