// ignore_for_file: unused_import, avoid_web_libraries_in_flutter

import 'dart:html';
import 'package:flutter_application_sinais/pages/pagesApp/chat.dart';
import 'package:flutter_application_sinais/pages/pagesApp/profile.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  int currentIndex = 0;
  late List<Widget> _listPages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPages[currentIndex],
      bottomNavigationBar: buildbottomNavigationBar(),
    );
  }

  @override
  void initState() {
    super.initState();
    _listPages = <Widget>[
      buildBody(),
      Chat(),
      Profile(),
    ];
  }

  buildBody() {
    return Scaffold(
        body: Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 24),
      ),
    ));
  }

  buildbottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white70,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
