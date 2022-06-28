import 'dart:ui';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';

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
            Container(
              width: size.width,
              height: 88,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 88),
                    painter: RPSCustomPainter(),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaY: 3,
                        sigmaX: 3,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: size.width,
                        height: 88,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.queue_music_rounded),
                                  iconSize: 25,
                                  color: Colors.white54,
                                  onPressed: () {},
                                ),
                                Text(
                                  "Playlist",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: FaIcon(FontAwesomeIcons.music),
                                  iconSize: 20,
                                  color: Colors.white54,
                                  onPressed: () {},
                                ),
                                Text(
                                  "My Music",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                                      shaderCallback: (bounds) =>
                                          LinearGradient(
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
                                        Icons.home_filled,
                                        color: Colors.white,
                                        size: 30,
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
                        /*child: Center(
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
                                  SFSymbols.house_fill,
                                  color: Colors.white,
                                  size: 34,
                                ),
                              ),
                            ),
                          ),
                        ),*/
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
    Paint paint0 = Paint()..style = PaintingStyle.fill;

    paint0.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.backgroundColor,
        Color(0xff30304B),
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
