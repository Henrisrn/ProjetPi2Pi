/*import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projetpix/Camera.dart';
import 'package:projetpix/Guest.dart';
import 'package:projetpix/Profil.dart';
import 'package:projetpix/Search.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

class Camera extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  final List<CameraDescription> cameraaa;
  const Camera({
    Key? key,
    required this.cameraaa,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  int _selectedIndex = 0;
  int index = 0;
  late CameraController _controler;
  String _lastImage = '';
  late Future<void> Initializecontroler;
  int _selectedCameraindex = 1;

  Future<void> InitCamera(CameraDescription camera) async {
    _controler = CameraController(camera, ResolutionPreset.medium);

    _controler.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (_controler.value.hasError) {
      print(_controler.value.errorDescription);
    }
    Initializecontroler = _controler.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  // ignore: use_function_type_syntax_for_parameters
  @override
  void dispose() {
    _controler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Cameratooglea();
  }

  Future<void> _Takephoto() async {
    try {
      await Initializecontroler;
      print("Photo");
      String path = join((await getTemporaryDirectory()).path,
          "${DateTime.now().millisecondsSinceEpoch}.jpg");
      print(path);
      await _controler.takePicture();
      setState(() => _lastImage = path);
    } catch (e) {
      print("error");
      print(e);
    }
  }

  Future<void> Cameratooglea() async {
    if (_lastImage != '') {
      _lastImage = '';
    }

    setState(() {
      if (_selectedCameraindex > -1) {
        if (_selectedCameraindex == 0) {
          _selectedCameraindex = 1;
        } else {
          _selectedCameraindex = 0;
        }
      }
      ;
    });
    await InitCamera(widget.cameraaa[_selectedCameraindex]);
  }

  void _onItemTapped(int index) {
    setState(() => {
          _selectedIndex = index,
          widget.onChangedStep(index, [""]),
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
            body: FutureBuilder(
              future: Initializecontroler,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      Transform.scale(
                          scale:
                              _controler.value.aspectRatio / size.aspectRatio,
                          child: Center(
                              child: AspectRatio(
                            aspectRatio: _controler.value.aspectRatio,
                            child: CameraPreview(_controler),
                          ))),
                      Positioned(
                        left: 55,
                        bottom: 10,
                        child: FloatingActionButton(
                          onPressed: (() => print("galerie")),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                child: Icon(Icons.photo_album_rounded),
                              ),
                            ),
                            margin: EdgeInsets.only(bottom: 0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                color: Colors.transparent),
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Positioned(
                        right: 55,
                        bottom: 10,
                        child: FloatingActionButton(
                          onPressed: (() => Cameratooglea()),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                child: Icon(Icons.loop),
                              ),
                            ),
                            margin: EdgeInsets.only(bottom: 0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                color: Colors.transparent),
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Positioned(
                        left: 160,
                        bottom: 10,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 10,
                              color: Colors.grey,
                            ),
                            color: Colors.transparent,
                          ),
                          child: FittedBox(
                            child: InkWell(
                              onLongPress: () => print("Take Vidéo"),
                              child: FloatingActionButton(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                onPressed: () => _Takephoto(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Center(
                    child: Scaffold(
                  body: Text("Loading"),
                  backgroundColor: Colors.black,
                ));
              },
            )));
  }
}
*/