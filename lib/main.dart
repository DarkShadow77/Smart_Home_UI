import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:podcast/audio.dart';
import 'package:podcast/utils/colors.dart';

import 'screens/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
      systemNavigationBarColor: Color(0xff30304B),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Impulse',
      home: SafeArea(
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BoringPage extends StatelessWidget {
  const BoringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DashCastApp(),
      ),
    );
  }
}

class PlayBackButton extends StatefulWidget {
  PlayBackButton({Key? key}) : super(key: key);

  @override
  State<PlayBackButton> createState() => _PlayBackButtonState();
}

class _PlayBackButtonState extends State<PlayBackButton> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (_isPlaying) {
          _stop();
        } else {
          _play();
        }
        setState(() => _isPlaying = !_isPlaying);
      },
      icon: _isPlaying ? Icon(Icons.stop) : Icon(Icons.play_arrow_rounded),
    );
  }

  void _stop() {}

  void _play() async {
    final url = 'https://flutter-sound.canardoux.xyz/extract/05.mp3';
    FlutterSound flutterSound = FlutterSound();
    // String path = await flutterSound.startPlayer(url);
  }
}
