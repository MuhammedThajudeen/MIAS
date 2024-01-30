// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtubeplayer extends StatefulWidget {
  const youtubeplayer(
      {super.key, required this.videoUrl, required this.videoTitle});
  final String videoTitle;
  final String videoUrl;

  @override
  State<youtubeplayer> createState() => _youtubeplayerState();
}

class _youtubeplayerState extends State<youtubeplayer> {
  late YoutubePlayerController _controller;

  bool fullScreenOn = false;
  @override
  void initState() {
    super.initState();
    // Replace with your YouTube video ID

    var videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    print(videoId);
    _controller = YoutubePlayerController(
      initialVideoId: videoId as String,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullScreenOn ? null : constAppbar(title: '', elevation: 5),
      body: Container(
        color: mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: !fullScreenOn,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  widget.videoTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  height: fullScreenOn ? MediaQuery.of(context).size.height : 230,
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.blue,
                        handleColor: Colors.blueAccent,
                      ),
                      topActions: [
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            _controller.metadata.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    onEnterFullScreen: () {
                      setState(() {
                        fullScreenOn = true;
                      });
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.landscapeLeft,
                        DeviceOrientation.landscapeRight,
                      ]);
                    },
                    onExitFullScreen: () {
                      setState(() {
                        fullScreenOn = false;
                      });
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.landscapeLeft,
                        DeviceOrientation.landscapeRight,
                        DeviceOrientation.portraitUp,
                        DeviceOrientation.portraitDown,
                      ]);
                    },
                    builder: (BuildContext, Widget) => Scaffold(
                      appBar: AppBar(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}