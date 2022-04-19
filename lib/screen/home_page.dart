import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:smart_home/screen/thermostat.dart';
import 'package:smart_home/utils/colors.dart';
import 'package:smart_home/widgets/BottomBar.dart';

import '../models/Data.dart';
import 'home_page/tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  late ScrollController _scroll_Controller;
  late ScrollController _scroll__Controller;

  List<dynamic> roomList = [];
  List<dynamic> deviceList = [];

  bool _isScrolled = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);
    _scroll_Controller = ScrollController();
    _scroll_Controller.addListener(_listen_ToScrollChange);
    _scroll__Controller = ScrollController();
    _scroll__Controller.addListener(_listenTo_ScrollChange);

    data();
    super.initState();
  }

  double itemwidth = 155;
  double itemheight = 233;

  void _listenToScrollChange() {
    if (_scrollController.offset >= 10.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  void _listen_ToScrollChange() {
    if (_scrollController.offset >= 10.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  void _listenTo_ScrollChange() {
    if (_scrollController.offset >= 10.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Home',
                                      style: TextStyle(
                                        fontSize: 33,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                              offset: Offset(4, 4),
                                              color: AppColors.shadow
                                                  .withOpacity(0.10),
                                            )
                                          ],
                                        ),
                                        child: Icon(
                                          SFSymbols.gear_alt,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ThermostatPage();
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: size.width * 0.45,
                                      child: Text(
                                        'Family Members',
                                        style: TextStyle(
                                          color: AppColors.secondTextColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.4,
                                      child: Stack(
                                        clipBehavior: Clip.hardEdge,
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        children: [
                                          Container(
                                            width: 30,
                                            alignment: Alignment.center,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.white,
                                              ),
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppColors.first,
                                                  AppColors.second,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "assets/images/family1.png"),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(4, 4),
                                                  color: AppColors.shadow
                                                      .withOpacity(0.10),
                                                )
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: size.width * 0.05,
                                            child: Container(
                                              width: 30,
                                              alignment: Alignment.center,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.white,
                                                ),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    AppColors.first,
                                                    AppColors.second,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/family2.png"),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    offset: Offset(4, 4),
                                                    color: AppColors.shadow
                                                        .withOpacity(0.10),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: size.width * 0.1,
                                            child: Container(
                                              width: 30,
                                              alignment: Alignment.center,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.white,
                                                ),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    AppColors.first,
                                                    AppColors.second,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/family1.png"),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    offset: Offset(4, 4),
                                                    color: AppColors.shadow
                                                        .withOpacity(0.10),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: size.width * 0.15,
                                            child: Container(
                                              width: 30,
                                              alignment: Alignment.center,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.white,
                                                ),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    AppColors.first,
                                                    AppColors.second,
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/family2.png"),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    offset: Offset(4, 4),
                                                    color: AppColors.shadow
                                                        .withOpacity(0.10),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 30),
                                  width: 329,
                                  height: 106,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.containerone,
                                        AppColors.containertwo,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 18),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'My Location',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Montreal',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: AppColors
                                                        .thirdTextColor
                                                        .withOpacity(0.60),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  SFSymbols.cloud_sun_fill,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                Text(
                                                  'Partly Cloudy',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors
                                                        .thirdTextColor
                                                        .withOpacity(0.60),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '-10°',
                                              style: TextStyle(
                                                fontSize: 50,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'H: 2° L: -12°',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Tabs(
                                size: size,
                                scroll_Controller: _scroll_Controller,
                                roomList: roomList,
                                deviceList: deviceList,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> data() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);

    setState(
      () {
        roomList = data['roomCard'].map((data) => Room.fromJson(data)).toList();
        deviceList =
            data['deviceCard'].map((data) => Devices.fromJson(data)).toList();
      },
    );
  }
}
