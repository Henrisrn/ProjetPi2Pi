import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class TikTokClonePage extends StatefulWidget {
  @override
  _TikTokClonePageState createState() => _TikTokClonePageState();
}

class _TikTokClonePageState extends State<TikTokClonePage> {
  //TAILLE MAX DU VIDEO PLAYER CONTROLLER 16
  List<VideoPlayerController> _controllers = [];
  final List<VideoPlayerController> _controllers1 = [
    VideoPlayerController.asset('assets/videos/Video1.mp4'),
    VideoPlayerController.asset('assets/videos/Video2.mp4'),
    VideoPlayerController.asset('assets/videos/Video3.mp4'),
    VideoPlayerController.asset('assets/videos/Video4.mp4'),
    VideoPlayerController.asset('assets/videos/Video5.mp4'),
    VideoPlayerController.asset('assets/videos/Video6.mp4'),
    VideoPlayerController.asset('assets/videos/Video7.mp4'),
    VideoPlayerController.asset('assets/videos/Video8.mp4'),
    VideoPlayerController.asset('assets/videos/Video9.mp4'),
    VideoPlayerController.asset('assets/videos/Video10.mp4'),
    VideoPlayerController.asset('assets/videos/Video11.mp4'),
    VideoPlayerController.asset('assets/videos/Video12.mp4'),
    VideoPlayerController.asset('assets/videos/Video13.mp4'),
    VideoPlayerController.asset('assets/videos/Video14.mp4'),
    VideoPlayerController.asset('assets/videos/Video15.mp4'),
    VideoPlayerController.asset('assets/videos/Video16.mp4'),
  ];
  /*final List<VideoPlayerController> _controllers2 = [
    VideoPlayerController.asset('assets/videos/Video17.mp4'),
    VideoPlayerController.asset('assets/videos/Video18.mp4'),
    VideoPlayerController.asset('assets/videos/Video19.mp4'),
    VideoPlayerController.asset('assets/videos/Video20.mp4'),
    VideoPlayerController.asset('assets/videos/Video21.mp4'),
    VideoPlayerController.asset('assets/videos/Video22.mp4'),
    VideoPlayerController.asset('assets/videos/Video23.mp4'),
    VideoPlayerController.asset('assets/videos/Video24.mp4'),
    VideoPlayerController.asset('assets/videos/Video25.mp4'),
    VideoPlayerController.asset('assets/videos/Video26.mp4'),
    VideoPlayerController.asset('assets/videos/Video27.mp4'),
    VideoPlayerController.asset('assets/videos/Video28.mp4'),
    VideoPlayerController.asset('assets/videos/Video29.mp4'),
    VideoPlayerController.asset('assets/videos/Video30.mp4'),
    VideoPlayerController.asset('assets/videos/Video31.mp4'),
    VideoPlayerController.asset('assets/videos/Video32.mp4'),
  ];*/

  Future<void> copyFilesToAssets() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final assetDir = await rootBundle;
    final files = await Directory(appDocDir.path).list().toList();
    print("CECI SONT LES FILES :");
    for (FileSystemEntity i in files) {
      print(i.path);
    }

    for (final file in files) {
      final fileName = file.path.split('/').last;
      final assetPath = 'assets/$fileName';
      ByteData data = await rootBundle.load(assetPath);
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      File('${assetDir}/$fileName').writeAsBytesSync(bytes);
    }
  }

  int _currentIndex = 0;
  bool _isPlaying = true;
  bool _showOverlay = true;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _controllers = _controllers1;
    _controllers.forEach((controller) => controller.initialize());
    _controllers[_currentIndex].play();
    _controllers[_currentIndex].setLooping(true);
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((controller) => controller.dispose());
    _pageController?.dispose();
  }

  void _onTapVideo() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _controllers[_currentIndex].play();
      } else {
        _controllers[_currentIndex].pause();
      }
    });
  }

  void _onDoubleTapVideo() {
    setState(() {
      _controllers[_currentIndex].setPlaybackSpeed(2.0);
    });
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _controllers[_currentIndex].setPlaybackSpeed(1.0);
      });
    });
  }

  void _onLongPressVideo() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  void _onVideoEnd() {
    if (_currentIndex == _controllers.length) {
      _controllers = _controllers1;
    }
    setState(() {
      _currentIndex = (_currentIndex + 1) % _controllers.length;
      _isPlaying = true;
      _controllers[_currentIndex].seekTo(Duration.zero);
      _controllers[_currentIndex].play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: _onTapVideo,
            onDoubleTap: _onDoubleTapVideo,
            onLongPress: _onLongPressVideo,
            child: VideoPlayer(_controllers[_currentIndex]),
          ),
          if (_showOverlay)
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_drop_up,
                            size: 50, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _currentIndex =
                                (_currentIndex + 1) % _controllers.length;
                            _isPlaying = true;
                            _controllers[_currentIndex].seekTo(Duration.zero);
                            _controllers[_currentIndex].play();
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down,
                            size: 50, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _currentIndex =
                                (_currentIndex - 1 + _controllers.length) %
                                    _controllers.length;
                            _isPlaying = true;
                            _controllers[_currentIndex].seekTo(Duration.zero);
                            _controllers[_currentIndex].play();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
