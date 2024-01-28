// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtubeplayer extends StatefulWidget {
  const youtubeplayer({super.key});

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
    _controller = YoutubePlayerController(
      initialVideoId: 'P8P_S1Fjl_Q',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
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
      appBar: fullScreenOn ?  null:constAppbar(title: 'video') ,
      body: Container(
        color: mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: !fullScreenOn,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Video Title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height:fullScreenOn ? MediaQuery.of(context).size.height : 230 ,
                child: YoutubePlayerBuilder(
                  onEnterFullScreen: (){
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
                  player: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.blue,
                      handleColor: Colors.blueAccent,
                    ),
                  ), builder: (BuildContext , Widget ) => Scaffold(appBar: AppBar(),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}