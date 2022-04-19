import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isOff = true;
  String text = 'OFF';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.secondTextColor,
            ),
          ),
          Button(
            isOff: isOff,
            onTapSwitch: () {
              setState(() {
                isOff = !isOff;

                if (isOff == true) {
                  text = "OFF";
                } else {
                  text = "ON";
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

class Button extends StatefulWidget {
  Button({
    Key? key,
    required this.isOff,
    required this.onTapSwitch,
  }) : super(key: key);

  final bool isOff;
  final VoidCallback onTapSwitch;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  double _switchWidth = 51;
  double _switchHeight = 33;

  Duration _animatedDuration = Duration(milliseconds: 300);
  Duration _animatedDurationThumb = Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: widget.onTapSwitch,
                child: Container(
                  width: _switchWidth,
                  height: _switchHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffC9ced7),
                        Color(0xffe1e8f1),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -0.5),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        top: 0,
                        bottom: 0,
                        left: widget.isOff ? 2 : (_switchWidth - _switchHeight),
                        duration: _animatedDuration,
                        child: AnimatedOpacity(
                          duration: _animatedDurationThumb,
                          opacity: widget.isOff ? 0 : 1,
                          child: Container(
                            width: 30,
                            padding: EdgeInsets.all(1.2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Color(0xfff25656),
                                    Colors.white,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff985ee1),
                                    Color(0xfff25656),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 4),
                                    blurRadius: 8,
                                    color: Color(0xff6d222b).withOpacity(0.30),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        top: 0,
                        bottom: 0,
                        left: widget.isOff ? 2 : (_switchWidth - _switchHeight),
                        duration: _animatedDuration,
                        child: AnimatedOpacity(
                          duration: _animatedDurationThumb,
                          opacity: widget.isOff ? 1 : 0,
                          child: Container(
                            width: 30,
                            padding: EdgeInsets.all(1.2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xfff5f8fd),
                                  Color(0xffbdc4d1),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffdbe0e7),
                                    Color(0xfff8fbff),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 4),
                                    blurRadius: 8,
                                    color: Color(0xff8e9bae).withOpacity(0.20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
