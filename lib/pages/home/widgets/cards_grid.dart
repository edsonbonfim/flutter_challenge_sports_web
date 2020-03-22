import 'package:challenge/controllers/HomeController.dart';
import 'package:challenge/pages/home/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CardsGrid extends StatelessWidget {
  final controller = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children:
          HomeController.cards.map<Widget>((card) => MyCard(card)).toList(),
    );
  }
}
