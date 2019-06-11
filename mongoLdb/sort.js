//checklist 5: uso de sort
db.movies.find().sort({"$AdoroCinema.AdoroCinema":1}).pretty();//testar esse sort com pretty depois