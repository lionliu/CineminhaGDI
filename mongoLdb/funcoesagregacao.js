//checklist 6: uso de funcao de agregacao: sum, avg, count e max
//avg
db.movies.aggregate(
    {$group:{_id: "Nome_Filme", nota_media:{$avg: "$AdoroCinema.Critica"}}}
);