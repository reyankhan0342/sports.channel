// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:com.sports.channel/ui/screen/homeScreen/clubeScreen/catages_screen.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/homeScreens/homeScreen.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/profileScreen/profileScreen.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/searchScreen/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> Screen = [
    homeScreen(),
    SearchScreen(),
  CatagesScreen(),
    ProfileScreen(),
  ];

  int value = 0;
  getVlaue(int x) {
    value = x;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Color(0xff011F3F),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          value == 0
              ? homeScreen()
              : value == 1
                  ? SearchScreen()
                  : value == 2
                      ? CatagesScreen()
                      : value == 3
                          ? ProfileScreen()
                          : SizedBox(
                              height: 4,
                            ),
          Container(
            // margin: EdgeInsets.only(
            //     bottom: size.width * 0.03,
            //     right: size.width * 0.05,
            //     left: size.width * 0.05),
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              color: Color(0xff011F3F),
              // borderRadius: BorderRadius.circular(18),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                  spreadRadius: 4, // Spread radius
                  blurRadius: 1, // Blur radius
                  offset: Offset(0, 3), // Offset from the top-left corner
                ),
              ],
            ),
            child: Row(children: [
              GestureDetector(
                  onTap: () {
                    getVlaue(0);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20.w, top: 8.w),
                    width: 70.w,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 1,
                        ),
                        value == 0
                            ? Image.asset(
                                'assets/icons/img_9.png',
                                width: 17.w,
                              )
                            : Image.asset(
                                'assets/icons/img_16.png',
                                width: 15.w,
                              ),
                        Text('Home',
                            style: value == 0
                                ? TextStyle(
                                    fontFamily: 'public',
                                    color: Color(0xffF0F0F0),
                                    fontSize: 10.w,
                                    fontWeight: FontWeight.w600,
                                  )
                                : TextStyle(
                                    fontFamily: 'public',
                                    color: Color(0xffB9B9B9).withOpacity(0.5),
                                    fontSize: 9.w,
                                    fontWeight: FontWeight.w400,
                                  )),
                      ],
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  getVlaue(1);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15.w, top: 8.w),
                  width: 70.w,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      value == 1
                          ? Image.asset('assets/icons/img_10.png', width: 17.w)
                          : Image.asset('assets/icons/img_15.png', width: 15.w),
                      SizedBox(
                        height: 1,
                      ),
                      Text('Search',
                          style: value == 1
                              ? TextStyle(
                                  fontFamily: 'public',
                                  color: Color(0xffF0F0F0),
                                  fontSize: 10.w,
                                  fontWeight: FontWeight.w600,
                                )
                              : TextStyle(
                                  fontFamily: 'public',
                                  color: Color(0xffB9B9B9).withOpacity(0.5),
                                  fontSize: 9.w,
                                  fontWeight: FontWeight.w400,
                                )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    getVlaue(2);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15.w, top: 8.w),
                    width: 70.w,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        value == 2
                            ? Image.asset(
                                'assets/icons/img_11.png',
                                width: 17.w,
                              )
                            : Image.asset('assets/icons/img_13.png',
                                width: 15.w),
                        SizedBox(
                          height: 2,
                        ),
                        Text('Clube',
                            style: value == 2
                                ? TextStyle(
                                    fontFamily: 'public',
                                    color: Color(0xffF0F0F0),
                                    fontSize: 10.w,
                                    fontWeight: FontWeight.w600,
                                  )
                                : TextStyle(
                                    fontFamily: 'public',
                                    color: Color(0xffB9B9B9).withOpacity(0.5),
                                    fontSize: 9.w,
                                    fontWeight: FontWeight.w400,
                                  )),
                      ],
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  getVlaue(3);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15.w, top: 8.w),
                  width: 70.w,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      value == 3
                          ? Image.asset(
                              'assets/icons/img_14.png',
                              width: 17.w,
                            )
                          : Image.asset('assets/icons/img_12.png', width: 15.w),
                      SizedBox(
                        height: 1,
                      ),
                      Text('Profile',
                          style: value == 3
                              ? TextStyle(
                                  fontFamily: 'public',
                                  color: Color(0xffF0F0F0),
                                  fontSize: 10.w,
                                  fontWeight: FontWeight.w600,
                                )
                              : TextStyle(
                                  fontFamily: 'public',
                                  color: Color(0xffB9B9B9).withOpacity(0.5),
                                  fontSize: 9.w,
                                  fontWeight: FontWeight.w600,
                                )),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
