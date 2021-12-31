import 'package:flutter/material.dart';
import 'package:flutter_application_sinais/pages/pagesApp/home.dart';

class PageNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[50],
        leading: IconButton(
          icon: Icon(Icons.cancel_outlined),
          color: Colors.black38,
          alignment: Alignment.centerRight,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.red[50],
        child: ListView(
          children: <Widget>[
            Image(
              image: AssetImage("assets/numbers.png"),
              width: 600,
              height: 600,
            ),
          ],
        ),
      ),
    );
  }
}
