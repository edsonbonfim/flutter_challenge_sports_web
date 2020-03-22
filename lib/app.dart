import 'package:challenge/pages/home/home_page.dart';
import 'package:challenge/pages/home/widgets/content.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Row(
          children: <Widget>[
            HomePage(),
            Expanded(child: Content()),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
