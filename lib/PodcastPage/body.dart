import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/utils/colors.dart';
import 'package:podcast/widgets/backgound.dart';

import '../screens/audio.dart';
import '../widgets/back_arrow.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/play_button.dart';
import 'podcast_episode.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = true;
  bool isExpanded2 = true;
  late ScrollController _scrollController;

  bool _isScrolled = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 50.0) {
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

    return Background(
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.all(10),
                      height:
                          isExpanded ? size.height * 0.5 : size.height * 0.80,
                      curve: Curves.easeOutCirc,
                      duration: Duration(milliseconds: 700),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightgrey.withOpacity(0.7),
                            blurRadius: 10,
                            offset: Offset(7, 7),
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(isExpanded ? 30 : 30),
                        ),
                      ),
                      child: Stack(
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                AppColors.backgroundColor, BlendMode.color),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/ted.png"),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.lightgrey.withOpacity(0.70),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    BackArrow(
                                      borderColor: AppColors.lightgrey,
                                      iconColor: AppColors.whiteColor,
                                      press: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return AudioPage();
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: size.width * 0.7,
                                    )
                                  ],
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: AppColors.containerone,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage("assets/ted.png"),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Ted Talks Daily",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 2,
                                                    color: Colors.white54))),
                                        child: Text(
                                          "Ted",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white54,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: size.width * 0.48,
                                            height: size.width * 0.11,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppColors.containerone
                                                      .withOpacity(0.80),
                                                  AppColors.containertwo,
                                                  AppColors.containerthree
                                                      .withOpacity(0.90),
                                                ],
                                                stops: [
                                                  0.03,
                                                  0.4,
                                                  0.6,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Follow",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: size.width * 0.1,
                                            height: size.width * 0.11,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.white54,
                                                  width: 1),
                                            ),
                                            child: Icon(
                                              Icons.share_outlined,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Expanded(
                                          child: Text(
                                            "Every weekday, TED Talks Daily brings you the latest talks in audio. Join host and journalist Elise Hu for thought-provoking ideas on every subject imaginable -- from Artificial Intelligence to Zoology, and everything in between -- given by the world's leading thinkers and creators. With TED Talks Daily, find some space in your day to change your perspectives, ignite your curiosity, and learn something new.",
                                            maxLines: isExpanded ? 3 : 11,
                                            softWrap: true,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              height: 2,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: AnimatedContainer(
                    height:
                        isExpanded ? size.height * 0.42 : size.height * 0.12,
                    curve: Curves.easeOutCirc,
                    duration: Duration(milliseconds: 700),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                    ),
                    child: CustomScrollView(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              Podcast_Episode(
                                size: size,
                                press: () {
                                  _handleFABPressed();
                                },
                              ),
                              SizedBox(
                                height: 88,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomBar(),
        ],
      ),
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget buildSheet() => makeDismissible(
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          builder: (_, controller) => Popover(
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 270,
                        child: Text(
                          "Our Longing for cosmic truth and poetic beauty | Maria Popova",
                          maxLines: 3,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "28 May",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                PlayButton(
                                  diameter: 40,
                                  iconsize: 25,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "8 min",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Mark as played",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Linking together the histories of Henrietta Swan Leavitt, Edwin Hubble and Tracy K. Smith, poet and thinker Maria Popova crafts an astonishing story of how humanity came to see the edge of the observable universe. (Followed by an animated excerpt of 'My God, It's Full of Stars,' by Tracy K. Smith)",
                    softWrap: true,
                    maxLines: 30,
                    style: TextStyle(
                      height: 2,
                      color: Colors.white,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void _handleFABPressed() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => buildSheet(),
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
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.only(
              right: 20.0, left: 20.0, top: 40.0, bottom: 20.0),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.darkgrey,
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              if (child != null) child,
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildHandle(context),
          ),
        )
      ],
    );
  }

  Widget _buildHandle(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.20,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
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
