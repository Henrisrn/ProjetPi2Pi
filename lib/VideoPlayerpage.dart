import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final File videoFile;

  VideoPlayerPage({required this.videoFile});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile);
    _controller?.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller!.value.isInitialized
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                  _isPlaying ? _controller?.play() : _controller?.pause();
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
                  _isPlaying
                      ? Container()
                      : Icon(Icons.play_arrow, size: 100.0),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
