import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class About extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  const About({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
              title: Text('About'),
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
            body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Text(
                  """Notre application a été créée par des étudiants de l'Esilv pour promouvoir l'éducation accessible à tous. Nous croyons que l'éducation est un droit fondamental pour tous les individus, indépendamment de leur origine, de leur situation financière ou de leur lieu de résidence. Notre application vise à faciliter l'accès à l'éducation en offrant une plateforme simple et intuitive pour trouver des ressources éducatives de qualité.

Nous avons travaillé dur pour créer une expérience utilisateur fluide et agréable, en offrant une interface intuitive et facile à utiliser pour les utilisateurs de tous niveaux. Que vous soyez un étudiant qui cherche à approfondir ses connaissances, un professionnel qui souhaite acquérir de nouvelles compétences, ou simplement quelqu'un qui veut explorer de nouveaux sujets, notre application est là pour vous aider.

Nous sommes convaincus que l'éducation peut changer des vies et nous espérons que notre application aidera à ouvrir de nouvelles portes pour les personnes qui cherchent à apprendre. Merci de nous soutenir dans notre mission pour rendre l'éducation accessible à tous.

""",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))));
  }
}
