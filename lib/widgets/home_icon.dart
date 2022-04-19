import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({Key? key, required this.color1, required this.color2})
      : super(key: key);

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: HomeIconPaint(color1, color2),
    );
  }
}

class HomeIconPaint extends CustomPainter {
  final Color coloro;
  final Color colort;

  HomeIconPaint(this.coloro, this.colort);

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
        coloro,
        colort,
      ],
    ).createShader(rect);

    Path path0 = Path();
    path0.moveTo(size.width * 0.4993700, size.height * 0.0002971);
    path0.quadraticBezierTo(size.width * 0.2290100, size.height * 0.2013783,
        size.width * 0.1388700, size.height * 0.2683104);
    path0.cubicTo(
        size.width * 0.1285200,
        size.height * 0.2857533,
        size.width * 0.1306400,
        size.height * 0.3110504,
        size.width * 0.1483100,
        size.height * 0.3188807);
    path0.quadraticBezierTo(size.width * 0.1756500, size.height * 0.3122267,
        size.width * 0.2287200, size.height * 0.2668845);
    path0.quadraticBezierTo(size.width * 0.2198500, size.height * 0.9396863,
        size.width * 0.2798100, size.height * 0.9732296);
    path0.cubicTo(
        size.width * 0.3094000,
        size.height * 1.0118821,
        size.width * 0.6989900,
        size.height * 1.0073432,
        size.width * 0.7208900,
        size.height * 0.9752733);
    path0.quadraticBezierTo(size.width * 0.7804900, size.height * 0.9393180,
        size.width * 0.7711900, size.height * 0.2707581);
    path0.quadraticBezierTo(size.width * 0.8256800, size.height * 0.3127733,
        size.width * 0.8501900, size.height * 0.3192372);
    path0.cubicTo(
        size.width * 0.8703800,
        size.height * 0.3098028,
        size.width * 0.8697900,
        size.height * 0.2844225,
        size.width * 0.8598100,
        size.height * 0.2689758);
    path0.quadraticBezierTo(size.width * 0.7697100, size.height * 0.2018893,
        size.width * 0.4993700, size.height * 0.0002971);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
