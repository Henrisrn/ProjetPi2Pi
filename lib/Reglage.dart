import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Reglage extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  const Reglage({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<Reglage> createState() => _ReglageState();
}

class _ReglageState extends State<Reglage> {
  int _selectedIndex = 0;

  void _onItemTappedd(int index) {
    setState(() => {
          _selectedIndex = index,
          widget.onChangedStep(index, [""]),
        });
  }

  bool _enableNotifications = true;
  bool _enableDarkMode = false;
  String langue = "English";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF43726B),
      appBar: AppBar(
        title: Text("Reglage"),
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
        onTap: _onItemTappedd,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Enable Notifications',
                style: TextStyle(color: Colors.white)),
            value: _enableNotifications,
            onChanged: (value) {
              setState(() {
                _enableNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title:
                Text('Enable Dark Mode', style: TextStyle(color: Colors.white)),
            value: _enableDarkMode,
            onChanged: (value) {
              setState(() {
                _enableDarkMode = value;
              });
            },
          ),
          ListTile(
            title: Text('Language', style: TextStyle(color: Colors.white)),
            subtitle: Text(langue, style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() {
                if (langue == "Français") {
                  langue = "English";
                } else {
                  langue = "Français";
                }
              });
              // TODO: Implement language settings.
            },
          ),
          ListTile(
            title: Text('About', style: TextStyle(color: Colors.white)),
            onTap: () {
              widget.onChangedStep(7, [""]);
            },
          ),
          ListTile(
            title:
                Text('Terms of Service', style: TextStyle(color: Colors.white)),
            onTap: () {
              widget.onChangedStep(8, [""]);
            },
          ),
          ListTile(
            title:
                Text('Privacy Policy', style: TextStyle(color: Colors.white)),
            onTap: () {
              widget.onChangedStep(6, [""]);
              // TODO: Implement privacy policy page.
            },
          ),
        ],
      ),
    ));
  }
}
