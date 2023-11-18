import 'package:flutter/material.dart';

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
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();

  @override
  Widget build(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width;
    double availableHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.language),
        title: Text('Duolingo Clone'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
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
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet. Sed vitae nisi eget nunc ultricies aliquet.',
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
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet. Sed vitae nisi eget nunc ultricies aliquet.',
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
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet. Sed vitae nisi eget nunc ultricies aliquet.',
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
                        titleText: 'learn at your own pave.',
                        mainBodyText:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet. Sed vitae nisi eget nunc ultricies aliquet.',
                      ),
                    ),
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
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
