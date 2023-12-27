import 'package:flutter/material.dart';

class CustomRoundButon extends StatefulWidget {
  final String title;
  final TextStyle textStyle;
  final Color color;
  final double? width;
  final BoxShadow? shadow;
  final double? height;
  final Border? border;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;

  CustomRoundButon(
      {required this.title,
      required this.textStyle,
      required this.color,
      this.borderRadius,
      required this.onTap,
      this.shadow,
      required this.width,
      required this.height,
      this.border});

  @override
  State<CustomRoundButon> createState() => _CustomRoundButonState();
}

class _CustomRoundButonState extends State<CustomRoundButon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: widget.borderRadius,
          border: widget.border,
        ),
        child: Center(
          child: Text(
            widget.title,
            style: widget.textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
