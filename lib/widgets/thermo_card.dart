import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ThermoCard extends StatefulWidget {
  ThermoCard({
    Key? key,
    required this.cardName,
    required this.cardNumber,
    required this.isDegree,
    required this.child,
  }) : super(key: key);

  final String cardName;
  final String cardNumber;
  final bool isDegree;
  final Widget child;

  @override
  State<ThermoCard> createState() => _ThermoCardState();
}

class _ThermoCardState extends State<ThermoCard> {
  String percentage = "%";
  String degree = "°";
  String symbol = "%";

  void IsDegree() {
    if (widget.isDegree == true) {
      symbol = degree;
    } else {
      symbol = percentage;
    }
  }

  @override
  void initState() {
    super.initState();
    IsDegree();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        padding: EdgeInsets.all(1),
        width: 143,
        height: 164,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.50),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 40,
              color: Color(0xff3b4056).withOpacity(0.25),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff4f7fb),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.child,
              Container(
                  child: Column(
                children: [
                  Text(
                    widget.cardName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondTextColor.withOpacity(0.75),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.cardNumber + symbol,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondTextColor.withOpacity(0.75),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class ThermoCardIconContainer extends StatelessWidget {
  const ThermoCardIconContainer({
    Key? key,
    required this.firstColor,
    this.firstOpacity = 1,
    required this.secondColor,
    this.secondOpacity = 1,
    required this.icon,
  }) : super(key: key);

  final Color firstColor;
  final double firstOpacity;
  final Color secondColor;
  final double secondOpacity;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            firstColor.withOpacity(firstOpacity),
            secondColor.withOpacity(secondOpacity),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(
          colors: [
            Color(0xff985ee1).withOpacity(0.50),
            Color(0xfff25656).withOpacity(0.50),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
