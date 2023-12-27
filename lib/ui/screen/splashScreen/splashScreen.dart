// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Alignment beginAlignment = Alignment.centerRight; // Starting alignment
    Alignment endAlignment = Alignment.centerLeft; // Ending alignment
    double lerpValue = 0.0;
    Alignment gradientAlignment =
        Alignment.lerp(beginAlignment, endAlignment, lerpValue)!;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffEE322E),
              Color(0xff1E1E1E),
            ],
            begin: beginAlignment,
            end: Alignment.bottomCenter, // Use the lerped Alignment here
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 320.h,
            ),
            Container(
              width: 220.w,
              height: 45.h,
              child: Image.asset('assets/icons/img.png'),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: EdgeInsets.only(left: 70.w),
                  width: 114.w,
                  child: Image.asset(
                    'assets/icons/img_1.png',
                    fit: BoxFit.contain,
                  )),
            ),
            SizedBox(
              height: 220.h,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 27.h),
                width: 30.w,
                height: 30.h,
                child: CircularProgressIndicator(
                  color: Color(0xffEE322E),
                )),
            Text('Version 1.0.0',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
