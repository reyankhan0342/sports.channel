// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unused_import

import 'package:com.sports.channel/core/services/api_services.dart';
import 'package:com.sports.channel/model/playlist_model.dart';
import 'package:com.sports.channel/model/video_model.dart';
import 'package:com.sports.channel/ui/customWidgets/tracute_word.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/homeScreens/home_screen_provider.dart';

import 'package:com.sports.channel/ui/screen/homeScreen/mainPage.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final images = [
    'assets/icons/img_21.png',
    'assets/icons/img_22.png',
    'assets/icons/img_23.png',
    'assets/icons/img_24.png',
  ];

  bool value = false;
  String currentPlaylistId = '';
  @override
  Widget build(BuildContext context) {
    List<Widget> listViewItems = [];
    final myData = Provider.of<HomeScreenProvider>(context);
    for (var playlist in myData.playlists) {
      //  print('=======>>>>> playlistLengh    ${myData.playlists.length}');
      listViewItems.add(
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Text(
                    '${playlist.name}',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                Spacer(),
              ],
            ),
            Container(
              width: double.infinity,
              height: 214.h,
              // color: Colors.red,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        controller: myData.playlistScrollController,
                        itemCount: playlist.playListVideo.length,
                        itemBuilder: (context, index) {
                          final video = playlist.playListVideo[index];
                          return GestureDetector(
                            onTap: () {
                              // myData.index = index;
                              myData.currentvideo =
                                  playlist.playListVideo[index].videoId;

                              myData.title =
                                  playlist.playListVideo[index].title;

                              myData.description =
                                  playlist.playListVideo[index].description;

                              myData.CurrentPlayListId = playlist.playlistId;

                              // myData.index =
                              //     playlist.playListVideo[index].videoId;

                              myData.toogleScreen(1);

                              print(" ====>>>>?????" +
                                  currentPlaylistId.toString());
                            },
                            child: Container(
                              width: 260.w,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Color(0xffD9D9D9), width: 1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.network(
                                        video.thumbnailUrl.toString(),
                                        fit: BoxFit.cover,
                                        // width: double.infinity,
                                        // height: 200,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          TrancuatWold().truncateText(
                                              video.title,
                                              4), // Truncate to 4 words
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                          maxLines: 1,

                                          overflow: TextOverflow.ellipsis,
                                          // Show ellipsis for overflow
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
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
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
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
                                          padding: const EdgeInsets.only(
                                              bottom: 2.0),
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
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: Color(0xff011F3F),
      body: SingleChildScrollView(
          child: myData.screens == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: Color(0xff011F3F),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 30.w, top: 15.w, bottom: 8.w),
                            width: 110.w,
                            decoration: BoxDecoration(),
                            child: Image.asset('assets/icons/img_17.png'),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 16.w),
                            width: 16.w,
                            decoration: BoxDecoration(),
                            child: Image.asset('assets/icons/img_18.png'),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 16.w),
                            width: 18.w,
                            decoration: BoxDecoration(),
                            child: Image.asset('assets/icons/img_14.png'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 180.h,
                      decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //    // Color of the shadow
                          //     spreadRadius: 5, // Spread radius
                          //     blurRadius: 7, // Blur radius
                          //     offset: Offset(0, 3), // Offset of the shadow
                          //   ),
                          // ],
                          image: DecorationImage(
                              image: AssetImage('assets/icons/img_19.png'),
                              fit: BoxFit.fill),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Featured Video Name',
                              style: TextStyle(
                                  fontFamily: 'public',
                                  color: Colors.white,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '#Featured Video Tags',
                              style: TextStyle(
                                  fontFamily: 'public',
                                  fontSize: 14.w,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 5),
                      child: Text(
                        '4 days ago ',
                        style: TextStyle(
                            fontSize: 12.sp, color: Color(0xffF0F0F0)),
                      ),
                    ),
                    SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100.w,
                            height: 43,
                            decoration: BoxDecoration(
                                color: Color(0xff0663FF),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  'Play video',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white.withOpacity(0.8)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: 140.w,
                            height: 43,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff0663FF),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  'Add to Watch later',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white.withOpacity(0.8)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap:
                          true, // Make ListView scrollable inside SingleChildScrollView
                      children: listViewItems
                          .take(1)
                          .toList(), // Limit the list to 3 items
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                  ],
                )
              : VideoPlayer(
                  videoId: myData.currentvideo,
                  title: myData.title,
                  description: myData.description,
                  currentPlayListId: myData.CurrentPlayListId,
                )),
    );
  }
}
