// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:com.sports.channel/ui/screen/homeScreen/clubeScreen/listVideoPlayer.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/clubeScreen/videoListScreen.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/homeScreens/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CatagesScreen extends StatelessWidget {
  CatagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: Color(0xff011F3F),
              body: provider.clubeScreen == 0
                  ? Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: provider.clubeScreen == 0
                                ? Text(
                                    'My Clube',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.w600),
                                  )
                                : Text(
                                    'Video List',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.w600),
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: provider.playlists.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 100,
                                    mainAxisSpacing: 30),
                            itemBuilder: (context, index) {
                              final video = provider.playlists[index];
                              return GestureDetector(
                                onTap: () => {
                                  provider.ClubetoogleScreen(1),
                                  provider.fetchPlayListVideo(video.playlistId),
                                  provider.playListName = video.name,
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(video.thumbnailUrl),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      'PlayList${index}',
                                      style: TextStyle(
                                          fontSize: 15.w,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                      ],
                    )
                  : provider.clubeScreen == 1
                      ? VideoListScreen(
                          PlayListName: provider.playListName,
                        )
                      : provider.clubeScreen == 2
                          ? ListVideoPlayer(
                              videoId: provider.currentvideo,
                              title: provider.title,
                              description: provider.description,
                              currentPlayListId: '')
                          : SizedBox()),
        );
      },
    );
  }
}
