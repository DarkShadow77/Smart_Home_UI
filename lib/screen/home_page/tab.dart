import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

import '../../utils/colors.dart';
import '../../widgets/device_cards.dart';
import '../../widgets/room_cards.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    required this.size,
    required ScrollController scroll_Controller,
    required this.roomList,
    required this.deviceList,
  })  : _scroll_Controller = scroll_Controller,
        super(key: key);

  final Size size;
  final ScrollController _scroll_Controller;
  final List roomList;
  final List deviceList;

  static const _deviceIcons = <IconData>[
    Icons.thermostat_rounded,
    Icons.shower_rounded,
    SFSymbols.tv,
    Icons.wifi,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.all(3),
            width: 329,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.outerSearchColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.searchColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.20),
                    )
                  ],
                ),
                labelColor: Colors.black,
                unselectedLabelColor: AppColors.secondTextColor,
                tabs: [
                  Tab(
                    child: Text(
                      'Room',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Devices',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 600,
          child: TabBarView(
            children: [
              Container(
                width: size.width,
                child: CustomScrollView(
                  controller: _scroll_Controller,
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return RoomCards(
                            room: roomList[index],
                          );
                        },
                        childCount: roomList.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 233,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                child: CustomScrollView(
                  controller: _scroll_Controller,
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return DeviceCards(
                            devices: deviceList[index],
                            icons: _deviceIcons[index],
                          );
                        },
                        childCount: deviceList.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 233,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
