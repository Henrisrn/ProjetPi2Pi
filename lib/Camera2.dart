import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class TakeVideoPage extends StatefulWidget {
  final Function(int, List<String>) onChangedStep;
  const TakeVideoPage({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);
  @override
  _TakeVideoPageState createState() => _TakeVideoPageState();
}

class _TakeVideoPageState extends State<TakeVideoPage> {
  final ImagePicker _picker = ImagePicker();
  File? _videoFile;
  VideoPlayerController? _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _getVideo();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _getVideo() async {
    final pickedFile = await _picker.getVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      final appDocDir = await getApplicationDocumentsDirectory();
      final videoDir = Directory('${appDocDir.path}/videos');
      if (!await videoDir.exists()) {
        videoDir.create();
      }
      final fileName = path.basename(pickedFile.path);
      final savedFile =
          await File(pickedFile.path).copy('${videoDir.path}/$fileName');
      setState(() {
        _videoFile = savedFile;
        _controller = VideoPlayerController.file(_videoFile!);
        _controller?.initialize().then((_) {
          setState(() {});
        });
      });
    }
  }

  Future<void> _sendVideo() async {
    // TODO: envoyer la vidéo où vous voulez
    // Revenir à la page précédente
    final file = File(_videoFile!.path);

    // Définir le nom de fichier et le chemin d'accès pour le fichier vidéo
  }

  int _selectedIndex = 0;

  void _onItemTappedd(int index) {
    setState(() => {
          _selectedIndex = index,
          widget.onChangedStep(index, [""]),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[700],
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
        onTap: _onItemTappedd,
      ),
      body: _videoFile == null
          ? Center(
              child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Prendre une vidéo ? ",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 400,
                ),
                FloatingActionButton(
                  onPressed: _getVideo,
                  child: Icon(
                    Icons.video_call,
                    color: Colors.black,
                    size: 30,
                  ),
                  backgroundColor: Colors.grey[300],
                  elevation: 10,
                ),
              ],
            ))
          : Stack(
              children: [
                AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                      _isPlaying ? _controller?.play() : _controller?.pause();
                    });
                  },
                  child: _isPlaying
                      ? Container()
                      : Icon(Icons.play_arrow,
                          size: 100.0, color: Colors.white),
                ),
              ],
            ),
      floatingActionButton: _videoFile == null
          ? null
          : FloatingActionButton(
              onPressed: _getVideo,
              child: Icon(Icons.video_call),
            ),
    );
  }
}
