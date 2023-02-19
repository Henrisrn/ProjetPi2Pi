import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  String pathvideo;
  VideoPlayerPage({
    required this.pathvideo,
    Key? key,
  }) : super(key: key);
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  bool _isFullScreen = false;
  bool _isMuted = false;
  Duration _position = Duration.zero;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.pathvideo);
    _initializeVideoPlayerFuture = _controller?.initialize();
    _controller?.addListener(() {
      if (_controller!.value.position >= _controller!.value.duration) {
        _controller?.pause();
        _controller?.seekTo(Duration.zero);
      }
      setState(() {
        _position = _controller!.value.position;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _toggleFullScreen() async {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller?.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    print("Ce que je reçois : " + widget.pathvideo);
    int index = 0;
    double padingvideo = 13;
    void _onItemTapped(int index) {
      setState(() => {
            _selectedIndex = index,
          });
    }

    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (_controller!.value.isPlaying) {
              _controller?.pause();
            } else {
              _controller?.play();
            }
          },
          onLongPress: () {
            _controller?.pause();
          },
          onLongPressUp: () {
            _controller?.play();
          },
          onDoubleTap: _toggleMute,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                    onPressed: _toggleMute,
                  ),
                  IconButton(
                    icon: Icon(_isFullScreen
                        ? Icons.fullscreen_exit
                        : Icons.fullscreen),
                    onPressed: _toggleFullScreen,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: VideoProgressIndicator(
                  _controller!,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Colors.red,
                    backgroundColor: Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
