import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetpix/Camera.dart';
import 'package:projetpix/Chapitre.dart';
import 'package:projetpix/Chapter.dart';
import 'package:projetpix/CoursChapitre.dart';
import 'package:projetpix/Guest.dart';
import 'package:projetpix/Profil.dart';
import 'package:projetpix/Search.dart';

class Search extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  const Search({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchText = "";
  List<Chapter> _chapters = Chapter.getChapters();
  List<Chapter> _filteredChapters = [];

  List<String> _subjects = [
    "Maths",
    "Physics",
    "Chemistry",
    "Biology",
    "History",
    "Geography"
  ];
  List<String> listeImage = [
    'assets/images/Video1.jpg',
    'assets/images/Video2.jpg',
    'assets/images/Video3.jpg',
    'assets/images/Video4.jpg',
    'assets/images/Video5.jpg',
    'assets/images/Video6.jpg',
    'assets/images/Video7.jpg',
    'assets/images/Video8.jpg',
  ];

  String _selectedSubject = "";

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredChapters = _chapters;
    super.initState();
  }

  int _selectedIndex = 0;
  int index = 0;
  void _onItemTapped(int index) {
    setState(() => {
          _selectedIndex = index,
          widget.onChangedStep(index, [""]),
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF43726B),
            appBar: AppBar(
              backgroundColor: Color(0xFF43726B),
              elevation: 0,
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
            body: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
              return Center(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Text(
                      "Choisis ton chapitre",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 500,
                      child: GridView.builder(
                        itemCount: _filteredChapters.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio:
                              1, // Ajustez la valeur pour modifier la taille des éléments
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              widget.onChangedStep(9, [
                                _filteredChapters[index].title,
                                _filteredChapters[index].subject
                              ]);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  listeImage[index %
                                      listeImage
                                          .length], // Utiliser l'image correspondante
                                  width: double.infinity, // Largeur de l'image
                                  height: double.infinity, // Hauteur de l'image
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(
                                      0.5), // Ajouter un fond légèrement transparent
                                ),
                                Text(
                                  _filteredChapters[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
            })));
  }
}
