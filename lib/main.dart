// ignore_for_file: unused_import, prefer_const_constructors

import 'package:com.sports.channel/tv_remote.dart';
import 'package:com.sports.channel/ui/screen/authintication/signInPage.dart';
import 'package:com.sports.channel/ui/screen/authintication/signInProvider.dart';
import 'package:com.sports.channel/ui/screen/authintication/signUp.dart';
import 'package:com.sports.channel/ui/screen/authintication/signUpPage.dart';
import 'package:com.sports.channel/ui/screen/authintication/signUpProvider.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/homeScreens/homeScreen.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/homeScreens/home_screen_provider.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/mainPage.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/videoPlayer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:com.sports.channel/ui/screen/splashScreen/splashScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SignUpProvider()),
          ChangeNotifierProvider(create: (context) => SiginInProvider()),
          ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ],
        child: ScreenUtilInit(
          designSize: Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: MainPage(),
          ),
        ));
  }
}
