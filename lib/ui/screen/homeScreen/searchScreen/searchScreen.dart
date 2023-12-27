// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final images = [
    'assets/icons/img_21.png',
    'assets/icons/img_22.png',
    'assets/icons/img_23.png',
    'assets/icons/img_24.png',
    'assets/icons/img_23.png',
    'assets/icons/img_24.png',
    'assets/icons/img_21.png',
    'assets/icons/img_22.png',
    'assets/icons/img_23.png',
    'assets/icons/img_24.png',
  ];

  final clubename = [
    'Clube1',
    'Clube2',
    'Clube3',
    'Clube4',
    'Clube5',
    'Clube6',
    'Clube7',
    'Clube8',
    'Clube9',
    'Clube10',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff291F1F),
        body: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15.w),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffB9B9B9)),
                    child: Icon(Icons.arrow_back_sharp)),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                    width: 290.w,
                    height: 33.h,

                    // color: Colors.green),
                    child: TextField(
                      style: TextStyle(
                          fontFamily: 'roboto1',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search Garra TV',
                        hintStyle: TextStyle(
                            fontFamily: 'roboto1',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF9F9F9)),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 3.0, right: 8),
                            child: Transform.scale(
                              scale: 0.5,
                              child: Image.asset('assets/icons/img_15.png'),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Color(0xffEE322E), width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Color(0xffEE322E), width: 1)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        border: InputBorder.none,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Category 1',
                  style: TextStyle(
                      fontSize: 12.w,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 11.w,
                        color: Color(0xffEE322E).withOpacity(0.7),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xffD9D9D9), width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 270.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/icons/img_20.png'),
                                      fit: BoxFit.fill)),
                              child: Icon(
                                Icons.play_arrow,
                                size: 35.w,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Pregara mister Amaolo',
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
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Popular Clubs',
                  style: TextStyle(
                      fontSize: 12.w,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 11.w,
                        color: Color(0xffEE322E).withOpacity(0.7),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 100,
                    mainAxisSpacing: 30),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    width: 150.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        clubename[index],
                        style: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.center,
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
        ),
      ),
    );
  }
}
