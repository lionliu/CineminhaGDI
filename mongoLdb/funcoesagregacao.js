//checklist 6: uso de funcao de agregacao: sum, avg, count e max
//avg
db.movies.aggregate(   {$group:{_id: "$AdoroCinema", nota_media:{$avg: "$Critica" }}})

//count
// Retorna a quantidade de notas do Adoro Cinema maiores que 
db.movies.aggregate(
    [
      {
        $match: {
          "AdoroCinema.AdoroCinema": {
            $gte: 4
          }
        }
      },
      {
        $count: "Notas>=4"
      }
    ]
  )