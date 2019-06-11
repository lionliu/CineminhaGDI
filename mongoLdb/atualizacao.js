//checklist 3: atualizacao de documento
db.movies.updateOne({"Nome_Filme":"Dragon Ball Zé"},{$set:{"visualizações":"mais de 8000"}},{"upsert":true})