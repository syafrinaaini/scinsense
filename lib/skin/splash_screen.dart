import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  List<Map<String, String>> splashData = [
    {
      "title": "SCAN YOUR FACE",
      "text":
          "Analyze your skin condition with our advanced face-scanning technology. Get personalized insights instantly.",
      "image": "assets/scan.jpg", // Sesuaikan dengan path gambar
    },
    {
      "title": "PERSONALIZED SKINCARE",
      "text":
          "Receive customized skincare recommendations based on your unique skin type and concerns.",
      "image": "assets/skinface.jpg", // Sesuaikan dengan path gambar
    },
    {
      "title": "JOIN THE COMMUNITY",
      "text":
          "Connect with others, share experiences, and stay updated with the latest skincare trends in our group.",
      "image": "assets/community.png", // Sesuaikan dengan path gambar
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < splashData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Kembali ke slide pertama
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        splashData[index]["image"]!,
                        height: 250,
                      ),
                      SizedBox(height: 20),
                      Text(
                        splashData[index]["title"]!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        splashData[index]["text"]!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(splashData.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 20 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue[900] : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                // Aksi saat tombol Next ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Next',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
