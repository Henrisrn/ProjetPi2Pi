import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetpix/Camera.dart';
import 'package:projetpix/Guest.dart';
import 'package:projetpix/Lecteurvideo.dart';
import 'package:projetpix/Profil.dart';
import 'package:projetpix/Search.dart';

class Profile extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  const Profile({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;
  int index = 0;
  List<String> videoTitles = [
    'Nom de la vidéo 1',
    'Nom de la vidéo 2',
    'Nom de la vidéo 3',
    'Nom de la vidéo 4',
    'Nom de la vidéo 5',
    'Nom de la vidéo 6',
    'Nom de la vidéo 7',
    'Nom de la vidéo 8',
  ];

  List<String> videoImages = [
    'assets/images/Video1.jpg',
    'assets/images/Video2.jpg',
    'assets/images/Video3.jpg',
    'assets/images/Video4.jpg',
    'assets/images/Video5.jpg',
    'assets/images/Video6.jpg',
    'assets/images/Video7.jpg',
    'assets/images/Video8.jpg',
  ];

  List<String> videoPaths = [
    'assets/videos/Video1.mp4',
    'assets/videos/Video2.mp4',
    'assets/videos/Video3.mp4',
    'assets/videos/Video4.mp4',
    'assets/videos/Video5.mp4',
    'assets/videos/Video6.mp4',
    'assets/videos/Video7.mp4',
    'assets/videos/Video8.mp4',
    'assets/videos/Video9.mp4',
  ];

  double padingvideo = 13;
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
              title: Text('Mon Profil'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  tooltip: 'Réglages',
                  onPressed: () => {
                    widget.onChangedStep(4, [""])
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star_border),
                  tooltip: 'Devenir Premium',
                  onPressed: () => {
                    widget.onChangedStep(5, [""])
                  },
                ),
              ],
              backgroundColor: Color.fromARGB(255, 234, 175, 58),
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mon Pseudo',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Abonnés : ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: '250',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 234, 175, 58)),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Abonnements : ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: '100',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 234, 175, 58)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(6),
                      children: <Widget>[
                        for (var i = 0; i < videoTitles.length; i++) ...[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayerPage(
                                          pathvideo: videoPaths[i],
                                        )),
                              );
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                  videoImages[i],
                                  width: double.infinity, // Largeur de l'image
                                  height: 100, // Hauteur de l'image
                                  fit: BoxFit.cover, // Remplir le conteneur
                                ),
                                Container(
                                  height: 100,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Positioned(
                                  top: 40, // Positionner le titre
                                  left: 16,
                                  child: Text(
                                    videoTitles[i],
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: padingvideo),
                        ],
                      ],
                    ),
                  ),
                ],
              );
            })));
  }
}

Widget _buildVideoListItem(
    String title, String imagePath, BuildContext context) {
  return ListTile(
    leading: Image.asset(
      width: 100, // Définir la largeur de l'image
      height: 100, // Définir la hauteur de l'image
      fit: BoxFit.cover, // Redimensionner l'image pour remplir le conteneur
      imagePath,
    ),
    title: Text(
      style: TextStyle(fontSize: 16, color: Colors.white),
      title,
    ),
    onTap: () {
      // TODO: Navigate to video detail page
    },
  );
}
