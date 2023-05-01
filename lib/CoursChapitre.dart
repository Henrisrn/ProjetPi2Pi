import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetpix/Camera.dart';
import 'package:projetpix/Chapitre.dart';
import 'package:projetpix/Chapter.dart';
import 'package:projetpix/Guest.dart';
import 'package:projetpix/Profil.dart';
import 'package:projetpix/Search.dart';

class CoursChapitre extends StatefulWidget {
  final List<String> cours;
  final List<Map<String, String>> contenuecours;
  final Function(int, List<String>) onChangedStep;
  const CoursChapitre(
      {required this.onChangedStep,
      required this.cours,
      required this.contenuecours,
      super.key});

  @override
  State<CoursChapitre> createState() => _CoursChapitreState();
}

class _CoursChapitreState extends State<CoursChapitre> {
  int _selectedIndex = 0;
  int index = 0;
  Map<String, String> moncours = {};
  void _onItemTapped(int index) {
    setState(() => {
          _selectedIndex = index,
          widget.onChangedStep(index, [""]),
        });
  }

  @override
  void initState() {
    for (Map<String, String?> i in widget.contenuecours) {
      if (i["Domaine"] == widget.cours[widget.cours.length - 1] &&
          i["Titrecours"] == widget.cours[widget.cours.length - 2]) {
        moncours["Contenue"] = i["Contenue"] ?? "";
        moncours["Imagelien1"] = i["Imagelien1"] ?? "";
        moncours["Imagelien2"] = i["Imagelien2"] ?? "";
      }
      print(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                widget.cours[widget.cours.length - 1],
              )),
              backgroundColor: Color.fromARGB(255, 234, 175, 58),
              elevation: 5,
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera),
                  label: 'Camera',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFF43726B), // Vert
              unselectedItemColor: Color.fromARGB(100, 147, 167, 163), // Blanc
              onTap: _onItemTapped,
            ),
            backgroundColor: Color(0xFF43726B),
            body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Text(widget.cours[widget.cours.length - 2],
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    width: 200, // Définir la largeur de l'image
                    height: 200, // Définir la hauteur de l'image
                    fit: BoxFit
                        .cover, // Redimensionner l'image pour remplir le conteneur
                    moncours["Imagelien1"] ?? "assets/images/Loading.jpg",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(moncours["Contenue"] ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    width: 200, // Définir la largeur de l'image
                    height: 200, // Définir la hauteur de l'image
                    fit: BoxFit
                        .cover, // Redimensionner l'image pour remplir le conteneur
                    moncours["Imagelien2"] ?? "assets/images/Loading.jpg",
                  ),
                ]))));
  }
}
