import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;

class DBConnection {
  List<String> aa = [];
  List<Map<String, String>> ba = [];
  DBConnection(List<String> a) {
    aa = a;
  }
  Future<List<Map<String, String>>> get dbconnect async {
    var db = await Db.create(
        "mongodb+srv://test:test@cluster0.pfcsyrs.mongodb.net/LeoSmartAss?retryWrites=true&w=majority");

    await db.open();
    inspect(db);
    print("Connected to db");
    List<Map<String, String>> res = [];

    for (int i = 0; i < aa.length; i++) {
      var collection = db.collection(aa.elementAt(i));
      Map<String, String> sortie = {};
      var information = await collection.find().toList();
      print(information);
      for (var i in information) {
        print(i);
        Map<String, String> sortie = {};
        sortie["Domaine"] = i["Domaine"];
        sortie["Titrecours"] = i["Titrecours"];
        sortie["Contenue"] = i["Contenue"];
        sortie["Imagelien1"] = i["Imagelien1"];
        sortie["Imagelien2"] = i["Imagelien2"];
        res.add(sortie);
      }
    }
    List<String> collec = [
      "Cours",
    ];
    /*var collection = db.collection("Cestun10mais");
    await collection.insertMany([
      {'_id': '1', 'phrase': ""},
      {'_id': '2', 'phrase': ""},
      {'_id': '3', 'phrase': ""},
      {'_id': '4', 'phrase': ""},
      {'_id': '5', 'phrase': ""},
      {'_id': '6', 'phrase': ""},
      {'_id': '7', 'phrase': ""},
    ]);*/
    // Fluent way

    // or Standard way
    await db.close();
    ba = res;
    return res;
    //List<List<String>> res = [];
    //return res;
  }
}
