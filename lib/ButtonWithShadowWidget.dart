import 'package:flutter/material.dart';

class ButtonWithShadowWidget extends StatelessWidget {
  const ButtonWithShadowWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.width,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          fixedSize: Size(width, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/getStarted');
        },
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
