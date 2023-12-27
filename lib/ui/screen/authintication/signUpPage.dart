// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:com.sports.channel/ui/customWidgets/customTextField.dart';
import 'package:com.sports.channel/ui/customWidgets/custom_round_button.dart';

import 'package:com.sports.channel/ui/screen/authintication/signUpProvider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  bool _obscureText = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController createController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode numberNode = FocusNode();
  FocusNode createNode = FocusNode();
  FocusNode confomNode = FocusNode();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
        child: Consumer<SignUpProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Setup your company profile',
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
                    padding: const EdgeInsets.only(left: 25.0, right: 42),
                    child: Text(
                      'Create your account to find a best suitable work for '
                      'you without going out.',
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
                    controller: nameController,
                    focusNode: nameNode,
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    prefixIcon: 'assets/icons/img_4.png',
                    hintText: 'Enter full name',
                    hintstyle: TextStyle(
                        color: Color(0xffF9F9F9).withOpacity(0.5),
                        fontSize: 11.w),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter username";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    controller: emailController,
                    focusNode: emailNode,
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    prefixIcon: 'assets/icons/img_5.png',
                    hintText: 'Enter your email',
                    hintstyle: TextStyle(
                        color: Color(0xffF9F9F9).withOpacity(0.5),
                        fontSize: 11.w),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      }
                      if (!value.contains('@gmail.com')) {
                        return "Enter valid Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    controller: numberController,
                    focusNode: numberNode,
                    prefixIcon: 'assets/icons/img_6.png',
                    hintText: 'Enter your number',
                    hintstyle: TextStyle(
                        color: Color(0xffF9F9F9).withOpacity(0.5),
                        fontSize: 11.w),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter number";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    obscureText: _obscureText && provider.createpassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        provider.createpassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        provider.createpassword = !provider.createpassword;
                        provider.notifyListeners();
                      },
                    ),
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    controller: createController,
                    focusNode: createNode,
                    prefixIcon: 'assets/icons/img_7.png',
                    hintText: 'create password',
                    hintstyle: TextStyle(
                        color: Color(0xffF9F9F9).withOpacity(0.5),
                        fontSize: 11.w),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password  can't be empty";
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    obscureText: _obscureText && provider.retypepassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        provider.retypepassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        provider.retypepassword = !provider.retypepassword;
                        provider.notifyListeners();
                      },
                    ),
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    focusNode: confomNode,
                    prefixIcon: 'assets/icons/img_7.png',
                    hintText: 'conform password',
                    hintstyle: TextStyle(
                        color: Color(0xffF9F9F9).withOpacity(0.5),
                        fontSize: 11.w),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          // activeColor: Colors.green,
                          // focusColor: Colors.blue,
                          // checkColor: Colors.red,
                          value: false,
                          onChanged: (value) {}),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: RichText(
                          maxLines: 3,
                          text: TextSpan(
                            text:
                                'By checking the box, you are agreeing to all of our\n',
                            style: TextStyle(
                              color: Color(0xffF9F9F9).withOpacity(0.5),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms and services  ',
                                style: TextStyle(
                                    color: Color(0xff6FA8FF),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 3.0,
                                    wordSpacing: 2),
                              ),
                              TextSpan(
                                text: 'and  ',
                                style: TextStyle(
                                  color: Color(0xffF9F9F9).withOpacity(0.5),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy.',
                                style: TextStyle(
                                    color: Color(0xff6FA8FF),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 3.0,
                                    wordSpacing: 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomRoundButon(
                      borderRadius: BorderRadius.circular(30),
                      title: 'Register',
                      textStyle: TextStyle(
                        fontSize: 16.w,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      color: Color(0xffEE322E).withOpacity(0.8),
                      onTap: () {
                        // if (formkey.currentState!.validate()) {
                        var name = nameController.text.toString();
                        var email = emailController.text.toString();
                        var number = numberController.text;
                        var password = createController.text.toString();

                        provider.siginUp(password, email);
                        provider.storeData(name, email, password, number);
                      },
                      // },
                      width: 350.w,
                      height: 40.h),
                  SizedBox(
                    height: 30,
                  ),
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
