import 'dart:ui';

import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_home/screen/home_page.dart';
import 'package:smart_home/screen/sample.dart';
import 'package:smart_home/screen/thermostat_page/thermostat_bottom_bar.dart';
import 'package:smart_home/utils/colors.dart';

import '../widgets/custom_draw.dart';
import '../widgets/thermo_card.dart';

class ThermostatPage extends StatefulWidget {
  const ThermostatPage({Key? key}) : super(key: key);

  @override
  State<ThermostatPage> createState() => _ThermostatPageState();
}

class _ThermostatPageState extends State<ThermostatPage>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;

  List<dynamic> featuredList = [];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
  }

  double itemwidth = 155;
  double itemheight = 233;

  void _listenToScrollChange() {
    if (_scrollController.offset >= 50.0) {
      setState(() {});
    } else {
      setState(() {});
    }
  }

  void _handleFABPressed() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          child: Column(
            children: [
              _buildListItem(
                context,
                title: Text('Device 1'),
              ),
              _buildListItem(
                context,
                title: Text('Device 2'),
              ),
              _buildListItem(
                context,
                title: Text('Device 3'),
              ),
              _buildListItem(
                context,
                title: Text('Device 4'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 90,
        leading: IconButton(
          color: AppColors.secondTextColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          },
          icon: const Icon(SFSymbols.chevron_left),
        ),
        title: const Text(
          'Thermostat',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ),
                );
              },
              child: Center(
                widthFactor: 3,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.first,
                        AppColors.second,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(4, 4),
                        color: AppColors.shadow.withOpacity(0.10),
                      )
                    ],
                  ),
                  child: const Icon(
                    SFSymbols.gear_alt,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    '20°',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.secondTextColor
                                          .withOpacity(0.50),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '10°',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.secondTextColor
                                              .withOpacity(0.50),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        width: 286,
                                        height: 286,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white.withOpacity(0.50),
                                              Color(0xfff6f1f1),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Center(child: CustomArc()),
                                            Center(
                                              child: Container(
                                                width: 248,
                                                height: 248,
                                                padding: EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.white
                                                          .withOpacity(0.50),
                                                      Color(0xfff6f1f1),
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 15),
                                                      color: Color(0xff8e9bae)
                                                          .withOpacity(0.20),
                                                      blurRadius: 30,
                                                    ),
                                                  ],
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xffdee2e7),
                                                        Color(0xffdbe0e7),
                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: Offset(0, 3),
                                                        color: Color(0xff41455d)
                                                            .withOpacity(0.20),
                                                        blurRadius: 8,
                                                        inset: true,
                                                        spreadRadius: 1,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Container(
                                                      width: 222,
                                                      height: 222,
                                                      child: Stack(
                                                        children: [
                                                          SleekCircularSlider(
                                                            appearance:
                                                                CircularSliderAppearance(
                                                              size: 220,
                                                              customWidths:
                                                                  CustomSliderWidths(
                                                                progressBarWidth:
                                                                    10,
                                                              ),
                                                              customColors:
                                                                  CustomSliderColors(
                                                                trackColor: Colors
                                                                    .transparent,
                                                                progressBarColors: [
                                                                  Color(
                                                                      0xff985ee1),
                                                                  Color(
                                                                      0xfff25656),
                                                                ],
                                                                dotColor: Colors
                                                                    .transparent,
                                                                shadowMaxOpacity:
                                                                    0.0,
                                                              ),
                                                            ),
                                                            initialValue: 60,
                                                            onChange:
                                                                (double value) {
                                                              print(value);
                                                            },
                                                          ),
                                                          Center(
                                                            child: Container(
                                                              width: 200,
                                                              height: 200,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Colors
                                                                              .white,
                                                                          Color(
                                                                              0xffc0c5cd),
                                                                        ],
                                                                        begin: Alignment
                                                                            .topLeft,
                                                                        end: Alignment
                                                                            .bottomRight,
                                                                      ),
                                                                      boxShadow: [
                                                                    BoxShadow(
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              31),
                                                                      blurRadius:
                                                                          60,
                                                                      color: Color(
                                                                          0xff8e9bae),
                                                                    ),
                                                                    BoxShadow(
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              8),
                                                                      blurRadius:
                                                                          15,
                                                                      color: Color(
                                                                              0xff8e9bae)
                                                                          .withOpacity(
                                                                              0.50),
                                                                    ),
                                                                  ]),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xfff5f5f9),
                                                                      Color(
                                                                          0xffe4e8ee),
                                                                    ],
                                                                    begin: Alignment
                                                                        .topLeft,
                                                                    end: Alignment
                                                                        .bottomRight,
                                                                  ),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      offset:
                                                                          Offset(
                                                                              3,
                                                                              3),
                                                                      blurRadius:
                                                                          8,
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.50),
                                                                      inset:
                                                                          true,
                                                                    ),
                                                                  ],
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    width: 172,
                                                                    height: 172,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Color(
                                                                              0xffdde1e7),
                                                                          Color(
                                                                              0xfffefbfc),
                                                                        ],
                                                                        begin: Alignment
                                                                            .topLeft,
                                                                        end: Alignment
                                                                            .bottomRight,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Positioned(
                                                                          top:
                                                                              10,
                                                                          left:
                                                                              100,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                15,
                                                                            height:
                                                                                15,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Color(0xffdde1e7),
                                                                                  Color(0xfffefbfc),
                                                                                ],
                                                                                begin: Alignment.topLeft,
                                                                                end: Alignment.bottomRight,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "HEATING",
                                                                                style: TextStyle(
                                                                                  fontSize: 22,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  color: AppColors.secondTextColor,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                "22",
                                                                                style: TextStyle(
                                                                                    fontSize: 54,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    color: AppColors.secondTextColor.withOpacity(0.30),
                                                                                    shadows: [
                                                                                      BoxShadow(
                                                                                        offset: Offset(0, 1.5),
                                                                                        blurRadius: 1.5,
                                                                                        color: Color(0xff8e9bae).withOpacity(0.25),
                                                                                        inset: true,
                                                                                      ),
                                                                                    ],
                                                                                    letterSpacing: 1.29),
                                                                              ),
                                                                              DecoratedIcon(
                                                                                Icons.spa_outlined,
                                                                                color: Color(0xff30db5b),
                                                                                size: 24,
                                                                                shadows: [
                                                                                  BoxShadow(
                                                                                    offset: Offset(0, 1.5),
                                                                                    blurRadius: 1.5,
                                                                                    inset: true,
                                                                                    color: Colors.black.withOpacity(0.60),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
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
                                        ),
                                      ),
                                      Text(
                                        '30°',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.secondTextColor
                                              .withOpacity(0.50),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _handleFABPressed();
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                width: 226,
                                height: 44,
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffdbe0e7),
                                      Color(0xffdbe0e7),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: Colors.white,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withOpacity(0.50),
                                        Color(0xfff6f1f1),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 10,
                                        color:
                                            Color(0xff414555).withOpacity(0.25),
                                        inset: true,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Device 1",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.secondTextColor,
                                        ),
                                      ),
                                      Icon(
                                        SFSymbols.chevron_down,
                                        size: 28,
                                        color: AppColors.secondTextColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ThermoCard(
                                    child: ThermoCardIconContainer(
                                      icon: SFSymbols.wind,
                                      firstColor: Color(0xffffd0d0),
                                      secondColor: Color(0xffffd0d0),
                                    ),
                                    cardName: "Inside humidity",
                                    cardNumber: "49",
                                    isDegree: false,
                                  ),
                                  ThermoCard(
                                    child: ThermoCardIconContainer(
                                      icon: SFSymbols.thermometer,
                                      firstColor: Color(0xff985ee1),
                                      secondColor: Color(0xfff25656),
                                      firstOpacity: 0.20,
                                      secondOpacity: 0.20,
                                    ),
                                    cardName: "Outside Temps.",
                                    cardNumber: "10",
                                    isDegree: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ThermoStatBottomBar(size: size)
          ],
        ),
      ),
    );
  }
}

class Popover extends StatelessWidget {
  const Popover({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildHandle(context), if (child != null) child],
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}

Widget _buildListItem(
  BuildContext context, {
  required Widget title,
}) {
  final theme = Theme.of(context);

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: DefaultTextStyle(
          child: title,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}
