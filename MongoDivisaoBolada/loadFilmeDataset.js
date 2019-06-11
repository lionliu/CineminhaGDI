db = db.getSiblingDB("Cineminha");
db.movieDetails.drop();
db.moviesDetails.insertMany([
	{
	"Faixa_Etaria": 14,
	"Data_Inicio": "24/04/2019",
	"Data_Fim": "27/06/2019",
	"Nome_Filme": "Vingadores"
	"Diretor": "Irmaos Russo"
	},
	{
	"Faixa_Etaria": 18,
	"Data_Inicio": "06/05/2019",
	"Data_Fim": "22/06/2019",
	"Nome_Filme": "John Wick 3: Parabellum"
	"Diretor"
	},
	{
	"Faixa_Etaria": 12,
	"Data_Inicio": "06/06/2019",
	"Data_Fim": "09/07/2019",
	"Nome_Filme": "X-Men: Fenix Negra"
	}
]);