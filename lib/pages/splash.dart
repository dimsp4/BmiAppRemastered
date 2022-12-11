import 'package:bmi_app/pages/calculate/bmi/bmi_home.dart';
import 'package:bmi_app/pages/calculate/calculate_list.dart';
import 'package:bmi_app/pages/homepage.dart';
import 'package:bmi_app/pages/news/news_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _selectedIndex = 0;
  List pages = [
    HomePage(),
    NewsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.pushNamed(context, 'calculate');
        },
        child: Icon(Icons.calculate),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueGrey,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) {
          _selectedIndex = i;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "",
          ),
        ],
      ),
    );
  }
}
