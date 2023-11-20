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
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Interested? Hit us up!'),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('We are currently in private Beta'),
                                    Text(
                                        'If you are interested in joining, please contact us at: ojasv.singh@stockswipes.com'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("StockSwipe for Business"),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black))),
                // TextButton(
                //     onPressed: () {
                //       return showLicensePage(context: context);
                //     },
                //     child: Text("Privacy Policy"),
                //     style: ButtonStyle(
                //         foregroundColor:
                //             MaterialStateProperty.all<Color>(Colors.black))),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Believe in us? Support us!'),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('We are currently in private Beta'),
                                    Text(
                                        'We are currently not looking for further investors but if you have a proposal,'),
                                    Text(
                                        "do share with us and we will get back to you."),
                                    Text(
                                        "You can contact us at: ojasv.singh@stockswipes.com")
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Investors"),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black))),
                // TextButton(
                //     onPressed: () {
                //       return showLicensePage(context: context);
                //     },
                //     child: Text("Mission"),
                //     style: ButtonStyle(
                //         foregroundColor:
                //             MaterialStateProperty.all<Color>(Colors.black))),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Get in touch!'),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('We are currently in private Beta'),
                                    Text('Reach us at: '),
                                    Text("Email: ojasv.singh@stockswipes.com"),
                                    Text(
                                        "Address: IndiQube Epsilon, PaAmar Jyothi House Building"),
                                    Text("Domlur, Bangalore, Karnataka 560071"),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Contact Us"),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black))),
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
