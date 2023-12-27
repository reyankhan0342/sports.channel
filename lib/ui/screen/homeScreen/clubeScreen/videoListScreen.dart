// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:com.sports.channel/ui/screen/homeScreen/homeScreens/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatelessWidget {
  String PlayListName = '';
  VideoListScreen({super.key, required this.PlayListName});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(color: Color(0xfff011F3F)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.ClubetoogleScreen(0);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  PlayListName,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: provider.allVideos.length,
                      itemBuilder: (context, index) {
                        final video = provider.allVideos[index];
                        return GestureDetector(
                          onTap: () {
                            print('hello  ===>>>> calling');
                            provider.ClubetoogleScreen(2);
                            provider.currentvideo = video.videoId;
                            provider.title = video.title;
                            provider.description = video.description;
                          },
                          child: Container(
                            child: Column(children: [
                              Image(
                                image:
                                    NetworkImage(video.thumbnailUrl.toString()),
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                video.title,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )
                            ]),
                          ),
                        );
                      }),
                )
              ]),
        );
      },
    );
  }
}
