// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final TextStyle? hintstyle;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;

  final BorderRadius? borderRadiu;
  final InputDecoration? decoration;
  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;
  final IconButton? suffixIcon;
  final prefixIcon;
  final FocusNode? focusNode;

  final TextStyle? textStyle;
  final Function(String)? onFieldSubmitted;

  CustomTextField({
    this.onChanged,
    this.hintstyle,
    this.decoration,
    this.borderRadiu,
    this.textStyle,
    this.validator,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
    this.textInputAction,
    this.prefixIcon,
    this.keyBoardType,
    this.suffixIcon,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        key: Key(hintText),
        textInputAction: textInputAction,
        keyboardType: keyBoardType,
        readOnly: readOnly,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        style: textStyle,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          hintStyle: hintstyle,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffF9F9F9).withOpacity(0.1), width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffF9F9F9).withOpacity(0.1), width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffF9F9F9).withOpacity(0.1), width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffF9F9F9).withOpacity(0.1), width: 1)),
          filled: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: size.height * 0.02, horizontal: 20),
          hintText: hintText,
          fillColor: Color(0xff473636),
          labelStyle: hintstyle,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null
              ? Transform.scale(
                  scale: 0.5,
                  child: Image.asset(
                    prefixIcon,
                    color: Color(0xffF9F9F9).withOpacity(0.5),
                  ),
                )
              : Text('data'),
        ),
      ),
    );
  }
}
