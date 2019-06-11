//checklist 1: criacao de ma colecao de documentos
//zé aabaixo
db.movieDetails.insertOne({//Insert Zé
    "ID_Filme" : 1212,
    "Faixa_Etaria" : "livre",
    "Data_Inicio" : "25/07/2003",
    "Data_Fim" : "30/08/2003",
    "Nome_Filme" : "Pequenos Espiões 3D"
});
db.movieDetails.insertOne({
    "ID_Filme" : 1213,
    "Faixa_Etaria" : "livre",
    "Data_Inicio" : "17/12/1999",
    "Data_Fim" : "20/01/2000",
    "Nome_Filme" : "Toy Story 2"
});
db.movieDetails.insertOne({//Insert Texero
		"ID_FILME" : 1214,
		"Faixa_Etaria" : "14",
		"Data_Inicio" : "21/06/2004",
		"Data_Fim" : "23/07/2004",
		"Nome_Filme" : "A história do IPoop."
});
db.movieDetails.insertOne({
		"ID_FILME" : 1215,
		"Faixa_Etaria" : "16",
		"Data_Inicio" : "11/08/2006",
		"Data_Fim" : "23/10/2006",
		"Nome_Filme" : "Ana, a Bele"
});
//vou atualizar adicionando diretor e atores nesses 2
//zé acima

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

db.movies.insertOne({
    "Nome_Filme" : "Your Name",
    "Faixa_Etaria" : "13",
    "Data_Inicio" : "26/08/2016",
    "Data_Fim" : "27/10/2016",
    "Genero": "Drama",
    "Diretor": ["Makoto Shinkai"],
    "Atores": ["Mone Kamishiraishi", "Ryunosuke Kamiki", "Kana Hanazawa", "Masami Nagasawa"],
    "AdoroCinema": {
        "Usuarios": 4.1,
        "AdoroCinema": 3
    }
});
