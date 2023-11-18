import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'Constants.dart';

class InfoSectionWidget extends StatelessWidget {
  const InfoSectionWidget({
    super.key,
    required this.imageOnLeft,
    required this.availableWidth,
    required this.titleText,
    required this.mainBodyText,
    required this.imageAssetPath,
  });

  final double availableWidth;
  final bool imageOnLeft;
  final String imageAssetPath;
  final String titleText;
  final String mainBodyText;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imageOnLeft) ...[
              getImageWidget(imageAssetPath),
              Gap(availableWidth * 0.05),
              getTextWidget(titleText, mainBodyText)
            ] else ...[
              getTextWidget(titleText, mainBodyText),
              Gap(availableWidth * 0.05),
              getImageWidget(imageAssetPath)
            ]
          ],
        ));
  }

  Expanded getTextWidget(String titleText, String mainBodyText) {
    return Expanded(
      flex: 2,
      // Allocate twice the space for text and buttons compared to the image
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                titleText,
                style: TextStyle(
                  color: Constants.PRIMARY_COLOR,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                mainBodyText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Expanded getImageWidget(String imageAssetPath) {
    return Expanded(
      // Flexibly size the image area
      flex: 2,
      child: AspectRatio(
        aspectRatio: 1, // Keep the image square
        child: Image.asset(
          imageAssetPath,
          fit: BoxFit.contain,
        ), // Replace with actual image asset
      ),
    );
  }
}
