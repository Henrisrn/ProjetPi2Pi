import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetpix/DBConnection.dart';
import 'package:projetpix/Home.dart';

class Guest extends StatefulWidget {
  Guest({Key? key});
  int compteur = 0;

  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  final List<Widget> _widget = [];
  int index = 0;
  List<String> collec = [
    "Cestun10mais",
    "Action",
    "Verite",
    "Jenaijamais",
    "Quipourrait",
    "Cap"
  ];
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    DBConnection coll = new DBConnection(collec);
    coll.dbconnect.then(((question) => setState(() {
          print(question);
          _widget.addAll([Home()]);
        })));
  }

  @override
  Widget build(BuildContext context) {
    widget.compteur++;
    return Container(
      child: _widget.length == 0
          ? SafeArea(
              child: Scaffold(
              body: Center(
                  child: Text("Loading", style: TextStyle(fontSize: 30))),
            ))
          : _widget.elementAt(index),
    );
  }
}
