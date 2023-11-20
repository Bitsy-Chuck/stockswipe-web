import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../AboutUs.dart';
import '../InfoSectionWidget.dart';
import '../IntroSectionWidget.dart';

main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width;
    double availableHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: <Widget>[Container()],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            SizedBox(
              height: availableHeight * 0.05,
              child: Image.asset(
                'lib/assets/logo_temp.png',
                fit: BoxFit.cover,
              ),
            ),
            Gap(20),
            Text(
              'Stockswipe',
              style: TextStyle(
                color: Color(0xFF7F56D9),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 2)
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF7F56D9)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            top: true,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                    height: 900,
                    width: availableWidth,
                    child: IntroSectionWidget()),
                Column(
                  children: [
                    Divider(),
                    SizedBox(
                      height: 700,
                      width: availableWidth,
                      child: InfoSectionWidget(
                        availableWidth: availableWidth,
                        imageOnLeft: false,
                        imageAssetPath: 'lib/assets/img2.png',
                        titleText: 'free. fun. effective.',
                        mainBodyText:
                            'Learning with Stockswipe is fun, and research shows that it works! With quick, bite-sized lessons, you’ll earn points and unlock new levels while gaining real-world trading skills.',
                      ),
                    ),
                    SizedBox(
                      height: 700,
                      width: availableWidth,
                      child: InfoSectionWidget(
                        availableWidth: availableWidth,
                        imageOnLeft: true,
                        imageAssetPath: 'lib/assets/science.png',
                        titleText: 'backed by science.',
                        mainBodyText:
                            'We use a combination of research-backed teaching methods and delightful content to create courses that effectively teach trading skills!',
                      ),
                    ),
                    SizedBox(
                      height: 700,
                      width: availableWidth,
                      child: InfoSectionWidget(
                        availableWidth: availableWidth,
                        imageOnLeft: false,
                        imageAssetPath: 'lib/assets/streak_progress.png',
                        titleText: 'stay motivated.',
                        mainBodyText:
                            'We make it easy to form a habit of learning with game-like features, fun challenges, and reminders. Our trading journel helps you keep track of your trades, so you are better positioned to learn from your mistakes.',
                      ),
                    ),
                    SizedBox(
                      height: 700,
                      width: availableWidth,
                      child: InfoSectionWidget(
                        availableWidth: availableWidth,
                        imageOnLeft: true,
                        imageAssetPath:
                            'lib/assets/different_learning_pace.png',
                        titleText: 'learn at your own pace.',
                        mainBodyText:
                            'Combining the best of AI and science, lessons are tailored to help you learn at just the right level and pace.',
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Column(
                  children: [
                    Divider(),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: availableWidth * 0.1, vertical: 20),
                      height: 300,
                      width: availableWidth,
                      child: AboutUs(availableWidth: availableWidth),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
