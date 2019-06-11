//checklist 1: criacao de ma colecao de documentos
db = db.getSiblingDB("Cineminha");
db.movies.drop();
db.movies.insertOne({//Insert Zé
    "Faixa_Etaria" : "livre",
    "Data_Inicio" : "25/07/2003",
    "Data_Fim" : "30/08/2003",
    "Nome_Filme" : "Pequenos Espiões 3D",
    "Diretor":["Hey Leão", "Texera Macaxera"],
    "Atores": ["lion", "adiano", "tiago monitor"],
    "AdoroCinema": {
        "Critica": 3.0,
        "Usuarios": 2.0,
        "AdoroCinema": 2
    }
    
});
db.movies.insertOne({
    "Faixa_Etaria" : "livre",
    "Data_Inicio" : "17/12/1999",
    "Data_Fim" : "20/01/2000",
    "Nome_Filme" : "Dragon Ball Zé",
    "Diretor" : ["Sayazé"],
    "Atores": ["Zé", "Xuliano"],
    "AdoroCinema": {
        "Critica": 5,
        "Usuarios": 0.2,
        "AdoroCinema": 5
    }
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


// Leão abaixo

db.movies.insertOne({
    "Nome_Filme" : "Blade Runner 2049",
    "Faixa_Etaria" : "17",
    "Data_Inicio" : "05/10/2017",
    "Data_Fim" : "22/12/2017",
    "Genero": "Ficção Cientifica",
    "Diretor": ["Denis Villeneuve"],
    "Atores": ["Harrison Ford", "Ryan Gosling", "Ana de Armas", "Dave Bautista", "Jared Leto", "Robin Wright", "Sylvia Hoeks"],
    "AdoroCinema": {
        "Critica": 4.5,
        "Usuarios": 4.2,
        "AdoroCinema": 4
    }
});


