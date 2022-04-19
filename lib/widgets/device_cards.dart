import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/widgets/home_icon.dart';
import 'package:smart_home/widgets/toggle_button.dart';

import '../models/Data.dart';
import '../utils/colors.dart';

class DeviceCards extends StatefulWidget {
  const DeviceCards({Key? key, required this.devices, required this.icons})
      : super(key: key);

  final Devices devices;
  final IconData icons;

  @override
  State<DeviceCards> createState() => _DeviceCardsState();
}

class _DeviceCardsState extends State<DeviceCards> {
  bool isOff = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 155,
        height: 233,
        decoration: BoxDecoration(
          color: Color(0xffFAF7FB),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            width: 1,
            color: Colors.white.withOpacity(0.50),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              offset: Offset(0, 20),
              color: Color(0xff3B4056).withOpacity(0.15),
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 80,
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //     image:
                          //         AssetImage(widget.devices.devicesHomeImage),
                          //     fit: BoxFit.cover,
                          //   ),
                          //   borderRadius: BorderRadius.vertical(
                          //     top: Radius.circular(22),
                          //   ),
                          // ),
                          child: HomeIcon(
                            color1: isOff
                                ? AppColors.secondTextColor.withOpacity(0.5)
                                : Color(0xff985ee1),
                            color2: isOff
                                ? AppColors.secondTextColor.withOpacity(0.5)
                                : Color(0xfff25656),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          child: Icon(
                            widget.icons,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.devices.devicesName,
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.secondTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.devices.devicesConnectedDevices,
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    AppColors.secondTextColor.withOpacity(0.50),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Button(
                            isOff: isOff,
                            onTapSwitch: () {
                              setState(() {
                                isOff = !isOff;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                child: Icon(
                  Icons.error,
                  color: AppColors.secondTextColor.withOpacity(0.30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
