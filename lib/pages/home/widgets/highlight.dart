import 'package:challenge/controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class Highlight extends StatefulWidget {
  @override
  _HighlightState createState() => _HighlightState();
}

class _HighlightState extends State<Highlight> with TickerProviderStateMixin {
  AnimationController _animationController;
  final controller = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    GetIt.I.registerSingleton(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Observer(
        builder: (context) => Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.3, 0.5, 0.7],
              colors: controller.card.colors,
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          child: Stack(
            children: <Widget>[
              _image(),
              _info(),
              _push(),
            ],
          ),
        ),
      ),
      builder: (context, child) => Align(
        alignment: Alignment.centerRight,
        widthFactor: 1 - _animationController.value,
        child: Container(
          width: (MediaQuery.of(context).size.width * 0.6) *
              (1 - _animationController.value),
          child: child,
        ),
      ),
    );
  }

  Widget _image() {
    return Center(
      child: Image.network(
        controller.card.image,
        height: (MediaQuery.of(context).size.width * 0.3),
        // fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _push() {
    return GestureDetector(
      onTap: () {
        if (_animationController.isDismissed) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 5.0,
          height: 50.0,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color(0xfffafafa),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _info() {
    return AnimatedBuilder(
      animation: _animationController,
      child: Container(
        margin: const EdgeInsets.only(
          top: 100.0,
          left: 100.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title(),
            _price(),
          ],
        ),
      ),
      builder: (context, child) => Opacity(
        opacity: 1 - _animationController.value,
        child: child,
      ),
    );
  }

  Widget _title() {
    return Observer(
      builder: (context) => Text(
        controller.card.name,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _price() {
    return Text(
      "\$360/person",
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
