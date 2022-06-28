import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

const int duration = 42673;
final _exampleAudioFilePathMP3 =
    'https://flutter-sound.canardoux.xyz/extract/05.mp3';

///
typedef Fn = void Function();

/// Example app.
class SimplePlayback extends StatefulWidget {
  @override
  _SimplePlaybackState createState() => _SimplePlaybackState();
}

class _SimplePlaybackState extends State<SimplePlayback> {
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  bool _mPlayerIsInited = false;
  int pos = 0;

  @override
  void initState() {
    super.initState();
    _mPlayer!.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
  }

  @override
  void dispose() {
    stopPlayer();
    // Be careful : you must `close` the audio session when you have finished with it.
    _mPlayer!.closePlayer();
    _mPlayer = null;

    super.dispose();
  }

  // -------  Here is the code to playback a remote file -----------------------

  void play() async {
    await _mPlayer!.startPlayer(
        fromURI: _exampleAudioFilePathMP3,
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {});
        });
    setState(() {});
  }

  Future<void> stopPlayer() async {
    if (_mPlayer != null) {
      await _mPlayer!.stopPlayer();
    }
  }

  Future<void> setPos(int d) async {
    if (d > duration) {
      d = duration;
    }
    setState(() {
      pos = d;
    });
  }

  Future<void> seek(double d) async {
    await _mPlayer?.seekToPlayer(Duration(milliseconds: d.floor()));
    await setPos(d.floor());
  }

  Fn? getPlaybackFn() {
    if (!_mPlayerIsInited) {
      return null;
    }
    return _mPlayer!.isStopped
        ? play
        : () {
            stopPlayer().then((value) => setState(() {}));
          };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: pos + 0.0,
          min: 0.0,
          max: duration + 0.0,
          onChanged: seek,
          //divisions: 100
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.fast_rewind_rounded),
              onPressed: () {},
            ),
            IconButton(
              onPressed: getPlaybackFn(),
              icon: _mPlayer!.isPlaying
                  ? Icon(Icons.stop)
                  : Icon(Icons.play_arrow_rounded),
            ),
            IconButton(
              icon: Icon(Icons.fast_forward_rounded),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class DashCastApp extends StatelessWidget {
  const DashCastApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(flex: 9, child: Placeholder()),
        Flexible(flex: 2, child: AudioControls()),
      ],
    );
  }
}

class AudioControls extends StatelessWidget {
  const AudioControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimplePlayback(),
      ],
    );
  }
}
