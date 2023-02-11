import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;

class DBConnection {
  List<String> aa = [];
  List<List<String>> ba = [];
  DBConnection(List<String> a) {
    aa = a;
  }
  Future<List<List<String>>> get dbconnect async {
    var db = await Db.create(
        "mongodb+srv://test2:test2@cluster0.pfcsyrs.mongodb.net/Phraseapplication?retryWrites=true&w=majority");

    await db.open();
    inspect(db);
    print("Connected to db");
    List<List<String>> res = [];

    for (int i = 0; i < aa.length; i++) {
      var collection = db.collection(aa.elementAt(i));
      List<String> sortie = [];
      var information = await collection.find().toList();
      print(information);
      for (var i in information) {
        print(i);
        sortie.add(i["phrase"]);
      }
      res.add(sortie);
    }
    List<String> collec = [
      "Cestun10mais",
      "Action",
      "Verite",
      "Jenaijamais",
      "Quipourrait",
      "Cap"
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
  }
}
