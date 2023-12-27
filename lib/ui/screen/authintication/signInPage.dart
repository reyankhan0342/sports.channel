// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, prefer_const_constructors, must_be_immutable

import 'package:com.sports.channel/ui/customWidgets/customTextField.dart';
import 'package:com.sports.channel/ui/customWidgets/custom_round_button.dart';
import 'package:com.sports.channel/ui/screen/authintication/signInProvider.dart';
import 'package:com.sports.channel/ui/screen/homeScreen/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  FocusNode emailNode = FocusNode();
  FocusNode passwordlNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ChangeNotifierProvider(
        create: (context) => SiginInProvider(),
        child: Consumer<SiginInProvider>(builder: (context, provider, child) {
          return Form(
            key: formkey,
            child: Column(children: [
              // SizedBox(
              //   height: 37.h,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome back,',
                    style: TextStyle(
                        fontSize: 20.w,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 13,
                ),
                child: Text(
                  'Enter your account credentials to login to your account  '
                  'and enjoy the your favorite sport shows.',
                  style: TextStyle(
                    fontSize: 12.w,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF9F9F9).withOpacity(0.5),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextField(
                controller: emailController,
                focusNode: emailNode,
                textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                prefixIcon: 'assets/icons/img_5.png',
                hintText: 'Enter your email or phone no',
                hintstyle: TextStyle(
                    color: Color(0xffF9F9F9).withOpacity(0.5), fontSize: 11.w),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: passwordController,
                focusNode: passwordlNode,
                hintText: ' password',
                hintstyle: TextStyle(
                    color: Color(0xffF9F9F9).withOpacity(0.5), fontSize: 11.w),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password  can't be empty";
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                },
                textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                obscureText: _obscureText && provider.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    provider.password ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    provider.password = !provider.password;
                    provider.notifyListeners();
                  },
                ),
                prefixIcon: 'assets/icons/img_7.png',
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Checkbox(
                      // activeColor: Colors.green,
                      // focusColor: Colors.blue,
                      // checkColor: Colors.red,
                      value: false,
                      onChanged: (value) {}),
                  Text(
                    'Remembar me',
                    style: TextStyle(
                      color: Color(0xffF9F9F9).withOpacity(0.5),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomRoundButon(
                  borderRadius: BorderRadius.circular(30),
                  title: 'Login',
                  textStyle: TextStyle(
                    fontSize: 16.w,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  color: Color(0xffEE322E).withOpacity(0.8),
                  onTap: () {
                    //  if(formkey.currentState!.validate()){

                    //  }
                    var email = emailController.text.toString();
                    var passowrd = passwordController.text.toString();
                    provider.isLogin(context, email, passowrd);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  width: 340.w,
                  height: 40.h),
              SizedBox(
                height: 30,
              ),
            ]),
          );
        }),
      ),
    );
  }
}
