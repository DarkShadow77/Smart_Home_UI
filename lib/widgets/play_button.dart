import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
    required this.diameter,
    required this.iconsize,
  }) : super(key: key);

  final double diameter;
  final double iconsize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          width: diameter,
          height: diameter,
          padding: EdgeInsets.all(0.3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff30304B),
          ),
          child: Center(
            child: ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  Colors.white,
                  Color(0xff30304B).withOpacity(0.5),
                  Color(0xff30304B),
                ],
                stops: [0.5, 0.6, 0.7],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ).createShader(bounds),
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: iconsize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
