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
            backgroundColor: Colors.grey[700],
            appBar: AppBar(
              backgroundColor: Colors.grey[700],
              elevation: 0,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.grey[500],
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
              return Center(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      "Choose your chapter",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: _subjects.map((subject) {
                              return ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedSubject = subject;
                                    if (_selectedSubject == "") {
                                      _filteredChapters = _chapters;
                                    } else {
                                      _filteredChapters = _chapters
                                          .where((chapter) =>
                                              chapter.subject ==
                                              _selectedSubject)
                                          .toList();
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(2),
                                  primary: _selectedSubject == subject
                                      ? Colors.blue
                                      : Colors.green,
                                ),
                                child: Text(
                                  subject,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                    Container(
                      height: 300,
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: _filteredChapters.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(2),
                                    primary: Colors.transparent),
                                onPressed: () => Matiere(
                                    onChangedStep: (indexx, value) =>
                                        setState(() {
                                          index = indexx;
                                        }),
                                    chap: _filteredChapters[index]),
                                child: Text(
                                  _filteredChapters[index].title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              subtitle: Text(
                                _filteredChapters[index].subject,
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ));
            })));
  }
}
