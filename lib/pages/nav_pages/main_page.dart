import 'package:flutter/material.dart';
import 'package:tourist_mate/pages/nav_pages/bar_item.dart';
import 'package:tourist_mate/pages/home_page.dart';
import 'package:tourist_mate/pages/nav_pages/my_page.dart';
import 'package:tourist_mate/pages/nav_pages/search_item.dart';

class MainPage extends StatefulWidget {
   MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItem(),
    SearchPage(),
    MyPage()
  ];

  int currentIndex = 0;

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.apps),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart),label: "Bar"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "My Page"),
          ]
      ),
    );
  }
}
