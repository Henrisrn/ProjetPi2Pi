import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CGU extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  const CGU({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);
  @override
  State<CGU> createState() => _CGUState();
}

class _CGUState extends State<CGU> {
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
            backgroundColor: Colors.grey[700],
            appBar: AppBar(
              title: Text('CGU'),
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
            body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Text(
                    """La présente application (ci-après désignée "l'Application") est mise à disposition des utilisateurs (ci-après désignés "l'Utilisateur") par [Nom de la société ou de l'entreprise qui développe l'Application].

En utilisant l'Application, l'Utilisateur accepte sans réserve les présentes conditions générales d'utilisation (ci-après désignées "CGU").

Objet de l'Application

L'Application a pour objet de [décrire l'objectif de l'Application, son utilité et ses fonctionnalités].

Accès à l'Application

L'accès à l'Application est réservé à l'Utilisateur qui dispose d'un appareil compatible avec les spécifications techniques requises pour son utilisation.

L'accès à l'Application est gratuit, mais les frais de connexion à Internet restent à la charge de l'Utilisateur.

L'Utilisateur est responsable du maintien de la confidentialité de son identifiant et de son mot de passe.

Droits de propriété intellectuelle

L'Application est la propriété exclusive de [Nom de la société ou de l'entreprise qui développe l'Application] et est protégée par les lois et réglementations relatives à la propriété intellectuelle.

Toute reproduction, représentation, diffusion ou utilisation de l'Application, même partielle, est strictement interdite sans l'autorisation écrite de [Nom de la société ou de l'entreprise qui développe l'Application].

Responsabilité

L'Utilisateur est seul responsable de l'utilisation qu'il fait de l'Application.

[Nom de la société ou de l'entreprise qui développe l'Application] ne saurait être tenue responsable des dommages directs ou indirects subis par l'Utilisateur ou des tiers du fait de l'utilisation de l'Application.

Modification des CGU

[Nom de la société ou de l'entreprise qui développe l'Application] se réserve le droit de modifier à tout moment les présentes CGU.

L'Utilisateur sera informé de toute modification des CGU par une notification dans l'Application ou par email.

Droit applicable et juridiction compétente

Les présentes CGU sont soumises au droit français.

En cas de litige relatif à l'interprétation ou à l'exécution des présentes CGU, les parties s'efforceront de trouver une solution amiable.

À défaut d'accord amiable, les tribunaux français seront seuls compétents pour connaître de tout litige relatif aux présentes CGU.

Fait à Bougival , le 01/04/2023.
""",
                    style: TextStyle(color: Colors.white)))));
  }
}
