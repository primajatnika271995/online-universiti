import 'package:flutter/material.dart';
import 'package:online_university/src/views/component/log.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TeaserVideoPlayer extends StatefulWidget {
  final String url;
  final String thumbnails;
  TeaserVideoPlayer({this.url, this.thumbnails});

  @override
  _TeaserVideoPlayerState createState() => _TeaserVideoPlayerState();
}

class _TeaserVideoPlayerState extends State<TeaserVideoPlayer> {
  YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    // TODO: implement initState
    var videoId = YoutubePlayer.convertUrlToId(widget.url);

    _youtubePlayerController = new YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        forceHideAnnotation: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _youtubePlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          YoutubePlayer(
            controller: _youtubePlayerController,
            showVideoProgressIndicator: true,
            onReady: () {
              log.info("Teaser Ready to Play");
            },
          ),
        ],
      ),
    );
  }
}
