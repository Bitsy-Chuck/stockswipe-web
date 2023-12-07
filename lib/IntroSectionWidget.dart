import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ButtonWithShadowWidget.dart';

class IntroSectionWidget extends StatelessWidget {
  const IntroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width;
    double availableHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                // Flexibly size the image area
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1, // Keep the image square
                  child: Image.asset(
                    'lib/assets/img3.png',
                    fit: BoxFit.contain,
                  ), // Replace with actual image asset
                ),
              ),
              Gap(availableWidth * 0.05), // Responsive spacing
              Expanded(
                flex: 2,
                // Allocate twice the space for text and buttons compared to the image
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: availableWidth * 0.3,
                      height: availableHeight * 0.3,
                      child: Image.asset(
                        'lib/assets/logo_temp.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      'Swipe, Learn and Trade.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWithShadowWidget(
                            text: 'Get Started',
                            backgroundColor: const Color(0xFF7F56D9),
                            textColor: Colors.white,
                            width: availableWidth * 0.3),
                        const Gap(10),
                        Center(
                          // alignment: Alignment.bottomRight,
                          child: Row(
                            children: [
                              const Text("Charts powered by ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )),
                              InkWell(
                                  onTap: () async {
                                    const url = 'https://in.tradingview.com/';
                                    Uri uri = Uri.parse(url);
                                    if (await canLaunchUrl(uri)) {
                                      await launchUrl(uri);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: const Text("TradingView",
                                      style: TextStyle(color: Colors.blue)))
                            ],
                          ),
                        )
                      ],
                    )

                    // ButtonWithShadowWidget(
                    //     text: 'I Already Have An Account',
                    //     backgroundColor: Colors.white,
                    //     textColor: Color(0xFF7F56D9),
                    //     width: availableWidth * 0.3),
                  ],
                ),
              ),
            ],
          ),
          // const Gap(20),
          // buildCaroselContainer(availableWidth)
        ],
      ),
    );
  }

  Container buildCaroselContainer(double availableWidth) {
    return Container(
      height: 30,
      color: Colors.cyan,
      width: availableWidth,
      child: CarouselSlider(
          items: [
            Card(
              child: Container(
                  child: Row(
                children: [
                  Icon(Icons.access_alarm),
                  Text('Stocks'),
                ],
              )),
              color: Colors.red,
            ),
            Card(
              child: Text('Options'),
            ),
            Card(
              child: Text('Futures'),
            ),
            Card(
              child: Text('Crypto'),
            ),
            Card(
              child: Text('Forex'),
            )
          ],
          options: CarouselOptions(
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            enableInfiniteScroll: true,
            autoPlay: true,
            animateToClosest: true,
            aspectRatio: 2.0,
            //show 5 at a time
            viewportFraction: 0.2,
          )),
    );
  }
}
