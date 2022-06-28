import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          width: 62,
          height: 62,
          padding: EdgeInsets.all(0.3),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xffEB8C89),
                  Color(0xffA54982),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 4,
                  color: Color(0xffEB8C89),
                ),
                BoxShadow(
                  offset: Offset(-1, -1),
                  blurRadius: 4,
                  color: Color(0xffA54982),
                ),
              ]),
          child: Center(
            child: Container(
              width: 59,
              height: 59,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xffF77277).withOpacity(0.75),
                    Color(0xffBD4D87).withOpacity(0.75),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffF77277),
                        Color(0xffBD4D87),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xffF897AA).withOpacity(0.5),
                        Color(0xffF897AA),
                      ],
                      stops: [0.5, 0.6, 0.7],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ).createShader(bounds),
                    child: Icon(
                      Icons.stop_rounded,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                  /*child: Icon(
                    icon,
                    color: Colors.white,
                    size: 38,
                  ),*/
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
