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
            backgroundColor: Colors.grey[700],
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
              backgroundColor: Colors.grey[700],
              elevation: 0,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.grey[200],
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.grey[700],
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
              onTap: _onItemTapped,
            ),
            body: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Mon Pseudo',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Points : 3035',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(6),
                      children: <Widget>[
                        ListTile(
                            leading: Image.asset(
                              width: 100, // Définir la largeur de l'image
                              height: 100, // Définir la hauteur de l'image
                              fit: BoxFit
                                  .cover, // Redimensionner l'image pour remplir le conteneur
                              'assets/images/Video1.jpg',
                            ),
                            title: Text(
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              'Nom de la vidéo 1',
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayerPage(
                                          pathvideo: 'assets/videos/Video1.mp4',
                                        )),
                              );
                            }),
                        SizedBox(
                          height: padingvideo,
                        ),
                        ListTile(
                          leading: Image.asset(
                            width: 100, // Définir la largeur de l'image
                            height: 100, // Définir la hauteur de l'image
                            fit: BoxFit
                                .cover, // Redimensionner l'image pour remplir le conteneur
                            'assets/images/Video2.jpg',
                          ),
                          title: Text(
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            'Nom de la vidéo 1',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                        pathvideo: 'assets/videos/Video2.mp4',
                                      )),
                            );
                            // TODO: Navigate to video detail page
                          },
                        ),
                        SizedBox(
                          height: padingvideo,
                        ),
                        ListTile(
                          leading: Image.asset(
                            width: 100, // Définir la largeur de l'image
                            height: 100, // Définir la hauteur de l'image
                            fit: BoxFit
                                .cover, // Redimensionner l'image pour remplir le conteneur
                            'assets/images/Video3.jpg',
                          ),
                          title: Text(
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            'Nom de la vidéo 1',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                        pathvideo: 'assets/videos/Video3.mp4',
                                      )),
                            );
                          },
                        ),
                        SizedBox(
                          height: padingvideo,
                        ),
                        ListTile(
                          leading: Image.asset(
                            width: 100, // Définir la largeur de l'image
                            height: 100, // Définir la hauteur de l'image
                            fit: BoxFit
                                .cover, // Redimensionner l'image pour remplir le conteneur
                            'assets/images/Video2.jpg',
                          ),
                          title: Text(
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            'Nom de la vidéo 1',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                        pathvideo: 'assets/videos/Video4.mp4',
                                      )),
                            );
                            // TODO: Navigate to video detail page
                          },
                        ),
                        SizedBox(
                          height: padingvideo,
                        ),
                        ListTile(
                          leading: Image.asset(
                            width: 100, // Définir la largeur de l'image
                            height: 100, // Définir la hauteur de l'image
                            fit: BoxFit
                                .cover, // Redimensionner l'image pour remplir le conteneur
                            'assets/images/Video2.jpg',
                          ),
                          title: Text(
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            'Nom de la vidéo 1',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                        pathvideo: 'assets/videos/Video5.mp4',
                                      )),
                            );
                            // TODO: Navigate to video detail page
                          },
                        ),
                        SizedBox(
                          height: padingvideo,
                        ),
                        ListTile(
                          leading: Image.asset(
                            width: 100, // Définir la largeur de l'image
                            height: 100, // Définir la hauteur de l'image
                            fit: BoxFit
                                .cover, // Redimensionner l'image pour remplir le conteneur
                            'assets/images/Video2.jpg',
                          ),
                          title: Text(
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            'Nom de la vidéo 1',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                        pathvideo: 'assets/videos/Video6.mp4',
                                      )),
                            );
                            // TODO: Navigate to video detail page
                          },
                        ),
                        SizedBox(
                          height: padingvideo,
                        ),
                        ListTile(
                          leading: Image.asset(
                            width: 100, // Définir la largeur de l'image
                            height: 100, // Définir la hauteur de l'image
                            fit: BoxFit
                                .cover, // Redimensionner l'image pour remplir le conteneur
                            'assets/images/Video2.jpg',
                          ),
                          title: Text(
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            'Nom de la vidéo 1',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                        pathvideo: 'assets/videos/Video7.mp4',
                                      )),
                            );
                            // TODO: Navigate to video detail page
                          },
                        ),
                        SizedBox(
                          height: padingvideo,
                        ),
                        ListTile(
                          leading: Image.asset(
                            width: 100, // Définir la largeur de l'image
                            height: 100, // Définir la hauteur de l'image
                            fit: BoxFit
                                .cover, // Redimensionner l'image pour remplir le conteneur
                            'assets/images/Video2.jpg',
                          ),
                          title: Text(
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            'Nom de la vidéo 1',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                        pathvideo: 'assets/videos/Video8.mp4',
                                      )),
                            );
                            // TODO: Navigate to video detail page
                          },
                        ),
                        SizedBox(
                          height: padingvideo,
                        ),
                        ListTile(
                          leading: Image.asset(
                            width: 100, // Définir la largeur de l'image
                            height: 100, // Définir la hauteur de l'image
                            fit: BoxFit
                                .cover, // Redimensionner l'image pour remplir le conteneur
                            'assets/images/Video2.jpg',
                          ),
                          title: Text(
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            'Nom de la vidéo 1',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                        pathvideo: 'assets/videos/Video9.mp4',
                                      )),
                            );
                            // TODO: Navigate to video detail page
                          },
                        ),
                        SizedBox(
                          height: padingvideo,
                        ),
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
