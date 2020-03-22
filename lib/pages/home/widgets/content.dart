import 'package:challenge/pages/home/widgets/cards_grid.dart';
import 'package:challenge/pages/home/widgets/search.dart';
import 'package:challenge/pages/home/widgets/user_info.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: <Widget>[
          UserInfo(),
          _title(),
          Search(),
          SizedBox(height: 20),
          Center(child: CardsGrid()),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Text(
        "Let's Go",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
