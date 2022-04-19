import 'dart:ui';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class BottomBar extends StatelessWidget {
  BottomBar({Key? key}) : super(key: key);

  double actionTabButtonWidth = 86;
  double actionTabButtonHeight = 86;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        child: Stack(
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 10,
                  sigmaX: 10,
                ),
                child: Container(
                  width: size.width,
                  color: Colors.white.withOpacity(0.5),
                  height: 88,
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(size.width, 88),
                        painter: RPSCustomPainter(),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                SFSymbols.house,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                SFSymbols.person,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: size.width / 2 - (actionTabButtonWidth / 2),
              child: Center(
                heightFactor: 0.5,
                child: Container(
                  width: actionTabButtonWidth,
                  height: actionTabButtonHeight,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 5,
                        color: Colors.white.withOpacity(0.20),
                        inset: true,
                      ),
                      BoxShadow(
                        offset: Offset(-5, -5),
                        blurRadius: 5,
                        color: Colors.white,
                        inset: true,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffdadfe7).withOpacity(0.20),
                              Color(0xfff5f5f9).withOpacity(0.20),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 12,
                              color: Color(0xff8e9bae).withOpacity(0.10),
                            )
                          ],
                        ),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Color(0xffaeaeae),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 9),
                                  blurRadius: 18,
                                  color: Color(0xff8e9bae).withOpacity(0.20),
                                ),
                              ],
                            ),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffdadfe7),
                                    Color(0xfff5f5f9),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 5,
                                    color: Colors.white,
                                    inset: true,
                                  ),
                                  BoxShadow(
                                    offset: Offset(-5, -5),
                                    blurRadius: 5,
                                    color: Colors.white,
                                    inset: true,
                                  ),
                                ],
                              ),
                              child: ShaderMask(
                                blendMode: BlendMode.srcATop,
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    Color(0xff985ee1),
                                    Color(0xfff25656),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds),
                                child: Icon(
                                  Icons.mic_none_rounded,
                                  color: Colors.white,
                                  size: 34,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill;

    paint0.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff535572),
        Color(0xff31374a),
      ],
    ).createShader(rect);

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, 0);
    path0.quadraticBezierTo(size.width * 0.0745500, size.height * -0.0051000,
        size.width * 0.1398250, 0);
    path0.cubicTo(
        size.width * 0.2494000,
        size.height * 0.0020000,
        size.width * 0.2930750,
        size.height * 0.9884000,
        size.width * 0.4106000,
        size.height * 0.9876000);
    path0.cubicTo(
        size.width * 0.4550125,
        size.height * 0.9875000,
        size.width * 0.5438375,
        size.height * 0.9873000,
        size.width * 0.5882500,
        size.height * 0.9872000);
    path0.cubicTo(
        size.width * 0.7014250,
        size.height * 0.9858000,
        size.width * 0.7502250,
        size.height * 0.0004000,
        size.width * 0.8601750,
        0);
    path0.quadraticBezierTo(
        size.width * 0.9485750, size.height * -0.0003000, size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
