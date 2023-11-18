import 'package:flutter/material.dart';

import 'ButtonWithShadowWidget.dart';
import 'Constants.dart';

class CallForAction extends StatelessWidget {
  const CallForAction({
    super.key,
    required this.availableWidth,
  });

  final double availableWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background GIF
          Positioned.fill(
              left: -MediaQuery.of(context).size.width * 0.4,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.asset(
                  'lib/assets/img1.jpg',
                  fit: BoxFit.contain,
                ),
              )),
          // Text and Buttons
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.68,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
        ],
      ),
    );
  }
}
