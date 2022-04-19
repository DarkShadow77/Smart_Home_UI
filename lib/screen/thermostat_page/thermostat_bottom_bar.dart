import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:smart_home/utils/colors.dart';

class ThermoStatBottomBar extends StatefulWidget {
  const ThermoStatBottomBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ThermoStatBottomBar> createState() => _ThermoStatBottomBarState();
}

class _ThermoStatBottomBarState extends State<ThermoStatBottomBar> {
  bool selected1 = true;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: widget.size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ReusableIconContainer(
                onPress: () {
                  setState(() {
                    selected1 = true;
                    selected2 = false;
                    selected3 = false;
                    selected4 = false;
                  });
                },
                child: selected1 == true
                    ? ActiveIcon(icon: SFSymbols.flame, iconlabel: "MODE")
                    : InactiveIcon(icon: SFSymbols.flame, iconlabel: "MODE"),
              ),
            ),
            Expanded(
              child: ReusableIconContainer(
                onPress: () {
                  setState(() {
                    selected1 = false;
                    selected2 = true;
                    selected3 = false;
                    selected4 = false;
                  });
                },
                child: selected2 == true
                    ? ActiveIcon(icon: Icons.spa_outlined, iconlabel: "ECO")
                    : InactiveIcon(icon: Icons.spa_outlined, iconlabel: "ECO"),
              ),
            ),
            Expanded(
              child: ReusableIconContainer(
                onPress: () {
                  setState(() {
                    selected1 = false;
                    selected2 = false;
                    selected3 = true;
                    selected4 = false;
                  });
                },
                child: selected3 == true
                    ? ActiveIcon(icon: Icons.event_note, iconlabel: "SCHEDULE")
                    : InactiveIcon(
                        icon: Icons.event_note, iconlabel: "SCHEDULE"),
              ),
            ),
            Expanded(
              child: ReusableIconContainer(
                onPress: () {
                  setState(() {
                    selected1 = false;
                    selected2 = false;
                    selected3 = false;
                    selected4 = true;
                  });
                },
                child: selected4 == true
                    ? ActiveIcon(icon: Icons.update, iconlabel: "HISTORY")
                    : InactiveIcon(icon: Icons.update, iconlabel: "HISTORY"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableIconContainer extends StatelessWidget {
  const ReusableIconContainer({
    Key? key,
    required this.onPress,
    required this.child,
  }) : super(key: key);

  final VoidCallback onPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress, child: child);
  }
}

class InactiveIcon extends StatelessWidget {
  const InactiveIcon({
    Key? key,
    required this.icon,
    required this.iconlabel,
  }) : super(key: key);

  final IconData icon;
  final String iconlabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xff99a0a9).withOpacity(0.40),
                    Colors.white.withOpacity(0.40),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Container(
                  width: 58,
                  height: 58,
                  padding: EdgeInsets.all(0.3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.10),
                        Colors.black.withOpacity(0.30),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color(0xffcbd0d9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xfffafbfc),
                                Color(0xffdde1e7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Icon(
                            icon,
                            color: AppColors.secondTextColor.withOpacity(0.50),
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            iconlabel,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.secondTextColor.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({
    Key? key,
    required this.icon,
    required this.iconlabel,
  }) : super(key: key);

  final IconData icon;
  final String iconlabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xff99a0a9).withOpacity(0.40),
                    Colors.white.withOpacity(0.40),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 20,
                    color: Color(0xff8e9bae).withOpacity(0.10),
                  )
                ],
              ),
              child: Center(
                child: Container(
                  width: 58,
                  height: 58,
                  padding: EdgeInsets.all(0.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.30),
                        Colors.black.withOpacity(0.40),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffd99afa),
                            Color(0xffba3d4f),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff985ee1),
                                Color(0xfff25656),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Icon(
                            icon,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            iconlabel,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.secondTextColor.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}
