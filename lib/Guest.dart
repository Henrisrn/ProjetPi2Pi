import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetpix/About.dart';
import 'package:projetpix/CGU.dart';
import 'package:projetpix/Camera.dart';
import 'package:projetpix/Camera2.dart';
import 'package:projetpix/Chapitre.dart';
import 'package:projetpix/CoursChapitre.dart';
import 'package:projetpix/DBConnection.dart';
import 'package:projetpix/Home.dart';
import 'package:projetpix/Lecteurvideo.dart';
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
    "Cours",
  ];
  List<String> matiereetcours = [];
  List<String> questiondejafaite = [];
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();

    DBConnection coll = new DBConnection(collec);
    coll.dbconnect.then(((courss) => setState(() {
          _widget.addAll([
            Home(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                    })),
            Search(
                onChangedStep: (indexx, value) => setState(() {
                      index = indexx;
                      for (String i in value) {
                        matiereetcours.add((i));
                      }
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
                    })),
            CoursChapitre(
              onChangedStep: (indexx, value) => setState(() {
                index = indexx;
              }),
              cours: matiereetcours,
              contenuecours: courss,
            )
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
                child: Image.asset(
                  width: 200, // Définir la largeur de l'image
                  height: 200, // Définir la hauteur de l'image
                  fit: BoxFit
                      .cover, // Redimensionner l'image pour remplir le conteneur
                  'assets/images/Loading.jpg',
                ),
              ),
            ))
          : _widget.elementAt(index),
    );
  }
}
