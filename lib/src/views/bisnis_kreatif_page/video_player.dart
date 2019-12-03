import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;
  VideoPlayerScreen({this.url});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _playerController;

  @override
  void initState() {
    _playerController = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _playerController.value.initialized
          ? AspectRatio(
              aspectRatio: _playerController.value.aspectRatio,
              child: VideoPlayer(_playerController),
            )
          : Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
          strokeWidth: 4,
        ),
      ),
    );
  }
}
