import 'dart:math';

import 'package:flutter/material.dart';

import 'ButtonWithShadowWidget.dart';
import 'Constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
    super.key,
    required this.availableWidth,
  });

  final double availableWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: availableWidth,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                'lib/assets/logo_temp.png',
                fit: BoxFit.contain,
              )),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Other links",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Constants.PRIMARY_COLOR)),
                Text("StockSwipe for Business"),
                Text("Privacy Policy"),
                Text("Investors"),
                Text("Mission"),
                Text("Contact Us")
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Learn Anytime, Anywhere",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.PRIMARY_COLOR,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Replace Gap for consistent spacing
                  ButtonWithShadowWidget(
                      text: "Download on Android",
                      backgroundColor: Color(0xFF7F56D9),
                      textColor: Colors.white,
                      width: availableWidth * 0.3),
                  SizedBox(height: 10), // Replace Gap for consistent spacing
                  ButtonWithShadowWidget(
                      text: "Download on iOS",
                      backgroundColor: Color(0xFF7F56D9),
                      textColor: Colors.white,
                      width: availableWidth * 0.3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
