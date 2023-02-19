import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Terms extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  const Terms({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);
  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
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
              title: Text('Terms of Service'),
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
            body: Container(
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                  SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Text(
                        """Notre application a été créée dans le but de promouvoir l'éducation accessible à tous. En utilisant notre application, vous acceptez les conditions d'utilisation suivantes :

Contenu : Tout le contenu de l'application est la propriété de notre équipe et ne peut être reproduit, copié ou utilisé à des fins commerciales sans notre autorisation préalable.

Confidentialité : Nous nous engageons à protéger votre vie privée et vos données personnelles conformément à la réglementation en vigueur. Nous ne vendrons ni ne partagerons vos données personnelles avec des tiers.

Utilisation : Notre application est destinée à un usage personnel et éducatif. Vous ne pouvez pas utiliser notre application à des fins commerciales, de marketing ou pour toute autre activité illégale.

Responsabilité : Nous nous efforçons de fournir des informations précises et fiables, mais nous ne pouvons pas garantir l'exactitude ou l'exhaustivité du contenu de l'application. Vous utilisez notre application à vos propres risques et nous ne serons pas responsables des dommages directs ou indirects résultant de l'utilisation de l'application.

Modifications : Nous nous réservons le droit de modifier les conditions d'utilisation de l'application à tout moment. Il est de votre responsabilité de consulter régulièrement les conditions d'utilisation pour vous assurer que vous êtes toujours en conformité avec les conditions en vigueur.

En utilisant notre application, vous acceptez ces conditions d'utilisation. Si vous n'êtes pas d'accord avec ces conditions, veuillez ne pas utiliser notre application.
""",
                        style: TextStyle(color: Colors.white),
                      ))
                ])))));
  }
}
