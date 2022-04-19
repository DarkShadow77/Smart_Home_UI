import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SleekSlider(),
      ),
    );
  }
}

class SleekSlider extends StatelessWidget {
  SleekSlider({Key? key}) : super(key: key);

  Widget slider = SleekCircularSlider(
    appearance: CircularSliderAppearance(),
    initialValue: 25,
    onChange: (double value) {
      print(value);
    },
  );

  Widget slider1 = SleekCircularSlider(
    appearance: CircularSliderAppearance(
      size: 220,
      customWidths: CustomSliderWidths(
        progressBarWidth: 10,
      ),
      customColors: CustomSliderColors(
        trackColor: Colors.transparent,
        progressBarColors: [
          Color(0xff985ee1),
          Color(0xfff25656),
        ],
        dotColor: Colors.transparent,
        shadowMaxOpacity: 0.0,
      ),
    ),
    initialValue: 60,
    onChange: (double value) {
      print(value);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          slider,
          slider1,
        ],
      ),
    );
  }
}
