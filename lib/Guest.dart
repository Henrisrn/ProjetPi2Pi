import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetpix/About.dart';
import 'package:projetpix/CGU.dart';
import 'package:projetpix/Camera.dart';
import 'package:projetpix/Camera2.dart';
import 'package:projetpix/Chapitre.dart';
import 'package:projetpix/DBConnection.dart';
import 'package:projetpix/Home.dart';
import 'package:projetpix/Lecteurvideo.dart';
import 'package:projetpix/PartieFinie.dart';
import 'package:projetpix/Premium.dart';
import 'package:projetpix/Profil.dart';
import 'package:projetpix/Reglage.dart';
import 'package:projetpix/Search.dart';
import 'package:projetpix/Terms.dart';

class Guest extends StatefulWidget {
  Guest({Key? key});
  int compteur = 0;

  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  final List<Widget> _widget = [];
  int index = 0;
  String pathvideoo = "";
  List<String> collec = [
    "Cestun10mais",
    "Action",
    "Verite",
    "Jenaijamais",
    "Quipourrait",
    "Cap"
  ];
  String sortie = "";

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
            Home(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Search(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            TakeVideoPage(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Profile(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                      pathvideoo = value[0];
                    })),
            Reglage(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Premium(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            CGU(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            About(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Terms(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    }))
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
