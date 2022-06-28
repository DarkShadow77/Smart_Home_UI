/*
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioPlayerWithLocalAsset extends StatefulWidget {
  const AudioPlayerWithLocalAsset({Key? key}) : super(key: key);

  @override
  State<AudioPlayerWithLocalAsset> createState() =>
      _AudioPlayerWithLocalAssetState();
}

class _AudioPlayerWithLocalAssetState extends State<AudioPlayerWithLocalAsset> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  late AudioCache audioCache;
  String path = 'music.mp3';
  int timeProgress = 0;
  int audioDuration = 0;

  Widget slider() {
    return Container(
      width: 300,
      child: Slider.adaptive(
          value: (timeProgress / 1000).floorToDouble(),
          max: (audioDuration / 1000).floorToDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });
  }

  @override
  void dispose() {
    super.dispose;
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
  }

  playMusic() async {
    await audioCache.play(path);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  audioPlayerState == AudioPlayerState.PLAYING
                      ? pauseMusic()
                      : playMusic();
                },
                icon: Icon(audioPlayerState == AudioPlayerState.PLAYING
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded),
                iconSize: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getTimeString(timeProgress)),
                  slider(),
                  audioDuration == 0
                      ? getFileAudioDuration()
                      : Text(getTimeString(audioDuration)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getFileAudioDuration() {
    return FutureBuilder(
        future: _getAudioDuration(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text(getTimeString(snapshot.data));
          }
          return Text('');
        });
  }

  Future<int> _getAudioDuration() async {
    File audioFile = await audioCache.load(path);
    await audioPlayer.setUrl(audioFile.path);
    audioDuration = await Future.delayed(
        Duration(seconds: 2), () => audioPlayer.getDuration());
    return audioDuration;
  }

  String getTimeString(int? milliseconds) {
    if (milliseconds == null) milliseconds = 0;
    String minutes =
        '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000).floor()}';
    String seconds =
        '${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(milliseconds / 1000).floor()}';
    return '$minutes:$seconds'; //returns a string with the format mm:ss
  }

  void seekToSec(int sec) {
    Duration newPosition = Duration(seconds: sec);
    audioPlayer.seek(newPosition);
  }
}
*/
