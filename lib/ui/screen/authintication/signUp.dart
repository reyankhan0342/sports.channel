import 'package:com.sports.channel/ui/customWidgets/customTextField.dart';
import 'package:com.sports.channel/ui/screen/authintication/signInPage.dart';
import 'package:com.sports.channel/ui/screen/authintication/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double _width = 400.w;
  double _height = 600.h;
  Color _color = Colors.transparent;

  bool container = false;

  void animateContainer() {
    setState(() {
      if (container == true) {
        _width = 400.w;
        _height = 400.h;
        // _color = Colors.red;
      } else {
        _width = 400.w;
        _height = 500.h;
        //  _color = Colors.green;
      }
      container = !container; // Toggle the value of 'container'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff291F1F),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  width: 17.w,
                  height: 20.h,
                  child: Image.asset(
                    'assets/icons/img_2.png',
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    animateContainer();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 20),
                    width: 60.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Color(0xff473636),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xffF9F9F9).withOpacity(0.5),
                        fontSize: 14.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 37,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 65.w),
                    child: Image.asset('assets/icons/img_3.png'),
                  ),
                  ClipRect(
                    child: AnimatedContainer(
                      width: _width,
                      height: _height,
                      color: _color,
                      duration: Duration(seconds: 1), // Animation duration
                      curve: Curves.easeInOut,
                      child: container == false ? SignInPage() : SignUpPage(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
