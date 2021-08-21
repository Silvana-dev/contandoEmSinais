import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_sinais/pages/login.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/splash.png")),
            Text('Welcome...',
                style: TextStyle(fontSize: 33.0, fontWeight: FontWeight.w200))
          ],
        ),
      ),
    );
  }
}
