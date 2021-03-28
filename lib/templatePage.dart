import 'package:flutter/material.dart';
import 'package:log/SettingsUI.dart';
import 'package:log/helpNow.dart';
import 'gridview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    gridview(),
    HelpNow(),
    SettingsUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30), title: Text('Template')),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail, size: 30), title: Text('Help Now')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 30), title: Text('Settings')),
          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.green[900],
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
