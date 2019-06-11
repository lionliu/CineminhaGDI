db.movies.aggregate([{$group:{_id:0, mediaEtaria: {$avg: "$Faixa_Etaria"}}}]);
db.movies.aggregate([ {$match: {}}, {$group:{_id:"$Nome_Filme", censura:{$avg: "$Faixa_Etaria"}}}])