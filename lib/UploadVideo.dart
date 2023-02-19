import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:projetpix/VideoReader.dart';
import 'package:video_player/video_player.dart';

class VideoUploaderPage extends StatefulWidget {
  @override
  _VideoUploaderPageState createState() => _VideoUploaderPageState();
}

class _VideoUploaderPageState extends State<VideoUploaderPage> {
  File? _videoFile;
  String? _videoUrl;

  final picker = ImagePicker();

  Future<void> _pickVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    setState(() {
      _videoFile = File(pickedFile!.path);
    });
  }

  Future<void> _uploadVideo() async {
    final url =
        'https://example.com/api/upload-video'; // Remplacer l'URL par l'API pour l'envoi de vidéos

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('video', _videoFile!.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseJson = await response.stream.bytesToString();
      setState(() {
        _videoUrl = responseJson; // L'URL de la vidéo envoyée par l'API
      });
    } else {
      print('Erreur lors de l\'envoi de la vidéo: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploader une vidéo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_videoFile != null)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(VideoPlayerController.file(_videoFile!)),
              )
            else
              Icon(Icons.videocam, size: 80),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Sélectionner une vidéo'),
              onPressed: _pickVideo,
            ),
            SizedBox(height: 32),
            if (_videoFile != null)
              ElevatedButton(
                child: Text('Envoyer la vidéo'),
                onPressed: _uploadVideo,
              ),
            SizedBox(height: 32),
            if (_videoUrl != null) Text('URL de la vidéo: $_videoUrl'),
          ],
        ),
      ),
    );
  }
}
