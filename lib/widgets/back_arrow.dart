import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    Key? key,
    required this.borderColor,
    required this.iconColor,
    required this.press,
  }) : super(key: key);

  final Color borderColor;
  final Color iconColor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.5,
            color: borderColor.withOpacity(0.50),
          ),
        ),
        child: Icon(
          Icons.arrow_back_rounded,
          color: iconColor,
        ),
      ),
    );
  }
}
