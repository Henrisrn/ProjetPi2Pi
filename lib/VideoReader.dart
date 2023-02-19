import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VideoReader extends StatefulWidget {
  const VideoReader({super.key});

  @override
  State<VideoReader> createState() => _VideoReaderState();
}

class _VideoReaderState extends State<VideoReader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("VideoReader"),
    );
  }
}
