//checklist 1: criacao de ma colecao de documentos
//zé aabaixo
db.movieDetails.insertOne({
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

//vou atualizar adicionando diretor e atores nesses 2
//zé acima