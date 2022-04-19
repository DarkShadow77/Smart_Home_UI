import 'package:flutter/material.dart';
import 'package:smart_home/widgets/toggle_button.dart';

import '../models/Data.dart';
import '../utils/colors.dart';

class RoomCards extends StatefulWidget {
  const RoomCards({Key? key, required this.room}) : super(key: key);

  final Room room;

  @override
  State<RoomCards> createState() => _RoomCardsState();
}

class _RoomCardsState extends State<RoomCards> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
        child: Column(
          children: [
            Container(
              width: 155,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.room.roomImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.room.roomName,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.secondTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.room.roomConnectedDevices,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.secondTextColor.withOpacity(0.50),
                        ),
                      ),
                    ],
                  ),
                  ToggleButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
