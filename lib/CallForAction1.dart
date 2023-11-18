import 'package:flutter/material.dart';

class CallForAction extends StatelessWidget {
  const CallForAction({
    Key? key,
    required this.availableWidth,
  }) : super(key: key);

  final double availableWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'lib/assets/background.jpg',
                    // Replace with actual animated GIF or image path
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  right: MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Learn Anytime, Anywhere",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.purple,
                          // Use a constant for the primary color
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        child: Text("Download on Android"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          // Use a constant for the primary color
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: availableWidth * 0.1, vertical: 15),
                        ),
                        onPressed: () {
                          // Add action for Android download
                        },
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        child: Text("Download on iOS"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          // Use a constant for the primary color
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: availableWidth * 0.1, vertical: 15),
                        ),
                        onPressed: () {
                          // Add action for iOS download
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.purple.shade50,
            // Lighter shade of primary color for footer
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Contact Information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Privacy Policy"),
                    Text("Mission"),
                    Text("Investors"),
                    Text("StockSwipe for Business"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Contact Us"),
                    Text("Phone"),
                    Text("Email"),
                    Text("Address"),
                  ],
                ),
                // Placeholder for extra info or widgets
              ],
            ),
          ),
        ],
      ),
    );
  }
}
