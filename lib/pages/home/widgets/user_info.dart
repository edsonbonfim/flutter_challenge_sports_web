import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _image(),
        _name(),
      ],
    );
  }

  Widget _image() {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQmjNwwfD-F2rVG_MAubdZrmh6ud1TEzrMxzvgNzrk5Urdvdibv",
        ),
        radius: 25.0,
      ),
    );
  }

  Widget _name() {
    return Text(
      "Seja bem vindo, Edson!",
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }
}
