import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SideBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: double.infinity,
      decoration: _decoration,
      child: _menu(),
    );
  }

  Decoration get _decoration {
    return BoxDecoration(
      color: const Color(0xff241276),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
    );
  }

  Widget _menu() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 50.0),
          child: Image.network(
            "https://i.imgur.com/VhmJ9F5.png?1",
            width: 25.0,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _menuItem(icon: Icons.home, isSelected: true),
              _menuItem(icon: Icons.location_on),
              _menuItem(icon: Icons.add_circle),
              _menuItem(icon: Icons.star),
              _menuItem(icon: Icons.info),
            ],
          ),
        ),
      ],
    );
  }

  Widget _menuItem({IconData icon, bool isSelected = false, Function onTap}) {
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? Colors.white : Color(0xffe2e2e2),
      ),
      onPressed: onTap,
    );
  }
}
