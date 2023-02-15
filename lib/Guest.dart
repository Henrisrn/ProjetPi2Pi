import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetpix/Camera.dart';
import 'package:projetpix/DBConnection.dart';
import 'package:projetpix/Home.dart';
import 'package:projetpix/PartieFinie.dart';
import 'package:projetpix/Profil.dart';
import 'package:projetpix/Search.dart';

class Guest extends StatefulWidget {
  final List<CameraDescription> cameraa;
  Guest({Key? key, required this.cameraa});
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
  String sortie = "";
  List<String> joueur = [];
  String answer = "";
  bool Partiefinie(List<List<String>> lis) {
    bool res = false;
    for (List<String> i in lis) {
      if (i.length == 0) {
        res = true;
      }
    }
    return res;
  }

  List<String> questiondejafaite = [];
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    DBConnection coll = new DBConnection(collec);
    coll.dbconnect.then(((question) => setState(() {
          print(question);
          _widget.addAll([
            Partiefinie(question)
                ? PartieFinie()
                : Home(
                    onChangedStep: (indexx, value) => setState(() {
                          index = indexx;
                          for (String i in value) {
                            joueur.add((i + "  "));
                          }
                        })),
            Search(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Camera(
                cameraaa: widget.cameraa,
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Profile(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
          ]);
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
