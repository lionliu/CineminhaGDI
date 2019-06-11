//checklist 6: uso de funcao de agregacao: sum, avg, count e max
//avg
db.movies.aggregate(   {$group:{_id: "$AdoroCinema", nota_media:{$avg: "$Critica" }}})

//count
// Retorna a quantidade de notas do Adoro Cinema maior igual a 4
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

  //Sum
  //Retorna a soma da faixa etária dos filmes onde Ze atuou
  db.movies.aggregate([
    {
      $match:{
        "Atores":"Ze"
      }
    },
    {
      $group:{
        _id:"$Ze",
        Faixa_media: {$sum: "$Faixa_Etaria"}
      }
    }
  ])