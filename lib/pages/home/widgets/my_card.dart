import 'package:challenge/controllers/HomeController.dart';
import 'package:challenge/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyCard extends StatelessWidget {
  final controller = GetIt.I.get<HomeController>();

  final CardModel card;

  MyCard(this.card);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.setCardModel(card),
      child: Container(
        width: 240.0,
        height: 85.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Stack(
          children: <Widget>[
            Container(
              child: AspectRatio(aspectRatio: 2.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.3, 0.5, 0.7],
                  colors: card.colors,
                ),
              ),
            ),
            Positioned.fill(
              child: Transform.translate(
                offset: Offset(0, -10),
                child: Image.network(
                  card.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                card.name,
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
