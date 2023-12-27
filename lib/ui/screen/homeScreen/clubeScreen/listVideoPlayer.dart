// ignore_for_file: prefer_const_constructors, must_call_super, curly_braces_in_flow_control_structures

import 'package:com.sports.channel/ui/screen/homeScreen/homeScreens/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ListVideoPlayer extends StatefulWidget {
  final String videoId;
  final String title;
  final String description;
  final String currentPlayListId;

  ListVideoPlayer({
    super.key,
    required this.videoId,
    required this.title,
    required this.description,
    required this.currentPlayListId,
  });

  @override
  State<ListVideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<ListVideoPlayer> {
  YoutubePlayerController? controller;
  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      // initialVideoId: '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  var playlist;
  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<HomeScreenProvider>(context);

    for (playlist in myData.playlists) {
      return YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            progressColors: ProgressBarColors(
              playedColor: Colors.orange,
              handleColor: Colors.pink,
            ),
          ),
          builder: (context, player) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => {
                    myData.ClubetoogleScreen(1),
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: player,
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 11.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        'Channel name',
                        style: TextStyle(
                            fontSize: 7.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 7.w,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        '1.5 M',
                        style: TextStyle(
                            fontSize: 7.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'views',
                        style: TextStyle(
                            fontSize: 7.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 7.w,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            fontSize: 7.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'months ago',
                        style: TextStyle(
                            fontSize: 7.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20),
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      color: Color(0XFF898989),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 4,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10.w),
                        width: 122.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xff473636),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 12.w,
                              child: Image.asset(
                                'assets/icons/img_25.png',
                                width: 12.w,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '245',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF898989)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'k',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF898989)),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              width: 2,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: Color(0XFF898989),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 12.w,
                              child: Image.asset(
                                'assets/icons/img_26.png',
                                width: 12.w,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF898989)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'K',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF898989)),
                            ),
                          ],
                        )),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(left: 15.w),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff473636)),
                        child: Transform.scale(
                          scale: 0.6,
                          child: Image.asset('assets/icons/img_27.png'),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 15.w),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff473636)),
                        child: Transform.scale(
                          scale: 0.6,
                          child: Image.asset('assets/icons/img_28.png'),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 15.w),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xff473636)),
                        child: Transform.scale(
                          scale: 0.6,
                          child: Center(
                              child: Image.asset('assets/icons/img_29.png')),
                        )),
                    SizedBox(
                      width: 10.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ExpansionTile(
                      collapsedBackgroundColor: Color(0xff473636),
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.white,
                      backgroundColor: Color(0xff473636),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      maintainState: false,
                      initiallyExpanded: false,
                      title: Row(
                        children: [
                          Text(
                            'Comments',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xffCECECE),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '500',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xffCECECE),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'k',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xffCECECE),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      children: [
                        Container(
                          height: 200.h,
                          child: ListView.builder(
                            itemCount: 10, // Adjust the itemCount as needed
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/icons/profile.png'),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  'User $index',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xffCECECE),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 20),
                                      child: Text(
                                        'Here will be a two to three lines of description about the'
                                        'video it will be a maximum of 50 to 55 words and this is ',
                                        style: TextStyle(
                                          color: Color(0XFF898989),
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        width: 128.w,
                                        height: 26.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              width: 12.w,
                                              child: Image.asset(
                                                'assets/icons/img_25.png',
                                                width: 12.w,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              '245',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0XFF898989)),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              'k',
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0XFF898989)),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 8),
                                              width: 12.w,
                                              child: Image.asset(
                                                'assets/icons/img_26.png',
                                                width: 12.w,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 8),
                                              child: Text(
                                                'Replay',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  height: 188.h,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        controller: myData.playlistScrollController,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Color(0xffD9D9D9), width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 270,
                                  height: 150.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(''),
                                          fit: BoxFit.fill)),
                                  child: Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 35.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'title',
                                        style: TextStyle(
                                            fontSize: 11.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 115.w,
                                      ),
                                      // Spacer(),
                                      Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Channel name',
                                        style: TextStyle(
                                            fontSize: 7.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Text(
                                          '.',
                                          style: TextStyle(
                                              fontSize: 7.w,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        '1.5 M',
                                        style: TextStyle(
                                            fontSize: 7.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        'views',
                                        style: TextStyle(
                                            fontSize: 7.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 2.0),
                                        child: Text(
                                          '.',
                                          style: TextStyle(
                                              fontSize: 7.w,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '3',
                                        style: TextStyle(
                                            fontSize: 7.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        'months ago',
                                        style: TextStyle(
                                            fontSize: 7.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
          });
    }
    return SizedBox();
  }
}
