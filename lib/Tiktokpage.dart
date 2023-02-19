import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TikTokClonePage extends StatefulWidget {
  @override
  _TikTokClonePageState createState() => _TikTokClonePageState();
}

class _TikTokClonePageState extends State<TikTokClonePage> {
  List<VideoPlayerController> _controllers = [
    VideoPlayerController.asset('assets/videos/Video1.mp4'),
    VideoPlayerController.asset('assets/videos/Video2.mp4'),
    VideoPlayerController.asset('assets/videos/Video3.mp4'),
  ];
  int _currentIndex = 0;
  bool _isPlaying = true;
  bool _showOverlay = true;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
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
