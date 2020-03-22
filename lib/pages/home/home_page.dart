import 'package:challenge/pages/home/widgets/highlight.dart';
import 'package:challenge/pages/home/widgets/side_bar_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Highlight(),
          SideBarMenu(),
        ],
      ),
    );
  }
}
