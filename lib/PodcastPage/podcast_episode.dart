import 'package:flutter/material.dart';
import 'package:podcast/screens/audio.dart';

import '../utils/colors.dart';
import '../widgets/play_button.dart';

class Podcast_Episode extends StatelessWidget {
  const Podcast_Episode({
    Key? key,
    required this.size,
    required this.press,
  }) : super(key: key);

  final Size size;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                "Our Longing for cosmic truth and poetic beauty | Maria Popova",
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.70,
                    child: Column(
                      children: [
                        Text(
                          "Linking together the histories of Henrietta Swan Leavitt, Edwin Hubble and Tracy K. Smith, poet and thinker Maria Popova crafts an astonishing story of how humanity came to see the edge of the observable universe. (Followed by an animated excerpt of 'My God, It's Full of Stars,' by Tracy K. Smith)",
                          maxLines: 2,
                          style: TextStyle(
                            color: AppColors.lightgrey,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  color: AppColors.lightgrey,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "8 min",
                                  style: TextStyle(
                                    color: AppColors.lightgrey,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range_rounded,
                                  color: AppColors.lightgrey,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "2 Days ago",
                                  style: TextStyle(
                                    color: AppColors.lightgrey,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AudioPage();
                          },
                        ),
                      );
                    },
                    child: PlayButton(
                      diameter: 40,
                      iconsize: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColors.lightgrey,
            ),
          ],
        ),
      ),
    );
  }
}
